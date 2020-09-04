package vtc.ui.game;

import java.util.List;
import java.util.Scanner;

import vtc.Util;
import vtc.persistances.Game;

public class GameHelper {
    static Scanner sc = new Scanner(System.in);
    private int offSet;
    private List<Game> gameList;
    private String viewType;

    public GameHelper() {

    }

    public GameHelper(int _offSet, List<Game> _gameList, String _viewType) {
        this.offSet = _offSet;
        this.gameList = _gameList;
        this.viewType = _viewType;
    }

    private void pageNationOfSearch() throws Exception {
        do {
            System.out.print("Enter " + showReportSearch());
            String theChoose = sc.nextLine();
            if (offSet == 0 && gameList.size() == 0) {
                backToGameMenu(theChoose);
                continue;

            }
            if (offSet > 0 && gameList.size() > 0) {
                midPage(theChoose);
                continue;
            }

            if (offSet > 0 && gameList.size() == 0) {
                lastPage(theChoose);
                continue;
            }

            firstPage(theChoose);
        } while (true);
    }

    private void backToGameMenu(String input) throws Exception {
        if (input.equalsIgnoreCase("q")) {
            GameMenu.displayGameMenu();
        }
        if (Util.isEmptyString(input)) {
            System.out.println("Do not input empty!");
            return;
        }
        System.out.println("Wrong input!");
        return;
    }

    public void pagiNation() throws Exception {
        if (viewType.equalsIgnoreCase("search")) {
            pageNationOfSearch();
        }
        do {
            System.out.print("Enter " + showReport());
            String theChoose = sc.nextLine();

            if (offSet > 0 && gameList.size() > 0) {
                midPage(theChoose);
                continue;
            }

            if (offSet > 0 && gameList.size() == 0) {
                lastPage(theChoose);
                continue;
            }

            firstPage(theChoose);
        } while (true);
    }

    public void firstPage(String input) throws Exception {

        if (Util.isEmptyString(input) || input.equals(null)) {
            // throw new Exception("empty input");
            System.out.println("Input do not empty!");
            return; // return to current pagination and re-enter
        }
        if (input.equalsIgnoreCase("n")) {
            // throw new Exception("input is next!");
            offSet += 6;
            new GameHandle().showGame(offSet, viewType);

        }

        if (input.equalsIgnoreCase("q")) {
            // throw new Exception("input is back!");
            GameMenu.displayGameMenu();
        }
        checkInputIsGameIndex(input);

    }

    public void midPage(String input) throws Exception {
        if (Util.isEmptyString(input)) {
            // throw new Exception("empty input");
            System.out.println("Input do not empty!");
            return; // return to current pagination and re-enter
        }
        if (input.equalsIgnoreCase("p")) {
            // throw new Exception("input is back to previousPage!");
            offSet -= 6;
            new GameHandle().showGame(offSet, viewType);
        }
        if (input.equalsIgnoreCase("n")) {
            // throw new Exception("input is next!");
            offSet += 6;
            new GameHandle().showGame(offSet, viewType);
        }
        if (input.equalsIgnoreCase("q")) {
            // throw new Exception("input is back!");
            GameMenu.displayGameMenu();
        }
        checkInputIsGameIndex(input);
    }

    public void lastPage(String input) throws Exception {
        if (Util.isEmptyString(input)) {
            // throw new Exception("empty input");
            System.out.println("Input have to not empty!");
            return;// return to current page
        }
        if (!input.equalsIgnoreCase("p") && !input.equalsIgnoreCase("q")) {
            System.out.println("Your input are not one in these options!");
            return;// return to current page
        }
        if (input.equalsIgnoreCase("q")) {
            // throw new Exception("input is back!");
            GameMenu.displayGameMenu();
        }

        // throw new Exception("input is back to previousPage!");
        offSet -= 6;
        new GameHandle().showGame(offSet, viewType);

    }

    private String showReport() {
        Integer size = gameList.size();
        String index = "" + (offSet + 1) + " - " + (offSet + gameList.size());
        if (offSet > 0 && size > 0) {
            return "(N : next | P : previous | Index : " + index + " | Q : back) : ";
        }
        if (size == 0 && offSet > 0) {
            return "( P : previous | Q : back) : ";
        }

        return "(N : next | Index :  " + index + " | Q : back) : ";
    }

    private String showReportSearch() {
        Integer size = gameList.size();
        String index = "" + (offSet + 1) + " - " + (offSet + gameList.size());
        if (size == 0 && offSet == 0) {
            return "Enter Q to back : ";
        }
        if (size == 0 && offSet > 0) {
            return "( P : previous | Q : back) : ";
        }
        if (offSet > 0 && size > 0) {
            return "(N : next | P : previous | Index : " + index + " | Q : back) : ";
        }

        return "(N : next | Index :  " + index + " | Q : back) : ";
    }

    public void checkInputIsGameIndex(String input) throws Exception {
        Integer parseInt = null;
        try {
            parseInt = Integer.parseInt(input);
        } catch (Exception e) {
            // throw new Exception("input is not one in options!");
            System.out.println("Your input is not one in these options!");
            new GameHelper(offSet, gameList, viewType).pagiNation();// current pagination

        }
        int gameIndex = parseGameIndex(parseInt);
        boolean validIndex = gameIndex != -1 && gameIndex <= offSet + 6 && gameIndex > 0;
        if (validIndex) {
            // throw new Exception("input is game index");
            new ShowGameDetail(gameIndex, offSet, gameList, viewType).showGameDetail();
            ;
        }
        // throw new Exception("Game index not found!");
        System.out.println("Game index not found!");
        new GameHelper(offSet, gameList, viewType).pagiNation(); // current pagination

    }

    private int parseGameIndex(Integer gameIndex) throws Exception {
        int index = -1;
        for (int i = 1; i <= gameList.size(); i++) {
            if (gameIndex.equals(offSet + i)) {
                index = i;
                return index;
            }
        }
        return -1;
    }

}
package vtc.ui.game;

import java.util.List;
import java.util.Scanner;

import vtc.Util;
import vtc.bl.GameBL;
import vtc.persistances.Game;
import vtc.ui.UIUtil;

public class GameHandle {
    static Scanner sc = new Scanner(System.in);
    static List<Game> gameList;
    static String gameName;

    public void showGameByType(String type) throws Exception {
        if (type.equalsIgnoreCase("search")) {
            gameName = enterGameNameToSearch();
        }
        showGame(0, type);
    }

    public void showGame(int offSet, String type) throws Exception {
        
        if (type.equalsIgnoreCase("search")) {
            showGameWithSearch(gameName, offSet);
        }
        gameList = new GameBL().getGameList(offSet);
        ShowGame.showGameList(offSet, gameList);
        GameHelper gameHelper = new GameHelper(offSet, gameList, type, gameName);
        gameHelper.pagiNation();
    }

    private String enterGameNameToSearch() throws Exception {
        String line = "-------------------------------------------------------------";
        String gameName = "";
        UIUtil.clrscr();
        System.out.println(line);
        UIUtil.printHeader(line);
        UIUtil.printTextAlign(line, "Search game");
        System.out.println(line);
        do {
            System.out.print("Enter game name : ");
            gameName = sc.nextLine();
            if (Util.isEmptyString(gameName)) {
                System.out.println("Don't let game name empty or null!\nPlease re-enter!");
            }
        } while (Util.isEmptyString(gameName));
        return gameName;
    }

    private void showGameWithSearch(String gameName, int offSet) throws Exception {
        GameBL gameBL = new GameBL();
        gameList = gameBL.getGameListByName(gameName, offSet);
        ShowGame.showGameList(offSet, gameList);
        GameHelper gameHelper = new GameHelper(offSet, gameList, "search", gameName);
        gameHelper.pagiNation();
    }

}
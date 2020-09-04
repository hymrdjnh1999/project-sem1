package vtc.ui.game;

import java.util.List;
import java.util.Scanner;
import vtc.bl.GameBL;
import vtc.persistances.Game;
import vtc.ui.UIUtil;
import vtc.ui.membership.Membership;

public class ShowGameDetail {
    private List<Game> gameList;
    static Scanner sc = new Scanner(System.in);
    String viewType;
    Integer gameIndex;
    int offSet;
    Game game;

    public ShowGameDetail() {
    }

    public ShowGameDetail(int gameIndex, Integer offSet, List<Game> gameList, String viewType) {
        this.viewType = viewType;
        this.offSet = offSet;
        this.gameIndex = gameIndex;
        this.gameList = gameList;
    }

    public void showGameDetail() throws Exception {
        game = gameList.get(gameIndex - 1);
        String line = "-------------------------------------------------------------------";

        String star = "★          ";

        while (true) {
            Double downloadTimes = (double) new GameBL().getDownloadTimes(game.getGameID());
            String midDetail = game.getVoteRate().toString() + star + game.getGameSize() + "B         "
                    + UIUtil.separatorNumber(downloadTimes) + "";
            String gamePrice = BuyGame.checkGameIsBought(game);
            boolean isGameBought = new GameBL().isGameBought(game.getGameID(), new Membership().getAccount());
            if (!isGameBought) {
                gamePrice = "Install " + gamePrice;
            }
            UIUtil.clrscr();
            System.out.println(line);
            UIUtil.printHeader(line);
            UIUtil.printTextAlign(line, "Game Detail");
            System.out.println(line);
            UIUtil.printTextAlign(line, "");
            UIUtil.printTextAlign(line, game.getGameName());
            UIUtil.printTextAlign(line, "Supplier " + game.getSupplierName());
            UIUtil.printTextAlign(line, "Game Kind " + game.getGameType());
            UIUtil.printTextAlign(line, "");
            System.out.println(line);
            UIUtil.printTextAlign(line, midDetail);
            midDetail = "Rating       Weight        Downloads";
            UIUtil.printTextAlign(line, midDetail);
            System.out.println(line);
            UIUtil.printTextAlign(line, "");
            UIUtil.printTextAlign(line, "[ " + gamePrice + " ]");
            UIUtil.printTextAlign(line, "");
            UIUtil.printTextAlign(line, "About this game ");
            UIUtil.printTextAlign(line, game.getGameDescription());
            UIUtil.printTextAlign(line, "");
            System.out.println(line);
            option();
        }
    }

    private void option() throws Exception {
        while (true) {
            String choose = "";
            boolean isGameBought = new GameBL().isGameBought(game.getGameID(), new Membership().getAccount());
            if (!isGameBought) {
                notBought();
                // break to back current game detail
                break;
            }
            System.out.print("Enter Q to back : ");
            choose = sc.nextLine();
            if (UIUtil.isBack(choose)) {
                new GameHandle().showGame(offSet, viewType);
            }
            System.out.println("Wrong input. Please re-enter!");
        }
        return;

    }

    private boolean isBuyGame(String input) {
        if (input.equalsIgnoreCase("B")) {
            return true;
        }
        return false;
    }

    private void notBought() throws Exception {

        while (true) {
            System.out.print("Enter (B : buy | Q : back): ");
            String choose = sc.nextLine();
            if (UIUtil.isBack(choose)) {
                new GameHandle().showGame(offSet, viewType);
            }
            if (isBuyGame(choose)) {
                new BuyGame().verify(game);
                break;
            }
            System.out.println("Wrong input!");
        }
        return;
        // return back to
        // current game detail after user enter q or checked

    }
}
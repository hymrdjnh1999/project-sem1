package vtc.ui.game;

import java.util.List;
import java.util.Scanner;

import vtc.persistances.Game;
import vtc.ui.UIUtil;

public class ShowGame {
    static Scanner sc = new Scanner(System.in);

    public static void showGameList(Integer offSet, List<Game> gameList) throws Exception {
        String dashLine = "-------------------------------------------------------------------";
        String separatorGame = "|-----------------------------------------------------------------|";
        int i = offSet + 1;
        UIUtil.clrscr();
        System.out.println(dashLine);
        UIUtil.printHeader(dashLine);
        UIUtil.printTextAlign(dashLine, "Game list");
        System.out.println(separatorGame);
        sendNotFoundGameReport(gameList);

        for (Game game : gameList) {
            System.out.printf("| %-2d %-60s |\n", i, game.getGameName());
            System.out.printf("| %-2s %-60s |\n", "", game.getSupplierName());
            System.out.printf("| %-2s %-60s |\n", "", game.getGameType());
            String gameFooter = game.getVoteRate().toString() + "★  " + game.getGameSize() + "B "
                    + BuyGame.checkGameIsBought(game);
            System.out.printf("| %-2s %-60s |\n", "", gameFooter);
            i++;
            System.out.println(dashLine);
        }
    }

    private static void sendNotFoundGameReport(List<Game> gameList) {
        String dashLine = "-------------------------------------------------------------------";

        if (gameList.size() == 0) {
            UIUtil.printTextAlign(dashLine, "Not found game!");
            System.out.println(dashLine);
        }
        return;

    }

}
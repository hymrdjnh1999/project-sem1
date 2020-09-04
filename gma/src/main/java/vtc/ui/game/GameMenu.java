package vtc.ui.game;

import java.util.Scanner;

import vtc.ui.UIUtil;
import vtc.ui.MainMenu;

public class GameMenu {
    static String dashLine = "=====================================================";
    static Scanner sc = new Scanner(System.in);

    public static void displayGameMenu() throws Exception {
        UIUtil.clrscr();
        System.out.println(dashLine);
        UIUtil.printHeader(dashLine);
        UIUtil.printTextAlign(dashLine, "View and search game");
        System.out.println(dashLine);
        System.out.println("| 1. View game list                                 |");
        System.out.println("| 2. Search game                                    |");
        System.out.println("| 0. Back                                           |");
        System.out.println(dashLine);
        gameMenuSwitch();
    }

    static void gameMenuSwitch() throws Exception {
        while (true) {
            System.out.print("Please enter your choose: ");

            String theChoose = sc.nextLine();
            switch (theChoose) {
                case "1":
                    new GameHandle().showGameByType("normal");
                    break;
                case "2":
                    new GameHandle().showGameByType("search");
                    break;
                case "0":
                    UIUtil.clrscr();
                    MainMenu.mainMenu();
                    break;
                default:
                    System.out.println("Wrong input!");
                    continue;

            }
        }

    }

}
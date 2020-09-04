package vtc.ui;

import java.util.Scanner;

import vtc.ui.game.GameMenu;
import vtc.ui.membership.Membership;

public class MainMenu {

    static Scanner sc = new Scanner(System.in);
    private static Membership membership = new Membership();

    public static void mainMenu() throws Exception {
        while (true) {
            UIUtil.clrscr();
            String dashLine = "=====================================================";
            String greeting = "Welcome to game market";
            String report = UIUtil.getTextAlign(dashLine, greeting);

            System.out.println(dashLine);
            UIUtil.printHeader(dashLine);
            System.out.printf(report, "", greeting);
            System.out.println(dashLine);
            UIUtil.printTextNormal(dashLine, "1. Membership and profile");
            UIUtil.printTextNormal(dashLine, "2. View and search game");
            UIUtil.printTextNormal(dashLine, "3. View order history");
            UIUtil.printTextNormal(dashLine, "0. Exit");

            System.out.println(dashLine);
            mainMenuSwitch();
        }

    }

    static void mainMenuSwitch() throws Exception {
        System.out.print("Please enter your choose: ");
        String theChoose = sc.nextLine();
        switch (theChoose) {
            case "1":   
                UIUtil.clrscr();
                membership.loginForm();
                break;
            case "2":
                GameMenu.displayGameMenu();
                break;
            case "0":
                System.exit(1);
                break;
            default:
                System.out.println("Not found the choose. Please re-enter!");
                mainMenuSwitch();
                break;
        }
    }

}

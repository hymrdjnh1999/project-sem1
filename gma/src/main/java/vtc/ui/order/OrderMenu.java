package vtc.ui.order;

import java.util.Scanner;

import vtc.ui.MainMenu;
import vtc.ui.UIUtil;

public class OrderMenu {
    static String dashLine = "=====================================================";
    static Scanner sc = new Scanner(System.in);

    public static void displayOrderMenu() throws Exception {

        UIUtil.clrscr();
        System.out.println(dashLine);
        UIUtil.printHeader(dashLine);
        UIUtil.printTextAlign(dashLine, "View order history");
        System.out.println(dashLine);
        UIUtil.printTextNormal(dashLine, "1. View order");
        UIUtil.printTextNormal(dashLine, "0. Back");
        System.out.println(dashLine);
        orderMenu();

    }

    public static void orderMenu() throws Exception {
        while (true) {
            System.out.print("Please enter your choose: ");
            String theChoose = sc.nextLine();
            switch (theChoose) {
                case "1":
                    new Vieworderhistory().VerifyLogin();
                    displayOrderMenu();
                    break;
                case "0":
                    MainMenu.mainMenu();
                    break;
                default:
                    System.out.println("Wrong input!");
                    break;
            }

        }
    }

}

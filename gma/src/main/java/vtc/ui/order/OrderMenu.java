package vtc.ui.order;

import java.util.Scanner;

import vtc.dal.OrderDAL;
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
    // m tu thiet ke cua m nhe, con t tu van thoi

    public static void orderMenu() throws Exception {
        while (true) {
            System.out.print("Please enter your choose: ");

            String theChoose = sc.nextLine();
            switch (theChoose) {
                case "1":
                    new Vieworderhistory().showOrderList();
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

    private static void enterOrderID(){
        System.out.println("Enter order Id: ");
        String choose = sc.nextLine();
        // OD.getOrder(gameID, accountID, choose);

    }
}

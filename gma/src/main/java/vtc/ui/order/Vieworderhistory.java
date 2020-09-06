package vtc.ui.order;

import java.util.List;
import java.util.Scanner;

import vtc.bl.GameBL;
import vtc.bl.OrderBL;
import vtc.persistances.Account;
import vtc.persistances.Game;
import vtc.persistances.Order;
import vtc.ui.UIUtil;
import vtc.ui.membership.Membership;

public class Vieworderhistory {
    static Scanner sc = new Scanner(System.in);
    public void showOrderList() throws Exception {
        Account account = new Membership().getAccount();
        List<Order> orders = new OrderBL().getOrders(account.getAccountID());
        
        String line = "--------------------------------------------------------------------------------";
        String separatorLine = "|------------------------------------------------------------------------------|";
        UIUtil.clrscr();
        System.out.println(line);
        UIUtil.printHeader(line);
        UIUtil.printTextAlign(line, "Order");
        System.out.println(separatorLine);
        for (Order order: orders) {
            int gameID = order.getGameID();
            Game game = new GameBL().getGameByID(gameID);
            UIUtil.printTextNormal(line, "Order ID : " + order.getOrderID());
            UIUtil.printTextNormal(line, "Game name : " + game.getGameName());
            System.out.println(separatorLine);
        }
        System.out.println(line);
        System.out.print("Enter any key to back...");
        sc.nextLine();
    }
  
}

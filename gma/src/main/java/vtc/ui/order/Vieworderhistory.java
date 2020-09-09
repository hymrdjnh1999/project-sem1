package vtc.ui.order;

import java.util.List;
import java.util.Scanner;

import vtc.bl.GameBL;
import vtc.bl.OrderBL;
import vtc.persistances.Account;
import vtc.persistances.Game;
import vtc.persistances.Order;
import vtc.ui.UIUtil;
import vtc.ui.game.BuyGame;
import vtc.ui.membership.Membership;

public class Vieworderhistory {
    static Scanner sc = new Scanner(System.in);
    private static List<Order> orders;

    public void VerifyLogin() throws Exception {
        String line = "--------------------------------------------------------------------------------";
        while (true) {
            UIUtil.clrscr();
            System.out.println(line);
            UIUtil.printHeader(line);
            if (!isLogin()) {
                UIUtil.printTextAlign(line, "Error reprot");
                System.out.println(line);
                UIUtil.printTextAlign(line, "You must have to login before view order history!");
                System.out.println(line);
                System.out.print("Enter any key to continue...");
                sc.nextLine();
                return;
            }
            Account account = new Membership().getAccount();
            orders = new OrderBL().getOrders(account.getAccountID());
            showOrderList();
        }
    }

    private boolean isLogin() {
        Account account = new Membership().getAccount();
        if (!account.getStatus().equalsIgnoreCase("non-active")) {
            return true;
        }
        return false;
    }

    public void showOrderList() throws Exception {
        String line = "--------------------------------------------------------------------------------";
        String separatorLine = "|------------------------------------------------------------------------------|";
        while (true) {
            UIUtil.clrscr();
            System.out.println(line);
            UIUtil.printHeader(line);
            UIUtil.printTextAlign(line, "Order");
            System.out.println(separatorLine);
            if (orders.size() < 1) {
                UIUtil.printTextAlign(line, "Not found order!");
                System.out.println(line);
                System.out.print("Enter any key to back...");
                sc.nextLine();
                OrderMenu.displayOrderMenu();
            }
            for (Order order : orders) {
                int gameID = order.getGameID();
                Game game = new GameBL().getGameByID(gameID);
                UIUtil.printTextNormal(line, "Order ID : " + order.getOrderID());
                UIUtil.printTextNormal(line, "Game name : " + game.getGameName());
                System.out.println(separatorLine);
            }
            int orderID = handleOrderDetail();
            Order order = getOrder(orderID);
            new BuyGame().showOrderDetail(order);
        }
    }

    int handleOrderDetail() throws Exception {
        int orderID;
        String orderIDInput = "";
        while (true) {
            System.out.print("Enter order id (q to quit) : ");
            try {
                orderIDInput = sc.nextLine();
                orderID = Integer.parseInt(orderIDInput);
                if (isExistOrderID(orderID)) {
                    break;
                }
                System.out.println("Order id not found!");

            } catch (Exception e) {
                if (orderIDInput.equalsIgnoreCase("q")) {
                    OrderMenu.displayOrderMenu();
                }
                System.out.println("Wrong input!");
                continue;
            }
        }
        return orderID;
    }

    boolean isExistOrderID(int orderID) {
        for (Order o : orders) {
            if (o.getOrderID() == orderID) {
                return true;
            }
        }
        return false;
    }

    Order getOrder(int orderID) {
        Order order = new Order();
        for (Order o : orders) {
            if (o.getOrderID() == orderID) {
                order = o;
            }
        }
        return order;
    }

}

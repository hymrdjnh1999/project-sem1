package vtc.ui.game;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

import vtc.Util;
import vtc.bl.AccountBL;
import vtc.bl.GameBL;
import vtc.bl.OrderBL;
import vtc.persistances.Account;
import vtc.persistances.Game;
import vtc.persistances.Order;
import vtc.ui.UIUtil;
import vtc.ui.membership.Membership;

public class BuyGame {
    static Scanner sc = new Scanner(System.in);
    Game game;

    public void verify(Game game) throws Exception {
        this.game = game;
        String line = "---------------------------------------------------------------------";
        String content = "[Do you want get ] : " + game.getGameName() + " with " + UIUtil.getGamePrice(game)
                + " (y/n)? ";
        Account account = new Membership().getAccount();
        UIUtil.clrscr();
        System.out.println(line);
        UIUtil.printHeader(line);
        UIUtil.printTextAlign(line, "Check out buy game");
        System.out.println(line);
        boolean isLogin = account.getStatus().equalsIgnoreCase("active");
        if (!isLogin) {
            reportNotLogin(line);
            // throw new Exception("Have to login before buy game!");
            return; // return to current game detail
        }
        String verify = Util.getYesNo(content);
        if (verify.equalsIgnoreCase("n")) {
            return;// return to current game detail
        }
        if (!checkBalance(game, account)) {
            reportHaveNotEnoughMoney(line);
            return; // return to current game detail
        }
        new AccountBL().subtractMoney(this.game, account.getUserName());
        new GameBL().increaseDownloadTimes(game.getGameID());
        OrderBL orderBL = new OrderBL();
        orderBL.initOrder(game, account);
        Order order = new OrderBL().getCurrentOrder(game.getGameID(), account.getAccountID());
        showOrderDetail(order);
        return; // return to current game detail
    }

    void reportHaveNotEnoughMoney(String line) {
        UIUtil.clrscr();
        System.out.println(line);
        UIUtil.printHeader(line);
        UIUtil.printTextAlign(line, "Buy game fail");
        System.out.println(line);
        UIUtil.printTextAlign(line, "You have not enough money!");
        UIUtil.printTextAlign(line, "Please recharge money before buy game");
        System.out.println(line);
        System.out.print("Enter any key to back...");
        sc.nextLine();
    }

    public void reportNotLogin(String line) throws Exception {
        UIUtil.printTextAlign(line, "[You must to login before buy game!]");
        System.out.println(line);
        System.out.print("Enter any key to login...");
        sc.nextLine();
        UIUtil.clrscr();
        new Membership().loginForm();
        return;
    }

    public void showOrderDetail(Order order) throws Exception {
        Account account = new Membership().getAccount();
        Game game = new GameBL().getGameByID(order.getGameID());
        Date now = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("E MM, yyyy HH:mm aa");
        String line = "--------------------------------------------------------------------------------";
        String separatorLine = "|------------------------------------------------------------------------------|";
        UIUtil.clrscr();
        System.out.println(line);
        UIUtil.printHeader(line);
        UIUtil.printTextAlign(line, "Order Detail");
        System.out.println(separatorLine);
        String date = "Date : " + sdf.format(now);
        UIUtil.printTextNormal(line, "Order ID : " + order.getOrderID());
        UIUtil.printTextNormal(line, "Customer name : " + account.getFullName());
        UIUtil.printTextNormal(line, date);
        System.out.println(separatorLine);
        UIUtil.printTextNormal(line, "Game name : " + game.getGameName());
        String gamePrice = UIUtil.separatorNumber(game.getGamePrice()) + " VND";
        UIUtil.printTextNormal(line, "Price : " + gamePrice);
        UIUtil.printTextNormal(line, "Supplier : " + game.getPublisher());
        System.out.println(separatorLine);
        UIUtil.printTextNormal(line, "Total bill : " + gamePrice);
        UIUtil.printTextNormal(line, "Order status : Paid ");
        System.out.println(line);
        System.out.print("Enter any key to back...");
        sc.nextLine();
    }

    public static String checkGameIsBought(Game game) {
        GameBL gameBL = new GameBL();
        int gameID = game.getGameID();
        boolean isGameBought = gameBL.isGameBought(gameID, new Membership().getAccount());
        if (isGameBought) {
            return "Bought";
        }
        return UIUtil.getGamePrice(game);
    }

    public static boolean checkBalance(Game game, Account account) {
        boolean haveEnoughMoney = account.getMoney() >= game.getGamePrice();
        if (!haveEnoughMoney) {
            return false;
        }
        // subtraction money after account have enough money to buy game
        return true;

    }

}
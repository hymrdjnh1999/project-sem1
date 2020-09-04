package vtc.ui.membership;

import java.util.Scanner;

import vtc.bl.AccountBL;
import vtc.persistances.Account;
import vtc.ui.UIUtil;

public class RechargeMoney {
    static Scanner sc = new Scanner(System.in);
    private static Account account = new Account();
    private static AccountBL accountBL = new AccountBL();

    protected static void rechargeMoney(Account _account) throws Exception {
        Double money;
        account = _account;
        displayBalanceInfo();
        money = enterMoney();
        sendRechargeReport(money);
        UIUtil.backMembershipMenu();
    }

    private static void displayBalanceInfo() {
        String line = "-------------------------------------------------";
        account = accountBL.getAccount(account.getUserName());
        String money = UIUtil.separatorNumber(account.getMoney());

        System.out.println(line);
        UIUtil.printHeader(line);
        UIUtil.printTextAlign(line, "Recharge Money");
        System.out.println(line);

        System.out.printf("| %-45s |\n", "");

        System.out.printf("| %-30s%-15s |\n", "Name", "");
        System.out.printf("| %-30s%-15s |\n", account.getFullName(), "");

        System.out.printf("| %-45s |\n", "");

        System.out.printf("| %-30s%-15s |\n", "Balance", "");
        System.out.printf("| %-45s |\n", money + " VND");

        System.out.printf("| %-45s |\n", "");
        System.out.println(line);
    }

    private static void sendRechargeReport(double _money) throws Exception {
        accountBL.rechargeMoney(account.getUserName(), _money);// add money to account
        String line = "----------------------------------------------------------------";
        UIUtil.clrscr();
        System.out.println(line);
        UIUtil.printHeader(line);
        UIUtil.printTextAlign(line, "Recharge money report!");
        System.out.println(line);
        System.out.printf("| %-60s |\n", "Recharge money successfully!");
        String money = UIUtil.separatorNumber(_money);
        String addMoneyMessage = "+ " + money + "  VND to your wallet";
        System.out.printf("| %-60s |\n", addMoneyMessage);
        System.out.println(line);
    }

    private static Double enterMoney() throws Exception {
        Double money = 0d;

        while (true) {
            System.out.print("Enter money(q : back to membership menu) : ");
            String input = sc.nextLine();
            if (!isValidMoney(input)) {
                System.out.println("Wrong data type input. Please re-enter");
                continue;
            }

            if (!isRangeMoneyValid(input)) {
                System.out.println("Money is can not less than 10.000 and large than 10.000.000 each recharge!");
                continue;
            }
            money = Double.parseDouble(input);
            break;
        }

        return money;
    }

    public static boolean isValidMoney(String input) throws Exception {

        if (!isMoney(input)) {
            return false;
        }
        if (vtc.Util.isEmptyString(input)) {
            return false;
        }

        return true;
    }

    public static boolean isRangeMoneyValid(String input) {
        double money = Double.parseDouble(input);
        double maxMoney = 10000000d;
        double minMoney = 10000d;
        if (money < minMoney || money > maxMoney) {
            return false;
        }
        return true;
    }

    static boolean isMoney(String input) throws Exception {
        try {
            Double.parseDouble(input);
        } catch (Exception e) {
            if (UIUtil.isBack(input)) {
                new Membership().displayMembershipMenu();
            }
            return false;
        }
        return true;
    }
}
package vtc.ui.membership;

import java.util.Scanner;

import vtc.Util;
import vtc.bl.AccountBL;
import vtc.persistances.Account;
import vtc.ui.UIUtil;

public class RechargeMoney {
    static Scanner sc = new Scanner(System.in);
    private static Account account = new Account();
    private static AccountBL accountBL = new AccountBL();

    public void rechargeMoney(Account _account) throws Exception {
        Double money = 0d;
        account = _account;
        UIUtil.clrscr();
        displayBalanceInfo();
        while (true) {
            System.out.print("Enter money(q : quit) : ");
            String input = sc.nextLine();

            try {
                money = Double.parseDouble(input);
                if (!isRangeMoneyValid(input)) {
                    System.out.println("Money is can not less than 10.000 and large than 10.000.000 each recharge!");
                    continue;
                }
                break;// go to check out recharge money
            } catch (Exception e) {
                if (input.equalsIgnoreCase("q")) {
                    return;
                }
                if (Util.isEmptyString(input)) {
                    System.out.println("Please do not let input empty!");
                    continue;
                }
                System.out.println("Do not have your input in these options");
            }

        }
        checkOutRechargeMoney(money);

    }

    private static void checkOutRechargeMoney(Double money) throws Exception {
        String line = "-------------------------------------------------------------------------------";
        UIUtil.clrscr();
        System.out.println(line);
        UIUtil.printHeader(line);
        UIUtil.printTextAlign(line, "Check out recharge money");
        System.out.println(line);
        String yn = Util
                .getYesNo("Do you want recharge [" + UIUtil.separatorNumber(money) + "] VND to your wallet?(y/n) : ");
        if (yn.equalsIgnoreCase("y")) {
            sendRechargeReport(money);
           
        }
        return;
    }

    private static void displayBalanceInfo() {
        String line = "-------------------------------------------------------------------------------";
        account = accountBL.getAccount(account.getUserName());
        String money = UIUtil.separatorNumber(account.getMoney());
        UIUtil.clrscr();
        System.out.println(line);
        UIUtil.printHeader(line);
        UIUtil.printTextAlign(line, "Recharge Money");
        System.out.println(line);
        UIUtil.printTextNormal(line, " ");
        UIUtil.printTextNormal(line, "Name");
        UIUtil.printTextNormal(line, account.getFullName());
        UIUtil.printTextNormal(line, " ");
        UIUtil.printTextNormal(line, "Balance");
        UIUtil.printTextNormal(line, money + " VND");
        UIUtil.printTextNormal(line, " ");
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

    public static boolean isRangeMoneyValid(String input) {
        double money = Double.parseDouble(input);
        double maxMoney = 10000000d;
        double minMoney = 10000d;
        if (money < minMoney || money > maxMoney) {
            return false;
        }
        return true;
    }

}
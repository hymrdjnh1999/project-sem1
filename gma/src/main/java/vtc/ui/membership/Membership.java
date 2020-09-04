package vtc.ui.membership;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Scanner;

import vtc.Util;
import vtc.bl.AccountBL;
import vtc.persistances.Account;
import vtc.ui.UIUtil;
import vtc.ui.MainMenu;

public class Membership {
    static Scanner sc = new Scanner(System.in);
    private static Account account = new Account();

    public Account getAccount() {

        return new AccountBL().getAccount(account.getUserName());
    }

    public void displayMembershipMenu() throws Exception {
        UIUtil.clrscr();

        String dashLine = "=====================================================";
        while (true) {

            System.out.println(dashLine);
            UIUtil.printHeader(dashLine);
            UIUtil.printTextAlign(dashLine, "Membership and profile");
            System.out.println(dashLine);

            System.out.println("| 1. View Profile                                   |");
            System.out.println("| 2. Recharge Money                                 |");
            System.out.println("| 0. Back                                           |");

            System.out.println(dashLine);
            menuSwitch();
        }
    }

    private void menuSwitch() throws Exception {
        System.out.print("Enter your choose : ");
        String theChoose = sc.nextLine();

        switch (theChoose) {
            case "1":
                displayProfileInfo();
                break;
            case "2":
                UIUtil.clrscr();
                RechargeMoney.rechargeMoney(account);
                break;
            case "0":
                MainMenu.mainMenu();
                break;

            default:
                System.out.println("Not have option. Please re-enter!");
                menuSwitch();
                break;
        }

    }

    public void loginForm() throws Exception {

        if (account.getStatus().equalsIgnoreCase("non-active")) {

            String line = "-------------------------------------------------";
            String content = "Login to game market system";

            System.out.println(line);
            UIUtil.printHeader(line);
            UIUtil.printTextAlign(line, content);
            System.out.println(line);
            enterAccount();
        }
        displayMembershipMenu();
    }

    private void enterAccount() throws Exception {
        String username, password;
        while (true) {
            System.out.print("[Username] : ");
            username = sc.nextLine();
            password = readPassword("[Password] :  ");
            if (authentication(username, password)) {
                account = new AccountBL().getAccount(username);
                sendLoginSuccessfullyReport();
                return; // return to menu Membership
            }
        }

    }

    private static String readPassword(String prompt) {
        EraserThread et = new EraserThread(prompt);
        Thread mask = new Thread(et);
        mask.start();
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        String password = "";

        try {
            password = in.readLine();
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }
        // stop masking
        et.stopMasking();
        // return the password entered by the user
        return password;
    }

    public boolean authentication(String username, String password) throws Exception {
        AccountBL accountBL = new AccountBL();
        boolean isAccountValid = !Util.isEmptyString(username) && !Util.isEmptyString(password);
        if (!isAccountValid) {
            // throw new Exception("username or password is empty");
            System.out.println("Username and password is not empty!");
            return false;
        }
        if (!accountBL.DoHaveUserName(username)) {
            System.out.println("Account not found!");
            return false;
        }

        if (!accountBL.isPassword(username, password)) {
            // throw new Exception("Password is wrong!");
            System.out.println("Password is wrong. Please re-enter!");
            return false;
        }
        return true;
    }

    private void sendLoginSuccessfullyReport() throws Exception {
        UIUtil.clrscr();
        String line = "---------------------------------------------------------";
        String reportHello = "Hello " + account.getFullName() + ", Welcome to game store !";
        System.out.println(line);
        UIUtil.printHeader(line);
        System.out.printf("| %-7s%-46s |\n", "", reportHello);
        System.out.println(line);
        System.out.printf("| %-15s%-38s |\n", "", "[Login successfully!]");

        System.out.println(line);
        System.out.print("Enter any key to continue...");
        sc.nextLine();
        return;
    }

    private void displayProfileInfo() throws Exception {
        account = new AccountBL().getAccount(account.getUserName());
        String dashLine = "-------------------------------------------------";
        String separatorLine = "|-----------------------------------------------|";
        String pattern = "dd-MM-yyyy";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        String birthDate = simpleDateFormat.format(account.getBirthDate());
        String dateCreated = simpleDateFormat.format(account.getAccountCreatedDate());
        String money = UIUtil.separatorNumber(account.getMoney());

        UIUtil.clrscr();

        System.out.println(separatorLine);
        UIUtil.printHeader(dashLine);
        UIUtil.printTextAlign(dashLine, "User profile");
        System.out.println(separatorLine);

        System.out.printf("| %-30s%-15s |\n", "Name", "");
        System.out.printf("| %-30s%-15s |\n", account.getFullName(), "");

        System.out.println(separatorLine);

        System.out.printf("| %-30s%-15s |\n", "Birthdate", "");
        System.out.printf("| %-30s%-15s |\n", birthDate.toString(), "");

        System.out.println(separatorLine);

        System.out.printf("| %-30s%-15s |\n", "Address", "");
        System.out.printf("| %-30s%-15s |\n", account.getAddress(), "");

        System.out.println(separatorLine);

        System.out.printf("| %-30s%-15s |\n", "Phone number", "");
        System.out.printf("| %-30s%-15s |\n", account.getPhone(), "");

        System.out.println(separatorLine);

        System.out.printf("| %-30s%-15s |\n", "Email", "");
        System.out.printf("| %-30s%-15s |\n", account.getEmail(), "");

        System.out.println(separatorLine);

        System.out.printf("| %-30s%-15s |\n", "Account created date", "");
        System.out.printf("| %-30s%-15s |\n", dateCreated.toString(), "");

        System.out.println(separatorLine);

        System.out.printf("| %-30s%-15s |\n", "Money", "");
        System.out.printf("| %-45s |\n", money + " VND");

        System.out.println(dashLine);

        UIUtil.backMembershipMenu();
    }
}
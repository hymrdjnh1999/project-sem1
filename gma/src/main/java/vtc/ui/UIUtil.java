package vtc.ui;

import java.util.Scanner;
import java.util.Locale;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;

import vtc.persistances.Game;
import vtc.ui.membership.Membership;

public class UIUtil {
    static Scanner sc = new Scanner(System.in);
    private static Membership membership = new Membership();

    public static void clrscr() {
        try {
            System.out.print("\033[H\033[2J");
            System.out.flush();
            if (System.getProperty("os.name").contains("Windows"))
                new ProcessBuilder("cmd", "/c", "cls").inheritIO().start().waitFor();
            else
                Runtime.getRuntime().exec("clear");
        } catch (IOException | InterruptedException ex) {
        }
    }

    public static String separatorNumber(Double number) {
        DecimalFormat formatter = (DecimalFormat) NumberFormat.getInstance(Locale.US);
        DecimalFormatSymbols symbols = formatter.getDecimalFormatSymbols();
        symbols.setGroupingSeparator('.');
        formatter.setDecimalFormatSymbols(symbols);
        return formatter.format(number.longValue());
    }

    public static String getGamePrice(Game game) {
        double price = game.getGamePrice();
        if (price == 0) {
            return "Free ";
        }
        return UIUtil.separatorNumber(price) + "VND";
    }

    public static void backMembershipMenu() throws Exception {
        System.out.print("Enter Q to back : ");
        while (true) {

            String choose = sc.nextLine();
            switch (choose) {
                case "Q":
                case "q":
                    membership.displayMembershipMenu();
                    break;
                default:
                    System.out.println("Wrong input! please re-enter!");
                    break;
            }
        }
    }

    public static boolean isBack(String input) {
        if (!input.equalsIgnoreCase("Q")) {
            return false;
        }
        return true;
    }

    public static void printHeader(String line) {

        String content = "[GMA] Group 1 - PF10";
        String header = getTextAlign(line, content);
        System.out.printf(header, "", content);
    }

    public static int getPositionMidLine(String line, String content) {
        int positionMidContent = content.length() / 2;
        int positionMidLine = line.length() / 2 - 2;
        int position = positionMidLine - positionMidContent;
        return position;
    }

    private static int getTheRestOfLine(String line, String content) {
        return line.length() - content.length() - 5;
    }

    public static void printTextNormal(String line, String content) {
        int numberTheRestOfLine = getTheRestOfLine(line, content);
        String newContent = "| %-" + content.length() + "s %-" + numberTheRestOfLine + "s |\n";
        System.out.printf(newContent, content, "");
    }

    public static String getTextAlign(String line, String content) {
        int startPoint = UIUtil.getPositionMidLine(line, content);
        int nextPoint = (line.length() - startPoint - 4);
        return "| %-" + startPoint + "s%-" + nextPoint + "s |\n";
    }

    public static void printTextAlign(String line, String content) {
        String report = getTextAlign(line, content);
        // report = "| %-s%-s |"
        System.out.printf(report, "", content);
    }

}

package vtc;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Scanner;

public class Util {
    static Scanner sc = new Scanner(System.in);

    public static boolean isEmptyString(String input) {
        if (input.trim().isEmpty() || input == null) {
            return true;
        }
        return false;
    }
  
    public static String getMD5(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] MessageDigest = md.digest(password.getBytes());
            BigInteger no = new BigInteger(1, MessageDigest);
            String hashText = no.toString(16);

            while (hashText.length() < 32) {
                hashText += "0";

            }
            return hashText;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }

    }

    public static String getYesNo(String content) {
        String yn = "";
        while (true) {
            System.out.print(content);
            yn = sc.nextLine();
            if (yn.equalsIgnoreCase("Y") || yn.equalsIgnoreCase("N")) {
                break;
            }
            System.out.println("Wrong input!");

        }

        return yn;
    }
    public static Integer getIntegerNumber(String content){
        Integer output = null;
        System.out.print(content);
        while(true)
        {
            try {
                output = Integer.parseInt(sc.nextLine());
                break;
            } catch (Exception e) {
                System.out.println("Enter wrong data type. Please re-enter !");
            }
        }
        return output;
    }

}
package vtc.bl;

import vtc.Util;
import vtc.dal.AccountDAL;
import vtc.persistances.Account;
import vtc.persistances.Game;

public class AccountBL {
    private AccountDAL accountDAL = new AccountDAL();
    private Account account = new Account();

    public void subtractMoney(Game game, String userName) {
        accountDAL.accountBuyGame(game, userName);
    }

    public boolean DoHaveUserName(String userName) {
        if (accountDAL.getUserName(userName)) {
            return true;
        }
        return false;
    }

    public Boolean isPassword(String userName, String password) {
        String passwordGet = accountDAL.getPassWord(userName);
        String passwordInputMD5 = Util.getMD5(password);
        if (!passwordGet.equals(passwordInputMD5)) {
            return false;
        }
        return true;
    }

    public Account getAccount(String userName) {
        account = accountDAL.getAccount(userName);
        return account;
    }

    public void rechargeMoney(String userName, Double money) {
        accountDAL.addMoneyToAccount(userName, money);
    }

}
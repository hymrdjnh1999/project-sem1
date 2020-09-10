package vtc.dal;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vtc.persistances.Account;
import vtc.persistances.Game;

public class AccountDAL {

    public void addMoneyToAccount(String userName, Double money) {
        String sql = "{call updateMoney(?,?)}";
        CallableStatement callableStatement = null;
        try (Connection connection = DbUtil.getConnection();) {
            callableStatement = connection.prepareCall(sql);
            callableStatement.setString(1, userName);
            callableStatement.setDouble(2, money);
            callableStatement.execute();
            DbUtil.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean getUserName(String userName) {
        String sql = "{call getUserName(?)}";
        try (Connection connection = DbUtil.getConnection(); CallableStatement cas = connection.prepareCall(sql);) {
            cas.setString(1, userName);
            ResultSet rs = cas.executeQuery();
            if (rs.next()) {
                DbUtil.closeConnection();
                return true;
            }

        } catch (Exception e) {
        }
        return false;
    }

    public String getPassWord(String userName) {

        String sql = "{call getPassword(?)}";
        String password = "";
        try (Connection connection = DbUtil.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(sql);) {

            preparedStatement.setString(1, userName);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                password = rs.getString("pass");
            }
            DbUtil.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return password;
    }

    public Account getAccount(String userName) {

        String sql = "{call getUser(?)}";
        Account account = new Account();
        try {
            Connection connection = DbUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, userName);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                account = setAccountProperties(rs);
            }
            DbUtil.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return account;
    }

    private Account setAccountProperties(ResultSet rs) {
        Account account = new Account();
        try {
            account.setUserName(rs.getString("username"));
            account.setAccountID(rs.getInt("accountID"));
            account.setPassWord(rs.getString("pass"));
            account.setFullName(rs.getString("fullname"));
            account.setBirthDate(rs.getDate("birthday"));
            account.setAddress(rs.getString("address"));
            account.setPhone(rs.getString("phone"));
            account.setMoney(rs.getDouble("money"));
            account.setEmail(rs.getString("mail"));
            account.setAccountCreatedDate(rs.getDate("createDate"));
            account.setStatus("active");

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }

    public void accountBuyGame(Game game, String userName) {
        String sql = "{call buyGame(?,?)}";

        try (Connection con = DbUtil.getConnection(); CallableStatement cas = con.prepareCall(sql);) {
            cas.setDouble(1, game.getGamePrice());
            cas.setString(2, userName);
            cas.execute();
            DbUtil.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
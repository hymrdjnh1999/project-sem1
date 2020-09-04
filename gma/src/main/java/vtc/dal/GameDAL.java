package vtc.dal;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vtc.persistances.Game;

public class GameDAL {
    public List<Game> getAllGames(int offset) {
        String sql = "{call getAllGames(?)}";
        List<Game> gameList = new ArrayList<Game>();
        try {
            Connection connection = DbUtil.getConnection();
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setInt(1, offset);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                gameList.add(getGame(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return gameList;
    }

    public int getDownloadTime(int gameID) {
        String sql = "{call getGameByID(?)}";
        int downloadTimes = -1;
        try {
            Connection connection = DbUtil.getConnection();
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setInt(1, gameID);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                downloadTimes = resultSet.getInt("gameDownloadTimes");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return downloadTimes;
    }

    public void updateDownloadTimes(int gameID) {
        String sql = "call updateTimesDownload(?);";
        try (Connection con = DbUtil.getConnection(); CallableStatement cas = con.prepareCall(sql);) {
            cas.setInt(1, gameID);
            cas.execute();
        } catch (Exception e) {
        }
    }

    public List<Game> getGameByName(String gameName, int offSet) {
        String sql = "{call searchGame(?, ?)}";
        List<Game> gameList = new ArrayList<Game>();
        try {
            Connection connection = DbUtil.getConnection();
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setString(1, gameName);
            callableStatement.setInt(2, offSet);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                gameList.add(getGame(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return gameList;
    }

    public boolean isGameBought(int gameID, int accountID) {
        String sql = "{call getOrder(?,?)}";
        try {
            Connection connection = DbUtil.getConnection();
            CallableStatement cas = connection.prepareCall(sql);
            cas.setInt(1, gameID);
            cas.setInt(2, accountID);
            ResultSet rs = cas.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            return false;
        }
        return false;
    }

    private Game getGame(final ResultSet resultSet) throws SQLException {
        Game game = new Game();
        game.setGameID(resultSet.getInt("gameID"));
        game.setGameDescription(resultSet.getString("description"));
        game.setGamePrice(resultSet.getDouble("gamePrice"));
        game.setGameSize(resultSet.getString("size"));
        game.setGameName(resultSet.getString("gameName"));
        game.setGameDownloadTimes(resultSet.getInt("gameDownloadTimes"));
        game.setVoteRate(resultSet.getFloat("rating"));
        game.setSupplierName(resultSet.getString("supplierName"));
        game.setGameType(resultSet.getString("game type"));
        return game;
    }
}
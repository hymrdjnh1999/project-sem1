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
            DbUtil.closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return gameList;
    }

    public int getPages() {
        String sql = "{call getPages()}";
        int pages = 0;
        try {
            Connection connection = DbUtil.getConnection();
            CallableStatement callableStatement = connection.prepareCall(sql);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                pages++;
            }
            DbUtil.closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return (int) Math.ceil(pages / 6.0);
    }

    public int getPagesBySearch(String gameName) {
        String sql = "{call getPagesBySearch(?)}";
        int pages = 0;
        try {
            Connection connection = DbUtil.getConnection();
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setString(1, gameName);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                pages++;
            }
            DbUtil.closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return (int) Math.ceil(pages / 6.0);
    }

    public Game getGameByID(int gameID) {
        String sql = "{call getGameByID(?)}";
        Game game = new Game();
        try (Connection connection = DbUtil.getConnection();
                CallableStatement callableStatement = connection.prepareCall(sql);) {
            callableStatement.setInt(1, gameID);
            ResultSet resultSet = callableStatement.executeQuery();
            if (resultSet.next()) {
                game = getGame(resultSet);
            }
            DbUtil.closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return game;

    }

    public int getDownloadTime(int gameID) {
        String sql = "{call getTimesBought(?)}";
        int downloadTimes = -1;
        try {
            Connection connection = DbUtil.getConnection();
            CallableStatement callableStatement = connection.prepareCall(sql);
            callableStatement.setInt(1, gameID);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                downloadTimes = resultSet.getInt("timesBought");
            }
            DbUtil.closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return downloadTimes;
    }

    public void updateDownloadTimes(int gameID) {
        String sql = "call updateTimesBought(?);";
        try (Connection con = DbUtil.getConnection(); CallableStatement cas = con.prepareCall(sql);) {
            cas.setInt(1, gameID);
            cas.execute();
            DbUtil.closeConnection();
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
            DbUtil.closeConnection();
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
                DbUtil.closeConnection();
                return true;
            }
        } catch (Exception e) {
            return false;
        }
        return false;
    }

    private Game getGame(final ResultSet resultSet) {
        Game game = new Game();
        try {
            game.setGameID(resultSet.getInt("gameID"));
            game.setGameDescription(resultSet.getString("gameDescription"));
            game.setGamePrice(resultSet.getDouble("gamePrice"));
            game.setGameSize(resultSet.getString("size"));
            game.setGameName(resultSet.getString("gameName"));
            game.setTimesBought(resultSet.getInt("timesBought"));
            game.setVoteRate(resultSet.getFloat("rating"));
            game.setPublisher(resultSet.getString("publisherName"));
            game.setGameType(resultSet.getString("gametype"));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return game;
    }
}
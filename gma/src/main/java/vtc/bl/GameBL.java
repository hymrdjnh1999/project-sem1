package vtc.bl;

import java.util.List;

import vtc.dal.GameDAL;
import vtc.persistances.Account;
import vtc.persistances.Game;

public class GameBL {
    private GameDAL gameDAL = new GameDAL();

    public int getNumberOfPage() {
        int numberOfPage = gameDAL.getPages();
        return numberOfPage;
    }

    public int getNumberOfPageBySearch(String gameName) {
        int numberOfPage = gameDAL.getPagesBySearch(gameName);
        return numberOfPage;
    }

    public List<Game> getGameList(int offset) {
        return gameDAL.getAllGames(offset);
    }

    public List<Game> getGameListByName(String gameName, int offSet) {
        List<Game> gameList = gameDAL.getGameByName(gameName, offSet);
        return gameList;
    }

    public void increaseDownloadTimes(int gameID) {
        gameDAL.updateDownloadTimes(gameID);
    }

    public Game getGameByID(int gameID) {
        Game game = new Game();
        game = gameDAL.getGameByID(gameID);
        return game;
    }

    public int getDownloadTimes(int gameID) {
        int downloadTimes = gameDAL.getDownloadTime(gameID);
        return downloadTimes;
    }

    public boolean isGameBought(int gameID, Account account) {

        if (account.getAccountID() == null) {
            return false;
        }
        if (gameDAL.isGameBought(gameID, account.getAccountID())) {
            return true;
        }
        return false;
    }

}
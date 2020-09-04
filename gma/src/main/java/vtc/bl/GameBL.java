package vtc.bl;

import java.util.List;

import vtc.dal.GameDAL;
import vtc.persistances.Account;
import vtc.persistances.Game;

public class GameBL {
    private GameDAL gameDAL = new GameDAL();

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
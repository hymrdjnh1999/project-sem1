package vtc.persistances;

/**
 * Game
 */
public class Game {
    Integer gameID;
    String gameName;
    String gameDescription;
    Double gamePrice;
    Integer gameDownloadTimes;
    String publisher;
    Float voteRate;
    String gameSize;
    String gameType;
    Integer timesVote;

    public String getGameName() {
        return gameName;
    }

    public Float getVoteRate() {
        return voteRate;
    }

    public Integer getGameID() {
        return gameID;
    }

    public String getGameDescription() {
        return gameDescription;
    }

    public Double getGamePrice() {
        return gamePrice;
    }

    public String getGameSize() {
        return gameSize;
    }

    public Integer getGameDownloadTimes() {
        return gameDownloadTimes;
    }

    public String getPublisher() {
        return publisher;
    }

    public String getGameType() {
        return gameType;
    }

    public Integer getTimesVote() {
        return timesVote;
    }

    public void setGameDescription(String gameDescription) {
        this.gameDescription = gameDescription;
    }

    public void setGameID(Integer gameID) {
        this.gameID = gameID;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public void setGamePrice(Double gamePrice) {
        this.gamePrice = gamePrice;
    }

    public void setGameSize(String gameSize) {
        this.gameSize = gameSize;
    }

    public void setGameDownloadTimes(Integer gameDownloadTimes) {
        this.gameDownloadTimes = gameDownloadTimes;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public void setVoteRate(Float voteRate) {
        this.voteRate = voteRate;
    }

    public void setGameType(String gameType) {
        this.gameType = gameType;
    }

    public void setTimesVote(Integer timesVote) {
        this.timesVote = timesVote;
    }
}

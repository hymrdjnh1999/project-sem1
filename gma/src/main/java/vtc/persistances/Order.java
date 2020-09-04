package vtc.persistances;

public class Order {
    int orderID, accountID, gameID;
    Double priceOfGame, totalBill;
    String createDateTime;
    String orderStatus = "unPaid";

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public void setGameID(int gameID) {
        this.gameID = gameID;
    }

    public void setCreateDateTime(String createDateTime) {
        this.createDateTime = createDateTime;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public void setPriceOfGame(Double priceOfGame) {
        this.priceOfGame = priceOfGame;
    }

    public void setTotalBill(Double totalBill) {
        this.totalBill = totalBill;
    }

    public int getAccountID() {
        return accountID;
    }

    public int getGameID() {
        return gameID;
    }

    public String getCreateDateTime() {
        return createDateTime;
    }

    public int getOrderID() {
        return orderID;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public Double getPriceOfGame() {
        return priceOfGame;
    }

    public Double getTotalBill() {
        return totalBill;
    }

}
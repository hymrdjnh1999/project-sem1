package vtc.persistances;

import java.sql.Date;
import java.sql.Timestamp;

public class Order {
    int orderID, accountID, gameID;
    Double totalBill;
    Timestamp createDateTime;
    String orderStatus = "unPaid";

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public void setGameID(int gameID) {
        this.gameID = gameID;
    }

    public void setCreateDateTime(Timestamp createDateTime) {
        this.createDateTime = createDateTime;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
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

    public Timestamp getCreateDateTime() {
        return createDateTime;
    }

    public int getOrderID() {
        return orderID;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public Double getTotalBill() {
        return totalBill;
    }

}
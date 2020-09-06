
package vtc.bl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import vtc.dal.OrderDAL;
import vtc.persistances.Account;
import vtc.persistances.Game;
import vtc.persistances.Order;

public class OrderBL {
    private OrderDAL orderDAL = new OrderDAL();
  

    public void initOrder(Game game, Account account) throws Exception {
        Order order = new Order();
        String date = "";
        Date now = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("E MM, yyyy HH:mm aa");
        date += sdf.format(now);
        order.setCreateDateTime(date);
        order.setAccountID(account.getAccountID());
        order.setGameID(game.getGameID());
        order.setPriceOfGame(game.getGamePrice());
        order.setTotalBill(game.getGamePrice());
        order.setOrderStatus("paid");
        orderDAL.insertOrder(order);
    }

    public Order getCurrentOrder(int gameID,int accountID) {
        Order order = orderDAL.getCurrentOrder(gameID,accountID);
        return order;
    }

    //
    public List<Order> getOrders(int accountID) {
        List<Order> orders = orderDAL.getOrders(accountID);
        return orders;
    }

}
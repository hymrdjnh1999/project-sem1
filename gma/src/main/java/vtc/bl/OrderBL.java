
package vtc.bl;

import java.util.List;

import vtc.dal.OrderDAL;
import vtc.persistances.Account;
import vtc.persistances.Game;
import vtc.persistances.Order;

public class OrderBL {
    private OrderDAL orderDAL = new OrderDAL();

    public void initOrder(Game game, Account account) throws Exception {
        Order order = new Order();
        order.setAccountID(account.getAccountID());
        order.setGameID(game.getGameID());
        order.setTotalBill(game.getGamePrice());
        order.setOrderStatus("paid");
        orderDAL.insertOrder(order);
    }

    public Order getCurrentOrder(int gameID, int accountID) {
        Order order = orderDAL.getCurrentOrder(gameID, accountID);
        return order;
    }

    public List<Order> getOrders(int accountID) {
        List<Order> orders = orderDAL.getOrders(accountID);
        return orders;
    }

}
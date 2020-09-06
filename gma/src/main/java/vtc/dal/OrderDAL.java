
package vtc.dal;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vtc.persistances.Order;

public class OrderDAL {
    public void insertOrder(Order order) {
        String sql = "{call createOrder(?,?,?,?,?,?)}";
        try (Connection con = DbUtil.getConnection(); CallableStatement cas = con.prepareCall(sql);) {
            cas.setInt(1, order.getAccountID());
            cas.setInt(2, order.getGameID());
            cas.setDouble(3, order.getPriceOfGame());
            cas.setString(4, order.getCreateDateTime());
            cas.setDouble(5, order.getTotalBill());
            cas.setString(6, order.getOrderStatus());
            cas.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Order getCurrentOrder(int gameID, int accountID) {
        String sql = "{call getOrder(?,?)}";
        Order order = new Order();
        try (Connection con = DbUtil.getConnection(); CallableStatement cas = con.prepareCall(sql);) {
            cas.setInt(1, gameID);
            cas.setInt(2, accountID);
            ResultSet rs = cas.executeQuery();
            if (rs.next()) {
                order = getOrder(rs);
            }
        } catch (Exception e) {
        }
        return order;
    }
    
    //
    public List<Order> getOrders( int accountID) {
        List<Order> orders = new ArrayList<>();
        String sql = "{call getOrders(?)}";
        try (Connection con = DbUtil.getConnection(); CallableStatement cas = con.prepareCall(sql);) {
            cas.setInt(1, accountID);
            ResultSet rs = cas.executeQuery();
            while (rs.next()) {
                orders.add(getOrder(rs));
            }
        } catch (Exception e) {
        }
        return orders;
    }
    

    private Order getOrder(ResultSet rs) throws SQLException 
    {
        Order order = new Order();
        order.setOrderID(rs.getInt("orderID"));
        order.setGameID(rs.getInt("gameID"));
        order.setCreateDateTime(rs.getString("orderCreateDate"));
        order.setPriceOfGame(rs.getDouble("priceOfGame"));
        order.setTotalBill(rs.getDouble("totalBill"));
        order.setAccountID(rs.getInt("accountID"));
        order.setOrderStatus(rs.getString("orderStatus"));
        return order;
        
    }



}
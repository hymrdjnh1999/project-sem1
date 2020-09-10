package vtc.dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * DbUtil
 */
public class DbUtil {
    private static Connection connection;
    private static String url = "jdbc:mysql://localhost:3306/gameStore";
    private static String user = "root";
    private static String password = "adolphin123";

    public static Connection getConnection() throws SQLException {
        connection = DriverManager.getConnection(url, user, password);
        return connection;
    }

    public static void closeConnection() throws SQLException {
        connection.close();
    }

}
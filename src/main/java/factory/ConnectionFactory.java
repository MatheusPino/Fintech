package factory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

    private static final String ORACLE_DRIVER = "oracle.jdbc.driver.OracleDriver";
    private static final String ORACLE_URL = "jdbc:oracle:thin:@oracle.fiap.com.br:1521:orcl";
    private static final String USER = "rm557284";
    private static final String PASSWORD = "270605";

    public static Connection getOracleConnection() {
        Connection connection = null;
        try {
            Class.forName(ORACLE_DRIVER);
            connection = DriverManager.getConnection(ORACLE_URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
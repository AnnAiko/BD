package bd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connectionBD {

    //DBC Driver
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    //URL базы данных
    static final String DATABASE_URL = "jdbc:mysql://localhost/classSchedule"; //classSchedule
    //Логин и пароль
    static final String USER = "root";
    static final String PASSWORD = "";

    public Connection connect() throws ClassNotFoundException, SQLException {
        Connection connection = null;
        System.out.println("Регистрация JDBC driver...");
        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("Идет установка соединения...");
        //Установить соединение с базой данных
        connection = DriverManager.getConnection(DATABASE_URL, USER, PASSWORD);
        if (connection != null) {
            System.out.println("Соединение установлено");
        } else {
            System.out.println("Соединение не установлено. Произошла ошибка.");
        }
        //connection.close();
        return connection;
    }

}

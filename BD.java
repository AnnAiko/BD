package bd;

import java.sql.Connection;
import java.sql.SQLException;

public class BD {

    static Connection connection = null;
    
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        //Экземпляр класса
        connectionBD bd = new connectionBD();
        connection = bd.connect();

        getInfo info = new getInfo();
        info.getWeekdayAudience(connection);
        info.getNoWeekdayAudience(connection);
        info.getWeekCountPair(connection);
        info.getWeekCountAudience(connection);
        updateInfo upInfo = new updateInfo();
        upInfo.updateTimePair(connection);
        connection.close();
    }

}

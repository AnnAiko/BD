package bd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class updateInfo {

    /*Перенести первые занятия заданных дней недели на последнее место*/
    public void updateTimePair(Connection connection) throws ClassNotFoundException, SQLException {
        System.out.println("=======================================\n");
        //System.out.println("Вывести дни недели, в которых проводится заданное количество занятий.");
        //Присвоить переменной SQL запрос 
        String SQL = "SELECT *  FROM schedule "
                + "LEFT JOIN subject ON schedule.idSubject=subject.idSubject "
                + "WHERE idWeekday=2"; //idTimePair=1 AND 
        //Полнить SQL запрос
        PreparedStatement preparedStatement = connection.prepareStatement(SQL);
        //Экземпляр класса, описывающий выполнение результата 
        //Получить все данные по запросу 
        ResultSet resultSet = preparedStatement.executeQuery(SQL);
        System.out.println("Пары на вторник: ");
        System.out.println();
        //Пока есть строки
        while (resultSet.next()) {
            System.out.println(resultSet.getString("idTimePair") + " " + resultSet.getString("nameSubject"));
            //System.out.println("----------------------------------------------\n");
        }
        System.out.println();
        SQL = "Update schedule SET idTimePair=? WHERE idTimePair=?";

        preparedStatement = connection.prepareStatement(SQL);
        preparedStatement.setInt(1, 4);
        preparedStatement.setInt(2, 1);
        System.out.println("Rows impacted: " + preparedStatement.executeUpdate());
        System.out.println("Результат после обновления");
        SQL = "SELECT *  FROM schedule "
                + "LEFT JOIN subject ON schedule.idSubject=subject.idSubject "
                + "WHERE idWeekday=2";
        resultSet = preparedStatement.executeQuery(SQL);
        while (resultSet.next()) {
            System.out.println(resultSet.getString("idTimePair") + " " + resultSet.getString("nameSubject"));
        }
    }
}

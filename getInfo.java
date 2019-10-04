package bd;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class getInfo {

    Statement statement = null;

    /*Вывести информацию о преподавателях, 
    работающих в заданный день недели в заданной аудитории.*/
    public void getWeekdayAudience(Connection connection) throws ClassNotFoundException, SQLException {
        System.out.println("Вывести информацию о преподавателях,работающих в заданный день недели в заданной аудитории.");
        //Присвоить переменной SQL запрос 
        String SQL = "SELECT * FROM schedule "
                + "LEFT JOIN teacher ON schedule.idTeacher=teacher.id  "
                + "LEFT JOIN subject ON schedule.idSubject=subject.idSubject "
                + "LEFT JOIN groups ON schedule.idGroup=groups.id "
                + "LEFT JOIN pair ON schedule.idSubject=pair.idSubject AND schedule.idTeacher=pair.idTeacher "
                + "WHERE schedule.idWeekday=? and  schedule.idAudience=? ";
        //Полнить SQL запрос
        PreparedStatement preparedStatementWA = connection.prepareStatement(SQL);
        //Устанавить в нужную позицию значения определённого типа
        preparedStatementWA.setInt(1, 2);
        preparedStatementWA.setInt(2, 2);
        //Экземпляр класса, описывающий выполнение результата 
        //Получить все данные по запросу 
        ResultSet resultSet = preparedStatementWA.executeQuery();
        System.out.println("День недели: Вторник");
        System.out.println("Аудитория: 103");
        System.out.println();
        //Пока есть строки
        while (resultSet.next()) {
            System.out.println("ФИО преподавателя: " + resultSet.getString("fioTeacher"));
            System.out.println("Наименование предмета: " + resultSet.getString("nameSubject"));
            System.out.println("Количество пар в неделю по каждому предмету: " + resultSet.getString("countPair"));
            System.out.println("Количество студентов, занимающихся на каждой паре: " + resultSet.getString("countGroup"));
            System.out.println("----------------------------------------------\n");
        }
        System.out.println("");
    }

    /*Вывести информацию о преподавателях, 
    которые не ведут занятия в заданный день недели.*/
    public void getNoWeekdayAudience(Connection connection) throws ClassNotFoundException, SQLException {
        System.out.println("Вывести информацию о преподавателях, которые не ведут занятия в заданный день недели.");
        //Присвоить переменной SQL запрос 
        String SQL = "SELECT * FROM schedule "
                + "LEFT JOIN teacher ON schedule.idTeacher=teacher.id  "
                + "LEFT JOIN subject ON schedule.idSubject=subject.idSubject "
                + "LEFT JOIN groups ON schedule.idGroup=groups.id "
                + "LEFT JOIN pair ON schedule.idSubject=pair.idSubject AND schedule.idTeacher=pair.idTeacher "
                + "WHERE schedule.idWeekday<>3 ";
        //Полнить SQL запрос
        PreparedStatement preparedStatementNWA = connection.prepareStatement(SQL);
        //Экземпляр класса, описывающий выполнение результата 
        //Получить все данные по запросу 
        ResultSet resultSet = preparedStatementNWA.executeQuery(SQL);
        System.out.println("День недели: Среда");
        System.out.println();
        //Пока есть строки
        while (resultSet.next()) {
            System.out.println("ФИО преподавателя: " + resultSet.getString("fioTeacher"));
            System.out.println("Наименование предмета: " + resultSet.getString("nameSubject"));
            System.out.println("Количество пар в неделю по каждому предмету: " + resultSet.getString("countPair"));
            System.out.println("Количество студентов, занимающихся на каждой паре: " + resultSet.getString("countGroup"));
            System.out.println("----------------------------------------------\n");
        }
    }

    /*Вывести дни недели, в которых
    проводится заданное количество занятий.*/
    public void getWeekCountPair(Connection connection) throws ClassNotFoundException, SQLException {
        System.out.println("Вывести дни недели, в которых проводится заданное количество занятий.");
        //Присвоить переменной SQL запрос 
        String SQL = "SELECT *  FROM weekday WHERE weekday.idWeekday IN "
                + "(SELECT schedule.idWeekday FROM schedule "
                + " GROUP BY idWeekday HAVING COUNT(*)=3)";
        //Полнить SQL запрос
        PreparedStatement preparedStatementWCP = connection.prepareStatement(SQL);
        //Экземпляр класса, описывающий выполнение результата 
        //Получить все данные по запросу 
        ResultSet resultSet = preparedStatementWCP.executeQuery(SQL);
        System.out.println("Количество пар: 3");
        System.out.println();
        //Пока есть строки
        while (resultSet.next()) {
            System.out.println("День недели: " + resultSet.getString("nameWeekday"));
            System.out.println("----------------------------------------------\n");
        }
    }

    /*Вывести дни недели, в которых 
    занято заданное количество аудиторий.*/
    public void getWeekCountAudience(Connection connection) throws ClassNotFoundException, SQLException {
        System.out.println("Вывести дни недели, в которых занято заданное количество аудиторий.");
        //Присвоить переменной SQL запрос 
        String SQL = "SELECT * FROM weekday WHERE weekday.idWeekday IN "
                + "(SELECT schedule.idWeekday FROM schedule "
                + " GROUP BY idWeekday HAVING COUNT(*)=1)";
        //Полнить SQL запрос
        PreparedStatement preparedStatementWCA = connection.prepareStatement(SQL);
        //Экземпляр класса, описывающий выполнение результата 
        //Получить все данные по запросу 
        ResultSet resultSet = preparedStatementWCA.executeQuery(SQL);
        System.out.println("Количество аудиторий: 1");
        System.out.println();
        //Пока есть строки
        while (resultSet.next()) {
            System.out.println("Аудитория: " + resultSet.getString("nameWeekday"));
            System.out.println("----------------------------------------------\n");
        }
    }
}

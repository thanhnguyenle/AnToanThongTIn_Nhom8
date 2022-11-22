package vn.edu.hcmuaf.fit.laptrinhweb.db.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.concurrent.CountDownLatch;

public class TestConnectionPool extends Thread{
    private String taskName;
    private CountDownLatch latch;

    public TestConnectionPool(CountDownLatch latch, String taskName) {
        this.taskName = taskName;
        this.latch = latch;
    }

    @Override
    public void run() {
        System.out.println(Thread.currentThread().getName() + " Starting. Task = " + taskName);
        execute();
        latch.countDown();
        System.out.println(Thread.currentThread().getName() + " Finished.");
    }

    private void execute() {
        try {
            String sqlSelect = "SELECT COUNT(*) AS total FROM Account";
            Connection connection = DBConnection.getConnection();
            try (Statement st = connection.createStatement();
                ResultSet rs = st.executeQuery(sqlSelect);) {
                Thread.sleep(2000);
                rs.next();
                System.out.println("Task = " + taskName + ": Run SQL successfully " + rs.getInt("total"));
            }
            DBConnection.releaseConnection(connection);
        } catch (SQLException | InterruptedException e) {
            e.printStackTrace();
        }
    }
}

class ConnectionPoolExample {

    private static final int NUMBER_OF_USERS = 8;

    public static void main(String[] args) throws SQLException, InterruptedException {
        final CountDownLatch latch = new CountDownLatch(NUMBER_OF_USERS);
        for (int i = 1; i <= NUMBER_OF_USERS; i++) {
            Thread worker = new TestConnectionPool(latch, "" + i);
            worker.start();
        }
        latch.await();
        System.out.println("DONE All Tasks");
    }
}


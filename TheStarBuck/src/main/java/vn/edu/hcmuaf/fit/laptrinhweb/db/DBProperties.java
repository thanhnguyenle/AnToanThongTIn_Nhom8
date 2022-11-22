package vn.edu.hcmuaf.fit.laptrinhweb.db;

import java.io.IOException;
import java.util.Properties;

public class DBProperties {
    private static Properties prop = new Properties();
    static {
        try{
            prop.load(DBProperties.class.getClassLoader().getResourceAsStream("db.properties"));
        }catch (IOException ioException){
            ioException.printStackTrace();
        }
    }
    public static String getDbHost(){
        return prop.get("db.host").toString();
    }
    public static String getDbPort(){
        return prop.get("db.port").toString();
    }
    public static String getDbUsername(){
        return prop.get("db.username").toString();
    }
    public static String getDbPassword(){
        return prop.get("db.password").toString();
    }
    public static String getDbOption(){
        return prop.get("db.options").toString();
    }
    public static String getDbName(){
        return prop.get("db.databaseName").toString();
    }
    public static String getDbUseSSL(){
        return prop.get("db.useSSL").toString();
    }
    public static int getDBMinConnections(){
        return Integer.parseInt(prop.get("db.db_min_connections").toString());
    }
    public static int getDbMaxConnections(){
        return Integer.parseInt(prop.get("db.db_max_connections").toString());
    }





}

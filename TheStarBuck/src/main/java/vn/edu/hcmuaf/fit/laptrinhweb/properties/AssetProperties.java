package vn.edu.hcmuaf.fit.laptrinhweb.properties;

import java.io.IOException;
import java.util.Properties;

public class AssetProperties {
    private static Properties prop = new Properties();

    static {
        try{
            prop.load(AssetProperties.class.getClassLoader().getResourceAsStream("asset.properties"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public static String getBaseUrl(){
        return prop.get("baseUrl").toString();
    }
}

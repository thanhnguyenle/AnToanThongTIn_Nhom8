package vn.edu.hcmuaf.fit.laptrinhweb.controller.web;

import vn.edu.hcmuaf.fit.laptrinhweb.properties.AssetProperties;

public class Asset {
    private static String BASE_URL = AssetProperties.getBaseUrl();
    public static String url(String name){
        return BASE_URL+name;
    }
}

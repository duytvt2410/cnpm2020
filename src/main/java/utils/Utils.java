package utils;

public class Utils {
    static final String HOST = "https://cnpm2020.herokuapp.com/";
    //static final String HOST = "localhost:8080/";
    public static String fullPath(String path) {
        return HOST + path;
    }
}

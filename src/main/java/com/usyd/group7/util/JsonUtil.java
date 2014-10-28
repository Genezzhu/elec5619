package com.usyd.group7.util;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Zhengan Zhu.
 */
public class JsonUtil {
    public static <E,M> Map<E, M> toMap(String json, Class<E> key, Class<M> value) {
        ObjectMapper mapper = new ObjectMapper();

        try{
            Map<E,M> values = mapper.readValue(json, new TypeReference<HashMap<E,M>>(){});
            return values;
        }catch (IOException e){
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        String json = "{\"1\":\"2\"}";
        System.out.println(toMap(json, Integer.class,Integer.class));
    }
}

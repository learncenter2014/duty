package wechat.utils;

import com.sun.corba.se.impl.encoding.OSFCodeSetRegistry;
import wechat.request.LocationEvent;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by wangronghua on 14-4-19.
 */
public class LocationCache {

  private static ConcurrentHashMap<String, LocationEvent> dataMap = new ConcurrentHashMap<String, LocationEvent>();
  private static List<String> keysList = new ArrayList<String>();

  private static final long TIME_OUT_VALUE = 60000;
  private LocationCache(){}

  static {
    Thread thread = new Thread(new Runnable() {
      @Override
      public void run() {
        while(!Thread.interrupted()) {
          try {
            Thread.sleep(TIME_OUT_VALUE);
            synchronized (keysList) {
              long currTime = System.currentTimeMillis();
              Iterator<Map.Entry<String, LocationEvent>> it = dataMap.entrySet().iterator();
              while(it.hasNext()) {
                Map.Entry<String, LocationEvent> entry = it.next();
                String key = entry.getKey();
                LocationEvent event = entry.getValue();
                if( (currTime - event.getCreateTime()*1000) > TIME_OUT_VALUE) {
                  keysList.add(key);
                }
              }

              for(String key : keysList) {
                dataMap.remove(key);
              }
              keysList.clear();
            }
          } catch (InterruptedException e) {
            break;
          }
        }
      }
    }) ;
    thread.setDaemon(true);
    thread.start();
  }

  public static void putLocation(LocationEvent locationEvent) {
    synchronized (keysList) {
      dataMap.put(locationEvent.getFromUserName(), locationEvent);
    }
  }

  public static LocationEvent getLocation(String openID) {
    return dataMap.get(openID);
  }
}

package wechat;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * Created by wangronghua on 14-3-18.
 */
public class URLManager {

  private static final String URL_ACCESSTOKEN = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=%s&secret=%s";

  private static final String URL_MENU_CREATE = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=%s";
  private static final String URL_MENU_GET = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=%s";
  private static final String URL_MENU_DELETE = "https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=%s";

  private static final String URL_OAUTH_REDIRECT = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=%s&redirect_uri=%s&response_type=code&scope=%s&state=STATE#wechat_redirect";


  public static String getUrl_Accesstoken(String appID, String appSecret) {
    return String.format(URL_ACCESSTOKEN, appID, appSecret);
  }

  public static String getUrl_MenuCreate(String accessToken) {
    return String.format(URL_MENU_CREATE, accessToken);
  }

  public static String getUrl_MenuGet(String accessToken) {
    return String.format(URL_MENU_GET, accessToken);
  }

  public static String getUrl_MenuDelete(String accessToken) {
    return String.format(URL_MENU_DELETE, accessToken);
  }

  public static String getUrl_OAuthRedirect(String url, String appID) throws UnsupportedEncodingException {
    return String.format(URL_OAUTH_REDIRECT, appID, URLEncoder.encode(url, "utf-8"), "snsapi_base");
  }

  public static String getUrl_OauthRedirect(String url, String appID, String scope) throws UnsupportedEncodingException {
    return String.format(URL_OAUTH_REDIRECT, appID, URLEncoder.encode(url, "utf-8"), scope);
  }
}
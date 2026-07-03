// ignore_for_file: constant_identifier_names

// const String url = String.fromEnvironment("BASE_URL");
// const String url = "https://rogerwebb.softvencefsd.xyz/api";
const String url = "https://todo.progressivebyte.com";

final class NetworkConstants {
  NetworkConstants._();
  static const ACCEPT = "Accept";
  static const APP_KEY = "App-Key";
  static const ACCEPT_LANGUAGE = "Accept-Language";
  static const ACCEPT_LANGUAGE_VALUE = "pt";
  static const APP_KEY_VALUE = String.fromEnvironment("APP_KEY_VALUE");
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const CONTENT_TYPE = "content-Type";
}

final class Endpoints {
  Endpoints._();
  //backend_url
  static String register() => "/api/v1/auth/register";
  static String logIn() => "/api/v1/auth/login";
  static String getTodos() => "/api/v1/todos";

  static String logOut() => "/api/v1/auth/logout";

  static String getNotifications() => "/api/v1/notifications";
  // static String getNotificationSparkComplete(int sparkId) =>
  //     "/sparks/$sparkId/complete";
}

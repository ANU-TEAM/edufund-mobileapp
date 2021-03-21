class AppUrl {
  static const String liveBaseURL = "https://edufundanu.herokuapp.com/api";
  static const String localBaseURL = "http://192.168.0.21:8002/api";

  static const String baseURL = localBaseURL;

  static const String login = baseURL + "/login";
  static const String register = baseURL + "/register";
  static const String forgotPassword = baseURL + "/forgot-password";
  static const String applications = baseURL + "/applications";
  static const String userApplications = baseURL + "/user/applications";
}

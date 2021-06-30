class AppUrl {
  // static const String liveBaseURL = "http://your-live-url/api";
  // static const String localBaseURL = "http://192.168.1.102:8001/api";
  static const String liveBaseURL =
      "https://edufund-backend-xgqq6.ondigitalocean.app/";
  // static const String localBaseURL = "http://192.168.43.188:8001/api";

  static const String baseURL = liveBaseURL;

  static const String login = baseURL + "/login";
  static const String register = baseURL + "/register";
  static const String forgotPassword = baseURL + "/forgot-password";
  static const String applications = baseURL + "/applications";
  static const String feedbacks = baseURL + "/feedbacks";
  static const String userApplications = baseURL + "/user/applications";
  static const String schools = baseURL + "/schools";
}

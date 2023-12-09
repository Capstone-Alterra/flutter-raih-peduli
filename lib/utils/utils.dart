class Urls {
  static const String baseUrl = "https://raihpeduli.my.id";
  static const String signUp = "/auth/register";
  static const String signIn = "/auth/login";
  static const String verifikasiOtp = "/users/verify";
  static const String reSendOtp = "/auth/resend-otp";
  static const String forgetPassword = "/auth/resend-otp";
  static const String otpForgetPassword = "/users/verify-otp";
  static const String ubahPassword = "/users/reset-password";
  static const String fetchAllNews = "/news?page=1&page_size=10";
  static const String searchNews = "/news?page=1&page_size=10&title=";
  static const String profile = "/mobile/users/my-profile";
  static const String fetchAllFundraises = "/fundraises?page=1&page_size=5";
  static const String fetchFundraisesPagination = "/fundraises?page=";
  static const String fetchAllVolunteer = "/volunteer-vacancies";
  static const String searchVolunteer = "/volunteer-vacancies?title=";
  static const String chatBot = "/chatbots";
  static const String historyAll = "/history";
}

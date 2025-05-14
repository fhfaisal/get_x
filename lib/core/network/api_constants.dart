class ApiConstants {
  static const String baseUrl = 'https://creed.analyzenbd.com/api';
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);

  // API Endpoints
  static const String login = '$baseUrl/auth/manual/sign-in';
  static const String register = '$baseUrl/auth/manual/sign-up';
  static const String search = '/business/search-box';
  static const String nearbyBusiness = 'business/nearby';
}
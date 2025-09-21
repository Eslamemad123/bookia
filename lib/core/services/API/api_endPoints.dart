import 'dart:developer';

import 'package:bookia/features/Home/data/Repo/home_repo.dart';

class API_EndPoint {
  // Auth

  static const String baseURL = 'https://codingarabic.online/api';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgetPassword = '/forget-password';
  static const String OTP = '/check-forget-password';
  static const String newPassword = '/reset-password';

  //Home
  static const String BestSaller = '/products-bestseller';
  static const String NewArrivals = '/products-new-arrivals';
  static const String AllBooks = '/products';

  static const String Slider = '/sliders';
  static const String Search = '/products-search?name=';
  static const String SearchWithfilter = '/products-filter';


}

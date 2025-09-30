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

  //wish list
  static const String AddWishList = '/add-to-wishlist';
  static const String RemoveWishList = '/remove-from-wishlist';
  static const String GetWishList = '/wishlist';
  //Cart
  static const String AddCart = '/add-to-cart';
  static const String RemoveCart = '/remove-from-cart';
  static const String GetCart = '/cart';
  static const String UpdateCart = '/update-cart';

  //check out

  static const String CheckOut = '/checkout';
  static const String Placeorder = '/place-order';
  static const String OrderHistory = '/order-history';
  static const String SingleOrderHistory = '/order-history/472';

  //profile
  static const String updateProfile = '/update-profile';
  static const String showProfile = '/profile';
  static const String updatePassword = '/update-password';
  static const String deleteAccount = '/delete-profile';
  static const String orderHistory = '/order-history';
  static const String FAQ = '/faqs';
  static const String logOut = '/logout';
}

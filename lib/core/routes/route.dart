import 'package:bookia/features/Cart/Presentation/pages/SucseccScreen.dart';
import 'package:bookia/features/Cart/Presentation/pages/pleaceOrder.dart';
import 'package:bookia/features/Home/data/model/books_response/product.dart';
import 'package:bookia/features/Home/presentation/pages/DetailsBook.dart';
import 'package:bookia/features/Home/presentation/pages/search/page/search.dart';
import 'package:bookia/features/Home/presentation/pages/seeAll.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/pages/forgetPassword/OTP.dart';
import 'package:bookia/features/auth/presentation/pages/forgetPassword/forgetPassword.dart';
import 'package:bookia/features/auth/presentation/pages/forgetPassword/newPassword.dart';
import 'package:bookia/features/auth/presentation/pages/forgetPassword/passChanged.dart';
import 'package:bookia/features/auth/presentation/pages/login/page/loginScreen.dart';
import 'package:bookia/features/auth/presentation/pages/register/Register.dart';
import 'package:bookia/features/Home/presentation/pages/home.dart';
import 'package:bookia/features/main/presentation/page/main_screen.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_Cubit.dart';
import 'package:bookia/features/profile/presentation/page/deleteAccount.dart';
import 'package:bookia/features/profile/presentation/page/editProfile.dart';
import 'package:bookia/features/profile/presentation/page/orderHistory.dart';
import 'package:bookia/features/profile/presentation/page/updatePassword.dart';
import 'package:bookia/features/splash/page/splash.dart';
import 'package:bookia/features/welcom/welcom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String splash = '/';
  static const String Main = '/main';
  static const String welcom = '/welcom';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgetPassword = '/forget_password';
  static const String OTP = '/otp';
  static const String passwordChanged = '/password_changed';
  static const String createNewPassword = '/new_password';
  static const String Home = '/home';
  static const String SeeAll = '/see_all';
  static const String search = '/search';
  static const String Details = '/details';
  static const String PlaceOrder = '/place_order';
  static const String Sucsecc = '/sucsecc';
  static const String deleteAccount = '/delete_account';
  static const String editProfile = '/edit_profile';
  static const String orderHistory = '/order_history';
  static const String UpdatePassword = '/update_password';

  static final routes = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => SplashScreen()),
      GoRoute(path: welcom, builder: (context, state) => Welcom_Screen()),
      GoRoute(
        path: login,
        builder:
            (context, state) => BlocProvider(
              create: (context) => Auth_Cubit(),
              child: Login_Screen(),
            ),
      ),
      GoRoute(
        path: register,
        builder:
            (context, state) => BlocProvider(
              create: (context) => Auth_Cubit(),
              child: Register_Screen(),
            ),
      ),
      GoRoute(
        path: forgetPassword,
        builder:
            (context, state) => BlocProvider(
              child: ForgetPass_Screen(),
              create: (context) {
                return Auth_Cubit();
              },
            ),
      ),
      GoRoute(
        path: OTP,
        builder:
            (context, state) => BlocProvider(
              child: OTP_Screen(),
              create: (context) {
                return Auth_Cubit();
              },
            ),
      ),
      GoRoute(
        path: createNewPassword,
        builder: (context, state) {
          final otp =
              state.extra as TextEditingController; 

          return BlocProvider(
            child: NewPassword_Screen(otp: otp),
            create: (context) {
              return Auth_Cubit();
            },
          );
        },
      ),
      GoRoute(
        path: passwordChanged,
        builder: (context, state) => PassChanged_Screen(),
      ),
      GoRoute(
        path: Main,
        builder: (context, state) {
          return Main_Screen(initialIndex: state.extra as int?);
        },
      ),
      GoRoute(path: Home, builder: (context, state) => Home_Screen()),
      GoRoute(
        path: SeeAll,
        builder: (context, state) {
          final extras = state.extra as Map<String, dynamic>;
          final product = extras['product'] as List<Product>;
          final title = extras['title'] as String;

          return See_All(product: product, title: title);
        },
      ),
      GoRoute(path: search, builder: (context, state) => Search_Book()),
      GoRoute(
        path: Details,
        builder: (context, state) {
          var data = state.extra as Map<String, dynamic>;
          return Details_Book(product: data['product'], title: data['sourse']);
        },
      ),
      GoRoute(
        path: PlaceOrder,
        builder: (context, state) {
          return Pleace_Order(Total: state.extra as String);
        },
      ),
      GoRoute(path: Sucsecc, builder: (context, state) => Sucsecc_Screen()),

      GoRoute(
        path: deleteAccount,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => Profile_Cubit(),
            child: Delete_Account(),
          );
        },
      ),
      GoRoute(
        path: editProfile,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => Profile_Cubit(),
            child: EditProfile_Screen(),
          );
        },
      ),

      GoRoute(
        path: UpdatePassword,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => Profile_Cubit(),
            child: UpdatePAssword(),
          );
        },
      ),
      GoRoute(
        path: orderHistory,
        builder: (context, state) {
          return OrderHistory();
        },
      ),
    ],
  );
}

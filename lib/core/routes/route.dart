import 'package:bookia/features/Home/data/model/books_response/product.dart';
import 'package:bookia/features/Home/presentation/pages/search/page/search.dart';
import 'package:bookia/features/Home/presentation/pages/seeAllProducts.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/pages/forgetPassword/OTP.dart';
import 'package:bookia/features/auth/presentation/pages/forgetPassword/forgetPassword.dart';
import 'package:bookia/features/auth/presentation/pages/forgetPassword/newPassword.dart';
import 'package:bookia/features/auth/presentation/pages/forgetPassword/passChanged.dart';
import 'package:bookia/features/auth/presentation/pages/login/page/loginScreen.dart';
import 'package:bookia/features/auth/presentation/pages/register/Register.dart';
import 'package:bookia/features/Home/presentation/pages/home.dart';
import 'package:bookia/features/main/presentation/page/main_screen.dart';
import 'package:bookia/features/splash/page/splash.dart';
import 'package:bookia/features/welcom/welcom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
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
              state.extra as TextEditingController; // 👈 استقبل الـ OTP هنا

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
      GoRoute(path: Main, builder: (context, state) => Main_Screen()),
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

    ],
  );
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/transition.dart';
import 'package:task/uis/Forget_page/forget_page.dart';
import 'package:task/uis/Register_page/payment_screen.dart';
import 'package:task/uis/Register_page/register_page.dart';
import 'package:task/uis/Register_page/sign_up_page.dart';
import 'package:task/uis/bottomPages/directory_page.dart';
import 'package:task/uis/bottomPages/edit_profile.dart';
import 'package:task/uis/login/auth_view_model.dart';
import 'package:task/uis/login/login_page.dart';
import 'package:task/uis/pages/bottom_page.dart';
import 'package:task/uis/pages/contact_professional_page.dart';
import 'package:task/uis/pages/dashboard_view_model.dart';
import 'package:task/uis/pages/home_page.dart';
import 'package:task/uis/pages/profile_1_page.dart';

class RouteHelper with Transitions {
  final _auth = AuthViewModel();
  final _dashboard = DashBoardViewModel();
  Map<String, WidgetBuilder> createRoutes() {
    return {
      LoginPage.route: (_) => ChangeNotifierProvider.value(
            value: _auth,
            child: const LoginPage(),
          ),
      RegisterPage.route: (_) => ChangeNotifierProvider.value(
            value: _auth,
            child: const RegisterPage(),
          ),
      SignUpPage.route: (_) => ChangeNotifierProvider.value(
            value: _auth,
            child: const SignUpPage(),
          ),
      EditProfile.route: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: _dashboard),
              ChangeNotifierProvider.value(value: _auth),
            ],
            child: const EditProfile(),
          ),
      PaymentScreen.route: (_) => ChangeNotifierProvider.value(
            value: _auth,
            child: const PaymentScreen(),
          ),
      ForgetPage.route: (_) => ChangeNotifierProvider.value(
            value: _auth,
            child: const ForgetPage(),
          ),
      DirectoryPage.route: (_) => ChangeNotifierProvider.value(
            value: _dashboard,
            child: const DirectoryPage(),
          ),
      ProfileNextPage.route: (_) => ChangeNotifierProvider.value(
            value: _dashboard,
            child: const ProfileNextPage(),
          ),
      ContactPage.route: (_) => ChangeNotifierProvider.value(
            value: _dashboard,
            child: const ContactPage(),
          ),
      HomePage.route: (_) => ChangeNotifierProvider.value(
            value: _dashboard,
            child: const HomePage(),
          ),
      DashBoardScreen.route: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: _dashboard),
              ChangeNotifierProvider.value(value: _auth),
            ],
            child: const DashBoardScreen(),
          ),
    };
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:task/data/local/sharedPrefHelper.dart';
import 'package:task/route_helper.dart';
import 'package:task/uis/login/login_page.dart';
import 'package:task/uis/pages/bottom_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.init();
  Stripe.publishableKey =
      'pk_test_51MTxjISBqFEsYuDzgUmwlFYeLgIzMqr71vI8hQLrNAxZD9MQNhSdztI0jYhbU1plcRct9mRwUZ4SvD6gU9ONiN1J00m4NvMzoz';
  await Stripe.instance.applySettings();

  runApp(
    Provider<RouteHelper>(
      create: (_) => RouteHelper(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FWB',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primaryColor: AppColors.appTheme,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.black.withOpacity(0),
        ),
      ),
      routes: context.read<RouteHelper>().createRoutes(),
      initialRoute: _getInitialRoute(),
    );
  }

  String _getInitialRoute() {
    if (SharedPrefHelper.isLoggedIn) {
      return DashBoardScreen.route;
    } else {
      return LoginPage.route;
    }
  }
}

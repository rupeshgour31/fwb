import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/data/local/sharedPrefHelper.dart';
import 'package:task/uis/Create_page/create_page.dart';
import 'package:task/uis/Forget_page/forget_page.dart';
import 'package:task/uis/login/auth_view_model.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/constant.dart';
import 'package:task/utils/loading_screen.dart';

import '../pages/background_image.dart';

class LoginPage extends StatefulWidget {
  static const String route = 'LoginPage';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    bool isRemember = SharedPrefHelper.passRemember;
    if (isRemember) {
      setState(() {
        userNameController.text = SharedPrefHelper.username;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Form(
                key: key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 110,
                    ),
                    Image.asset(
                      "assets/images/1-1 1.png",
                      height: 190,
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      cursorColor: const Color(0xFF323232),
                      controller: userNameController,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Email or username',
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter email or username';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      cursorColor: const Color(0xFF323232),
                      controller: passwordController,
                      obscureText: true,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Password',
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(height: 15),
                    rememberAndForgotPass(),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "LOGIN",
                            style: kButtonStyle,
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            color: kTextColor,
                            size: 20,
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kAppColor,
                        elevation: 0,
                        fixedSize: const Size(140, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          Map<String, String> param = {
                            "username": userNameController.text,
                            "password": passwordController.text,
                          };
                          context
                              .read<AuthViewModel>()
                              .loginReq(context, param, valuefirst);
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 20),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Don’t have an account? ",
                              style: kRichTextStyle,
                            ),
                            TextSpan(
                              text: "Sign Up now.",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CreatePage(),
                                        ),
                                      ),
                                    },
                              style: kRichTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const LoadingIndicatorConsumer<AuthViewModel>(),
        ],
      ),
    );
  }

  bool valuefirst = false;

  Widget rememberAndForgotPass() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            valuefirst = !valuefirst;
            if (mounted) setState(() {});
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              valuefirst
                  ? Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        color: AppColors.greyColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.check,
                        color: AppColors.appTheme1,
                      ),
                    )
                  : Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        color: AppColors.greyColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
              const Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  "remember me",
                  style: TextStyle(
                      fontSize: 15,
                      color: kTextColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Source Sans Pro'),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          child: const Text(
            "Forgot password?",
            style: TextStyle(
              fontSize: 15,
              color: kTextColor,
              fontWeight: FontWeight.w600,
              fontFamily: 'Source Sans Pro',
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, ForgetPage.route);
          },
        ),
      ],
    );
  }
}

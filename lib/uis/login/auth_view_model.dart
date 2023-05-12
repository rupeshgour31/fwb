import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:task/data/local/sharedPrefHelper.dart';
import 'package:task/data/remote/models/payment_detail.dart';
import 'package:task/data/remote/models/plan_info_model.dart';
import 'package:task/data/remote/url_constants.dart';
import 'package:task/data/repo/auth_repo.dart';
import 'package:task/uis/Register_page/payment_screen.dart';
import 'package:task/uis/login/login_page.dart';
import 'package:task/uis/pages/bottom_page.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/constant.dart';
import 'package:task/utils/view_model.dart';

class AuthViewModel extends ViewModel {
  PlanData? planInfo;

  void loginReq(context, params, isRemember) {
    callApi(() async {
      final response = await AuthRepo.loginCall(params);
      notifyListeners();
      if (response.status == 1) {
        showToast(response.message, AppColors.greenColor);
        SharedPrefHelper.authToken = response.data['data']['token'];
        SharedPrefHelper.isLoggedIn = true;
        SharedPrefHelper.passRemember = isRemember;
        if (isRemember) {
          SharedPrefHelper.username = params['username'];
        }
        Navigator.pushNamedAndRemoveUntil(
          context,
          DashBoardScreen.route,
          (route) => false,
        );
      } else {
        showToast(response.message, AppColors.redColor);
      }
    });
  }

  void registrationReq(context, params, selected) {
    callApi(() async {
      final response = await AuthRepo.registrationCall(params);
      notifyListeners();
      if (response.status == 1) {
        showToast(response.message, AppColors.greenColor);
        SharedPrefHelper.authToken = response.data['data']['token'];
        SharedPrefHelper.isLoggedIn = true;
        Navigator.pushNamed(
          context,
          PaymentScreen.route,
          arguments: selected,
        );
      } else {
        showToast(response.message, AppColors.redColor);
        errorDialog(context, response.error);
      }
    });
  }

  void editProfileReq(context, params, XFile? image) async {
    if (image != null) {
      await updateProfileImage(image);
    }
    callApi(() async {
      final response = await AuthRepo.editProfileCall(params);
      notifyListeners();
      if (response.status == 1) {
        showToast(response.message, AppColors.greenColor);
        Navigator.pop(context, 'refresh');
      } else {
        showToast(response.message, AppColors.redColor);
        errorDialog(context, response.error);
      }
    });
  }

  updateProfileImage(XFile file) async {
    Map<String, String> header = {
      'Authorization': "Bearer ${SharedPrefHelper.authToken}",
      'username': "${SharedPrefHelper.userEmail}",
      'Content-Type': 'application/json',
    };
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
        Endpoints.baseURL + Endpoints.updateUserProfileUrl,
      ),
    );

    request.files.add(
      await http.MultipartFile.fromPath(
        'profile_image',
        file.path,
        filename: file.path,
      ),
    );
    request.headers.addAll(header);
    isLoading = true;
    http.StreamedResponse response = await request.send();
    isLoading = false;

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  void forgotPasswordReq(context, emailUsername) {
    Map<String, dynamic> body = {
      "email": emailUsername,
    };
    callApi(() async {
      final response = await AuthRepo.forgotPasswordCall(body);
      notifyListeners();
      if (response.status == 1) {
        showToast(response.message, AppColors.greenColor);
        Navigator.pop(context);
      } else {
        showToast(response.message, AppColors.redColor);
      }
    });
  }

  void logoutReq(context) {
    callApi(() async {
      final response = await AuthRepo.logoutCall();
      notifyListeners();
      if (response.status == 1) {
        showToast(response.message, AppColors.greenColor);
        SharedPrefHelper.isLoggedIn = false;
        Navigator.pushNamedAndRemoveUntil(
          context,
          LoginPage.route,
          (route) => false,
        );
      } else {
        showToast(response.message, AppColors.redColor);
      }
    });
  }

  Map<String, dynamic>? paymentIntentData;

  Future<void> makePayment(amount, context) async {
    try {
      paymentIntentData = await createPaymentIntent('$amount', 'USD');
      await Stripe.instance
          .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              setupIntentClientSecret:
                  'sk_test_51MTxjISBqFEsYuDzv5GhYmFpRDDMoY7lFVcDoUUykyPKJyQ3uN9csS9AyIxLACNjkotqpxYcg2SjCm1VC6J8Yqyg00MlFE7P7t',
              paymentIntentClientSecret: paymentIntentData!['client_secret'],
              // applePay: const PaymentSheetApplePay(
              //   merchantCountryCode: '+91',
              // ),
              googlePay: const PaymentSheetGooglePay(
                merchantCountryCode: '+91',
                testEnv: true,
              ),
              // testEnv: true,
              customFlow: true,
              style: ThemeMode.dark,
              customerId: paymentIntentData!['customer'],
              customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
              // merchantCountryCode: 'US',
              merchantDisplayName: 'Kashif',
            ),
          )
          .then((value) {});

      ///now finally display payment sheeet
      displayPaymentSheet(context);
    } catch (e, s) {
      debugPrint('Payment exception:$e$s');
    }
  }

  displayPaymentSheet(context) async {
    try {
      await Stripe.instance
          .presentPaymentSheet(
        options: const PaymentSheetPresentOptions(
            // clientSecret: paymentIntentData!['client_secret'],
            // confirmPayment: true,
            ),
      )
          .whenComplete(() {
        print('DONE DONE DONE DONE DONE DONE');
      }).then((newValue) {
        debugPrint('payment intent' + paymentIntentData!['id'].toString());
        debugPrint(
            'payment intent' + paymentIntentData!['client_secret'].toString());
        debugPrint('payment intent' + paymentIntentData!['amount'].toString());
        debugPrint('payment intent' + paymentIntentData.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Paid successfully"),
          ),
        );
        paymentIntentData = null;
        Navigator.pushNamedAndRemoveUntil(
          context,
          DashBoardScreen.route,
          (route) => false,
        );
      }).onError((error, stackTrace) {
        debugPrint('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      debugPrint('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          content: Text("Cancelled "),
        ),
      );
    } catch (e) {
      debugPrint('$e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      debugPrint(body.toString());
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: body,
        headers: {
          'Authorization':
              'Bearer sk_test_51MTxjISBqFEsYuDzv5GhYmFpRDDMoY7lFVcDoUUykyPKJyQ3uN9csS9AyIxLACNjkotqpxYcg2SjCm1VC6J8Yqyg00MlFE7P7t',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      );
      debugPrint('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      debugPrint('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }

  void callPaymentInfo(type) {
    callApi(() async {
      final response = await AuthRepo.paymentInfoCall(type);
      notifyListeners();
      if (response.status == 1) {
        var res = PaymentInfoModel.fromJson(response.data);
        planInfo = res.data;
        notifyListeners();
      } else {
        showToast(response.message, AppColors.redColor);
      }
    });
  }

  PaymentDetail? paymentDetail;

  void callPlans() {
    callApi(() async {
      final response = await AuthRepo.getPlansCall();
      notifyListeners();
      if (response.status == 1) {
        var res = PlanInfoModel.fromJson(response.data);
        paymentDetail = res.data;
        notifyListeners();
      } else {
        showToast(response.message, AppColors.redColor);
      }
    });
  }
}

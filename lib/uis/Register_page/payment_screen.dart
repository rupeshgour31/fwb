import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:task/data/remote/models/payment_detail.dart';
import 'package:task/data/remote/models/plan_info_model.dart';
import 'package:task/uis/login/auth_view_model.dart';
import 'package:task/uis/pages/background_image.dart';
import 'package:task/utils/constant.dart';
import 'package:task/utils/loading_screen.dart';

class PaymentScreen extends StatefulWidget {
  static const String route = 'PaymentScreen';
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool paymentClick = true;
  bool whatGet = false;
  int type = 1;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var res = ModalRoute.of(context)!.settings.arguments as String;
      type = res == 'Register My Business'
          ? 1
          : res == 'Contract Professional'
              ? 2
              : 3;
      context.read<AuthViewModel>().callPaymentInfo(type);
      context.read<AuthViewModel>().callPlans();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    PlanData? planInfo = context.watch<AuthViewModel>().planInfo;
    PaymentDetail? paymentDetail = context.watch<AuthViewModel>().paymentDetail;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const BackgroundImage(),
          if (planInfo != null)
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                top: 110,
                right: 20,
                bottom: 20,
              ),
              height: size.height * 0.95,
              padding: const EdgeInsets.only(
                top: 50,
                bottom: 20,
                left: 15,
                right: 15,
              ),
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    hBox(25.0),
                    const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Register My Business',
                        style: kMainTextStyle,
                      ),
                    ),
                    hBox(25.0),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          whatGet = !whatGet;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kTextColor,
                        ),
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'What you get',
                              style: TextStyle(
                                fontSize: 17,
                                color: kAppColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            Icon(
                              whatGet
                                  ? Icons.arrow_circle_up_rounded
                                  : Icons.arrow_circle_down_rounded,
                              size: 20,
                              color: kAppColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    hBox(10.0),
                    if (whatGet)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const Text(
                            //   'Title: ',
                            //   style: TextStyle(
                            //     fontSize: 17,
                            //     color: Colors.black,
                            //     fontWeight: FontWeight.w700,
                            //     fontFamily: 'Roboto',
                            //   ),
                            // ),
                            // hBox(5.0),
                            Text(
                              type == 1
                                  ? 'Business'
                                  : type == 2
                                      ? 'Professional'
                                      : 'Business Owner',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            hBox(15.0),
                            // const Text(
                            //   'Content: ',
                            //   style: TextStyle(
                            //     fontSize: 17,
                            //     color: Colors.black,
                            //     fontWeight: FontWeight.w700,
                            //     fontFamily: 'Roboto',
                            //   ),
                            // ),
                            // hBox(5.0),
                            Text(
                              planInfo.content ?? '',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            hBox(10.0), //
                            // const Text(
                            //   'Description: ',
                            //   style: TextStyle(
                            //     fontSize: 17,
                            //     color: Colors.black,
                            //     fontWeight: FontWeight.w700,
                            //     fontFamily: 'Roboto',
                            //   ),
                            // ),
                            // hBox(5.0),
                            Text(
                              planInfo.description ?? '',
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ],
                        ),
                      ),
                    hBox(10.0),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          paymentClick = !paymentClick;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kTextColor,
                        ),
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Payment & Checkout',
                              style: TextStyle(
                                fontSize: 17,
                                color: kAppColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            Icon(
                              paymentClick
                                  ? Icons.arrow_circle_up_rounded
                                  : Icons.arrow_circle_down_rounded,
                              size: 20,
                              color: kAppColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    hBox(10.0),
                    if (paymentClick)
                      if (paymentDetail != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Plan: ',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              hBox(5.0),
                              Text(
                                type == 1
                                    ? 'Business'
                                    : type == 2
                                        ? 'Professional'
                                        : 'Business Owner',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              hBox(10.0),
                              const Text(
                                'Price: ',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              hBox(5.0),
                              Text(
                                type == 1
                                    ? '\$${paymentDetail.business!.amount! / 100}'
                                    : type == 2
                                        ? '\$${paymentDetail.professional!.amount! / 100}'
                                        : '\$${paymentDetail.businessOwner!.amount! / 100}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              hBox(15.0),
                              const Text(
                                'Renewal: ',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              hBox(5.0),
                              Text(
                                type == 1
                                    ? paymentDetail.business!.interval ?? ''
                                    : type == 2
                                        ? paymentDetail
                                                .professional!.interval ??
                                            ''
                                        : paymentDetail
                                                .businessOwner!.interval ??
                                            '',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              hBox(15.0),
                              const Text(
                                'Description: ',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              hBox(5.0),
                              Text(
                                type == 1
                                    ? paymentDetail
                                            .business!.product!.description ??
                                        ''
                                    : type == 2
                                        ? paymentDetail.professional!.product!
                                                .description ??
                                            ''
                                        : paymentDetail.businessOwner!.product!
                                                .description ??
                                            '',
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ],
                          ),
                        ),
                    hBox(15.0),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        child: Text(
                          "Pay ${type == 1 ? '\$${paymentDetail!.business!.amount! / 100}' : type == 2 ? '\$${paymentDetail!.professional!.amount! / 100}' : '\$${paymentDetail!.businessOwner!.amount! / 100}'}",
                          style: kButtonStyle,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kAppColor,
                          elevation: 0,
                          fixedSize: const Size(220, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          context.read<AuthViewModel>().makePayment(
                              type == 1
                                  ? '${paymentDetail.business!.amount}'
                                  : type == 2
                                      ? '${paymentDetail.professional!.amount}'
                                      : '${paymentDetail.businessOwner!.amount}',
                              context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Positioned(
            top: 70.0,
            child: SvgPicture.asset(
              "assets/images/logox.svg",
              height: 85,
            ),
          ),
          const LoadingIndicatorConsumer<AuthViewModel>(),
        ],
      ),
    );
  }
}

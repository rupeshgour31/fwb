import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:task/uis/login/auth_view_model.dart';
import 'package:task/uis/pages/background_image.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/common_textform_field.dart';
import 'package:task/utils/common_validations.dart';
import 'package:task/utils/constant.dart';
import 'package:task/utils/loading_screen.dart';

class SignUpPage extends StatefulWidget {
  static const String route = 'SignUpPage';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with CommonValidations {
  TextEditingController fullNameCtl = TextEditingController();
  TextEditingController emailCtl = TextEditingController();
  TextEditingController phoneCtl = TextEditingController();
  TextEditingController passwordCtl = TextEditingController();
  TextEditingController addressCtl = TextEditingController();
  TextEditingController userNameCtl = TextEditingController();
  TextEditingController cityCtl = TextEditingController();
  TextEditingController stateCtl = TextEditingController();
  TextEditingController zipCtl = TextEditingController();
  TextEditingController bioCtl = TextEditingController();
  TextEditingController industryCtl = TextEditingController();
  TextEditingController bussNameCtl = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  String selected = '';
  String roleCtl = 'business';
  String businessType = 'LLC';
  bool valuefirst = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    selected = ModalRoute.of(context)!.settings.arguments as String;
    roleCtl = selected == 'Contract Professional' ? 'professional' : 'business';
    return Stack(
      alignment: Alignment.center,
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          // ),
          body: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    top: 90,
                    right: 20,
                    bottom: 20,
                  ),
                  // height: size.height * 0.60,
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
                  child: Form(
                    key: key,
                    child: Column(
                      children: [
                        Text(
                          selected,
                          style: kMainTextStyle,
                        ),
                        hBox(15.0),
                        CommonTextField(
                          hintText: 'Full name',
                          controller: fullNameCtl,
                          textInputType: TextInputType.text,
                          validation: (String? value) => isRequiredValid(
                            fullNameCtl.text,
                            'Full name',
                          ),
                        ),
                        hBox(15),
                        CommonTextField(
                          hintText: 'Email',
                          controller: emailCtl,
                          validation: (String? value) => isRequiredValid(
                            emailCtl.text,
                            'Email',
                          ),
                          textInputType: TextInputType.text,
                        ),
                        hBox(15),
                        CommonTextField(
                          hintText: 'Username',
                          controller: userNameCtl,
                          textInputType: TextInputType.text,
                          validation: (String? value) => isRequiredValid(
                            userNameCtl.text,
                            'Username',
                          ),
                        ),
                        hBox(15),
                        CommonTextField(
                          hintText: 'Password',
                          obscureText: true,
                          controller: passwordCtl,
                          textInputType: TextInputType.text,
                          validation: (String? value) => isRequiredValid(
                            passwordCtl.text,
                            'Password',
                          ),
                        ),
                        hBox(15),
                        CommonTextField(
                          hintText: 'Business Name',
                          controller: bussNameCtl,
                          textInputType: TextInputType.text,
                          validation: (String? value) => isRequiredValid(
                            bussNameCtl.text,
                            'Business name',
                          ),
                        ),
                        if (roleCtl == 'business') hBox(15),
                        if (roleCtl == 'business')
                          Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColors.textFormFillColor,
                              border: Border.all(
                                color: AppColors.whiteColor,
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.greyCard,
                                  spreadRadius: 1,
                                  blurRadius: 5.0,
                                ),
                              ],
                            ),
                            clipBehavior: Clip.hardEdge,
                            padding: const EdgeInsets.only(left: 12, right: 8),
                            child: DropdownButton<String>(
                              dropdownColor: const Color(0xffF4F4F4),
                              value: businessType,
                              underline: const DropdownButtonHideUnderline(
                                child: SizedBox.shrink(),
                              ),
                              isExpanded: true,
                              icon: Icon(
                                Icons.arrow_drop_down_sharp,
                                color: AppColors.blackFont,
                              ),
                              elevation: 16,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: AppColors.blackFont,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Montserrat',
                              ),
                              hint: Text(
                                'LLC',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: AppColors.blackFont,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  businessType = newValue!;
                                });
                              },
                              items: <String>[
                                'LLC',
                                'Cooperation'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        hBox(15),
                        CommonTextField(
                          hintText: 'Address',
                          controller: addressCtl,
                          textInputType: TextInputType.text,
                        ),
                        hBox(15),
                        Row(
                          children: [
                            Expanded(
                              child: CommonTextField(
                                hintText: 'City',
                                controller: cityCtl,
                                textInputType: TextInputType.text,
                              ),
                            ),
                            wBox(20),
                            Expanded(
                              child: CommonTextField(
                                hintText: 'State',
                                controller: stateCtl,
                                textInputType: TextInputType.text,
                              ),
                            ),
                          ],
                        ),
                        hBox(15),
                        Row(
                          children: [
                            Expanded(
                              child: CommonTextField(
                                hintText: 'Zipcode',
                                controller: zipCtl,
                                textInputType: TextInputType.number,
                              ),
                            ),
                            wBox(20),
                            Expanded(
                              child: CommonTextField(
                                hintText: 'Phone',
                                controller: phoneCtl,
                                textInputType: TextInputType.phone,
                              ),
                            ),
                          ],
                        ),
                        hBox(15),
                        CommonTextField(
                          hintText: 'Industry',
                          controller: industryCtl,
                          textInputType: TextInputType.text,
                        ),
                        hBox(15),
                        CommonTextField(
                          hintText: 'Bio',
                          maxLines: 5,
                          contentPadding: const EdgeInsets.all(10),
                          controller: bioCtl,
                          textInputType: TextInputType.text,
                        ),
                        hBox(15),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(
                            //   context,
                            //   PaymentScreen.route,
                            //   arguments: selected,
                            // );
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
                                  "Accept Terms & Conditions",
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
                        hBox(15),
                        hBox(15),
                        ElevatedButton(
                          child: const Text(
                            "Register",
                            style: kButtonStyle,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kAppColor,
                            elevation: 0,
                            fixedSize: const Size(220, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () {
                            if (key.currentState!.validate()) {
                              if (valuefirst) {
                                Map<String, String> param = {
                                  'name': fullNameCtl.text,
                                  'email': emailCtl.text,
                                  'username': userNameCtl.text,
                                  'password': passwordCtl.text,
                                  'password_confirmation': passwordCtl.text,
                                  'role': roleCtl,
                                  'address': addressCtl.text,
                                  'city': cityCtl.text,
                                  'state': stateCtl.text,
                                  'zipcode': zipCtl.text,
                                  'accept_terms': '1',
                                  'business_name': bussNameCtl.text,
                                  'business_type': businessType,
                                  'phone': phoneCtl.text,
                                  'industry': industryCtl.text,
                                  'bio': bioCtl.text,
                                  'verified': '1',
                                  // "username": userNameController.text,
                                  // "password": passwordController.text,
                                };
                                context
                                    .read<AuthViewModel>()
                                    .registrationReq(context, param, selected);
                              } else {
                                showToast('Please accept terms & conditions',
                                    AppColors.redColor);
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 45.0,
                  child: SvgPicture.asset(
                    "assets/images/logox.svg",
                    height: 85,
                  ),
                ),
                const LoadingIndicatorConsumer<AuthViewModel>(),
              ],
            ),
          ),
        )
      ],
    );
  }
}

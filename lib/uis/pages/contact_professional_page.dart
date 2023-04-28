import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:task/uis/pages/dashboard_view_model.dart';
import 'package:task/uis/pages/home_page.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/common_textform_field.dart';
import 'package:task/utils/common_validations.dart';
import 'package:task/utils/constant.dart';
import 'package:task/utils/loading_screen.dart';

import 'background_image.dart';

class ContactPage extends StatefulWidget {
  static const String route = 'ContactPage';
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> with CommonValidations {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  DateTime? date;
  DateTime? time;
  TextEditingController bio = TextEditingController();
  String? userName;
  int? userId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Map getValue = ModalRoute.of(context)!.settings.arguments as Map;
      setState(() {
        userName = getValue['username'];
        userId = getValue['userid'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var comanhight = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppColors.blackFont,
                ),
              ),
            ),
            title: const Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text(
                'Contact',
                style: kMainTextStyle,
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, HomePage.route);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0, top: 20),
                  child: SvgPicture.asset(
                    "assets/images/Notification.svg",
                    height: 25,
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Form(
              key: key,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 55,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 80,
                      bottom: 15,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Schedule Consultation",
                          style: kMainTextStyle,
                        ),
                        hBox(8.0),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "With Verified User ",
                                style: kProfileTextStyle,
                              ),
                              TextSpan(
                                text: "$userName",
                                style: const TextStyle(
                                  color: Color(0xFF0024FF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ],
                          ),
                        ),
                        hBox(15.0),
                        CommonTextField(
                          hintText: 'Full name',
                          textInputType: TextInputType.name,
                          controller: name,
                          validation: (String? value) => isRequiredValid(
                            name.text,
                            'Full name',
                          ),
                        ),
                        hBox(15.0),
                        CommonTextField(
                          hintText: 'Email',
                          controller: email,
                          textInputType: TextInputType.name,
                          validation: (String? value) => isRequiredValid(
                            email.text,
                            'Email',
                          ),
                        ),
                        hBox(15.0),
                        CommonTextField(
                          hintText: 'Phone',
                          controller: phone,
                          textInputType: TextInputType.number,
                          validation: (String? value) => isRequiredValid(
                            phone.text,
                            'Phone',
                          ),
                        ),
                        hBox(15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  _showDialog(
                                    CupertinoDatePicker(
                                      initialDateTime: date,
                                      mode: CupertinoDatePickerMode.date,
                                      minimumDate: DateTime(
                                        2023,
                                        DateTime.now().month,
                                        DateTime.now().day,
                                      ),
                                      // This is called when the user changes the time.
                                      onDateTimeChanged: (DateTime newTime) {
                                        setState(() => date = newTime);
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 45,
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
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
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    date != null
                                        ? '${date!.day}/${date!.month}/${date!.year}'
                                        : 'Select date',
                                    style: date != null
                                        ? TextStyle(
                                            fontSize: 15,
                                            color: AppColors.greyFont,
                                          )
                                        : TextStyle(
                                            fontSize: 14,
                                            color: AppColors.greyFont,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  _showDialog(
                                    CupertinoDatePicker(
                                      initialDateTime: time,
                                      mode: CupertinoDatePickerMode.time,
                                      use24hFormat: true,
                                      // This is called when the user changes the time.
                                      onDateTimeChanged: (DateTime newTime) {
                                        setState(() => time = newTime);
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 45,
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
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
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    time != null
                                        ? '${time!.hour}:${time!.minute}'
                                        : 'Select Time',
                                    style: time != null
                                        ? TextStyle(
                                            fontSize: 15,
                                            color: AppColors.greyFont,
                                          )
                                        : TextStyle(
                                            fontSize: 14,
                                            color: AppColors.greyFont,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        hBox(15.0),
                        CommonTextField(
                          contentPadding:
                              const EdgeInsets.only(top: 25, left: 15),
                          hintText: 'Comment or Questions',
                          maxLines: 4,
                          controller: bio,
                          textInputType: TextInputType.name,
                          validation: (String? value) => isRequiredValid(
                            bio.text,
                            'Comment',
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Container(
                          height: 45,
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              if (key.currentState!.validate()) {
                                Map<String, String> body = {
                                  'name': name.text, //Naman
                                  'email': email.text, //jain@abc.com
                                  'phone': phone.text, //9919919919
                                  'date':
                                      '${date!.day}-${date!.month}-${date!.year}',
                                  'time':
                                      '${time!.hour}:${time!.minute}', //11:00 AM
                                  'comment': bio.text, //test
                                };
                                context
                                    .read<DashBoardViewModel>()
                                    .createSchedule(
                                      context,
                                      body,
                                      userId,
                                    );
                              }
                            },
                            child: Text(
                              "Send".toUpperCase(),
                              style: kButtonStyle,
                              textAlign: TextAlign.center,
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: const Color(0xFF13DB87),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png',
                        height: 90,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const LoadingIndicatorConsumer<DashBoardViewModel>(),
      ],
    );
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system
              // navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }
}

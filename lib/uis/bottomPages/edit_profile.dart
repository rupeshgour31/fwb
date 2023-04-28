import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:task/data/remote/models/user_profile_model.dart';
import 'package:task/uis/login/auth_view_model.dart';
import 'package:task/uis/pages/background_image.dart';
import 'package:task/uis/pages/dashboard_view_model.dart';
import 'package:task/uis/pages/home_page.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/common_textform_field.dart';
import 'package:task/utils/common_validations.dart';
import 'package:task/utils/constant.dart';
import 'package:task/utils/loading_screen.dart';

class EditProfile extends StatefulWidget {
  static const String route = 'EditProfile';
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> with CommonValidations {
  TextEditingController fullNameCtl = TextEditingController();
  TextEditingController emailCtl = TextEditingController();
  TextEditingController phoneCtl = TextEditingController();
  TextEditingController addressCtl = TextEditingController();
  TextEditingController cityCtl = TextEditingController();
  TextEditingController stateCtl = TextEditingController();
  TextEditingController zipCtl = TextEditingController();
  TextEditingController bioCtl = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  final _imagePicker = ImagePicker();
  XFile? userImg;
  String? thumbImage;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Data? userProfile = context.read<DashBoardViewModel>().userProfile;
      fullNameCtl.text = userProfile!.name!;
      emailCtl.text = userProfile.email!;
      addressCtl.text = userProfile.address!;
      cityCtl.text = userProfile.city!;
      stateCtl.text = userProfile.state!;
      zipCtl.text = userProfile.zipcode!;
      thumbImage = userProfile.thumbImage!;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0,
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
                'Edit Profile',
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
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    top: 65,
                    right: 20,
                    bottom: 20,
                  ),
                  // height: size.height * 0.60,
                  padding: const EdgeInsets.only(
                    top: 70,
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
                          textInputType: TextInputType.text,
                          validation: (String? value) => isRequiredValid(
                            emailCtl.text,
                            'Email',
                          ),
                        ),
                        hBox(15),
                        CommonTextField(
                          hintText: 'Address',
                          controller: addressCtl,
                          textInputType: TextInputType.text,
                          validation: (String? value) => isRequiredValid(
                            addressCtl.text,
                            'Address',
                          ),
                        ),
                        hBox(15),
                        Row(
                          children: [
                            Expanded(
                              child: CommonTextField(
                                hintText: 'City',
                                controller: cityCtl,
                                textInputType: TextInputType.text,
                                validation: (String? value) => isRequiredValid(
                                  cityCtl.text,
                                  'City',
                                ),
                              ),
                            ),
                            wBox(20),
                            Expanded(
                              child: CommonTextField(
                                hintText: 'State',
                                controller: stateCtl,
                                textInputType: TextInputType.text,
                                validation: (String? value) => isRequiredValid(
                                  stateCtl.text,
                                  'State',
                                ),
                              ),
                            ),
                          ],
                        ),
                        hBox(15),
                        // Row(
                        //   children: [
                        CommonTextField(
                          hintText: 'Zipcode',
                          controller: zipCtl,
                          textInputType: TextInputType.number,
                        ),
                        // wBox(20),
                        // Expanded(
                        //   child: CommonTextField(
                        //     hintText: 'Phone',
                        //     controller: phoneCtl,
                        //     textInputType: TextInputType.phone,
                        //   ),
                        // ),
                        //   ],
                        // ),
                        hBox(30),
                        ElevatedButton(
                          child: const Text(
                            "Update",
                            style: kButtonStyle,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kAppColor,
                            elevation: 0,
                            fixedSize: const Size(400, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () {
                            if (key.currentState!.validate()) {
                              Map<String, String> param = {
                                'name': fullNameCtl.text,
                                'email': emailCtl.text,
                                'address': addressCtl.text,
                                'city': cityCtl.text,
                                'state': stateCtl.text,
                                'zipcode': zipCtl.text,
                                // "username": userNameController.text,
                                // "password": passwordController.text,
                              };
                              context
                                  .read<AuthViewModel>()
                                  .editProfileReq(context, param, userImg);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: userImg != null
                        ? Image.file(
                            File(userImg!.path),
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            thumbImage ?? '',
                            height: 90,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    imagePickOption();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 85),
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Color(0xFFDB5461),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const LoadingIndicatorConsumer<AuthViewModel>(),
      ],
    );
  }

  imagePickOption() {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          title: const Text(
            'Please select image',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: const Text(
                'Gallery',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                _pickPhoto();
              },
            ),
            CupertinoActionSheetAction(
              child: const Text(
                'Camera',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                _capturePhoto();
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );
  }

  Future _capturePhoto() async {
    final photo = await _imagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (photo != null) {
      setState(() {
        userImg = photo;
      });
    }
  }

  Future _pickPhoto() async {
    final photo = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (photo != null) {
      setState(() {
        userImg = photo;
      });
    }
  }
}

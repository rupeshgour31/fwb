import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:task/data/remote/models/user_profile_model.dart';
import 'package:task/uis/bottomPages/edit_profile.dart';
import 'package:task/uis/login/auth_view_model.dart';
import 'package:task/uis/pages/dashboard_view_model.dart';
import 'package:task/uis/pages/home_page.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/constant.dart';
import 'package:task/utils/loading_screen.dart';

import '../pages/background_image.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    funCall();
  }

  funCall() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<DashBoardViewModel>().getUserProfileReq();
    });
  }

  @override
  Widget build(BuildContext context) {
    var commonHeight = MediaQuery.of(context).size.height;
    Data? userProfile = context.watch<DashBoardViewModel>().userProfile;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0,
            title: const Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text(
                'Profile',
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
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 45,
                  left: 25,
                  right: 25,
                  bottom: 80,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
                padding: const EdgeInsets.only(top: 60, bottom: 20),
                child: userProfile != null
                    ? SingleChildScrollView(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Professional",
                                      style: kMainTextStyle,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      userProfile.name!,
                                      style: kProfileTextStyle,
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    final res = await Navigator.pushNamed(
                                      context,
                                      EditProfile.route,
                                    );
                                    if (res != null) {
                                      funCall();
                                    }
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 2,
                                    child: SvgPicture.asset(
                                      "assets/images/edit my info.svg",
                                      height: 65,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            kDivide,
                            ListTile(
                              contentPadding: const EdgeInsets.only(top: 1),
                              leading: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                height: 22,
                                width: 22,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF13DB87),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.check,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              horizontalTitleGap: 0,
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 9),
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Verified User ",
                                        style: kProfileTextStyle,
                                      ),
                                      TextSpan(
                                        text: "ChadGraphix43",
                                        style: TextStyle(
                                          color: Color(0xFF0024FF),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            kDivide,
                            commanlisttile(
                              SvgPicture.asset(
                                "assets/images/Vector_2.svg",
                                height: 24,
                                color: const Color(0xFF13DB87),
                              ),
                              userProfile.address ?? '',
                            ),
                            kDivide,
                            commanlisttile(
                              SvgPicture.asset(
                                "assets/images/Group_1.svg",
                                height: 18,
                                color: const Color(0xFF13DB87),
                              ),
                              userProfile.businessName ?? '',
                            ),
                            kDivide,
                            commanlisttile(
                              SvgPicture.asset(
                                "assets/images/Vector_4.svg",
                                height: 18,
                                color: const Color(0xFF13DB87),
                              ),
                              userProfile.email ?? '',
                            ),
                            kDivide,
                            commanlisttile(
                              SvgPicture.asset(
                                "assets/images/phone-call.svg",
                                height: 24,
                                color: const Color(0xFF13DB87),
                              ),
                              userProfile.phone ?? '',
                            ),
                            kDivide,
                            hBox(10.0),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Biography:",
                                style: TextStyle(
                                  color: Color(0xFF2C2C2C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                            hBox(10.0),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                userProfile.bio ?? '',
                                style: const TextStyle(
                                  color: Color(0xFF2C2C2C),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 22,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  context
                                      .read<AuthViewModel>()
                                      .logoutReq(context);
                                },
                                child: const Text(
                                  "Logout",
                                  style: TextStyle(
                                    color: Color(0xFF0024FF),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Roboto',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              if (userProfile != null)
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      userProfile.thumbImage ??
                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png',
                      height: 90,
                      width: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (a, s, d) {
                        return Container(
                          height: 70,
                          width: 80,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.error,
                            color: AppColors.redColor,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              GestureDetector(
                onTap: () async {
                  final res = await Navigator.pushNamed(
                    context,
                    EditProfile.route,
                  );
                  if (res != null) {
                    funCall();
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 70),
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
              const LoadingIndicatorConsumer<DashBoardViewModel>(),
            ],
          ),
        )
      ],
    );
  }

  Widget commanlisttile(image, title) {
    return ListTile(
      contentPadding: const EdgeInsets.only(top: 1),
      leading: image,
      horizontalTitleGap: 0,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 9),
        child: Text(
          title.toString(),
          style: kProfileTextStyle,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:task/data/local/sharedPrefHelper.dart';
import 'package:task/data/remote/models/professionals_profile_model.dart';
import 'package:task/uis/pages/contact_professional_page.dart';
import 'package:task/uis/pages/dashboard_view_model.dart';
import 'package:task/uis/pages/home_page.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/constant.dart';
import 'package:task/utils/loading_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'background_image.dart';

class ProfileNextPage extends StatefulWidget {
  static const String route = 'ProfileNextPage';
  const ProfileNextPage({Key? key}) : super(key: key);

  @override
  State<ProfileNextPage> createState() => _ProfileNextPageState();
}

class _ProfileNextPageState extends State<ProfileNextPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      int id = ModalRoute.of(context)!.settings.arguments as int;
      context.read<DashBoardViewModel>().getProfessionalsProfile(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    var comanhight = MediaQuery.of(context).size.height;
    ProfessionalUser? getProfile =
        context.watch<DashBoardViewModel>().getProfile;
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
                'Search Businesses',
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
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    if (getProfile != null)
                      Container(
                        margin: const EdgeInsets.only(
                          top: 60,
                          left: 20,
                          right: 20,
                          bottom: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        padding: const EdgeInsets.only(top: 50, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Professional",
                                        style: kMainTextStyle,
                                      ),
                                      hBox(5.0),
                                      Text(
                                        getProfile.name ?? '',
                                        style: kProfileTextStyle,
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (SharedPrefHelper.userRole ==
                                          'business') {
                                        context
                                            .read<DashBoardViewModel>()
                                            .addRemoveFromTeam(
                                              context,
                                              getProfile.id,
                                              !getProfile.inTeam!,
                                            );
                                      } else {
                                        context
                                            .read<DashBoardViewModel>()
                                            .leaveBusiness(
                                              context,
                                              getProfile.id,
                                            );
                                      }
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      elevation: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icons/team icon.svg",
                                              color: getProfile.inTeam!
                                                  ? AppColors.redColor
                                                  : AppColors.greenColor,
                                            ),
                                            hBox(5.0),
                                            Text(
                                              SharedPrefHelper.userRole ==
                                                      'business'
                                                  ? getProfile.inTeam!
                                                      ? 'Remove From team'
                                                      : 'Add to Team'
                                                  : 'Leave Business',
                                              style: TextStyle(
                                                color: getProfile.inTeam!
                                                    ? AppColors.redColor
                                                    : AppColors.greenColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Roboto',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            kDivide,
                            ListTile(
                              leading: const Icon(
                                Icons.check_box,
                                size: 17,
                                color: Color(0xFF13DB87),
                              ),
                              horizontalTitleGap: 0,
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 9),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: "Verified User ",
                                        style: kProfileTextStyle,
                                      ),
                                      TextSpan(
                                        text: getProfile.username ?? '',
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
                              ),
                            ),
                            kDivide,
                            commanlisttile(
                              "assets/images/Vector_3.svg",
                              getProfile.address ?? '',
                            ),
                            kDivide,
                            commanlisttile(
                              "assets/images/Group_1.svg",
                              getProfile.email ?? '',
                            ),
                            kDivide,
                            const Padding(
                              padding: EdgeInsets.only(left: 20, top: 10),
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
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 12, right: 15),
                              child: Text(
                                getProfile.bio ?? '',
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
                                  left: 20, right: 20, top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  commanbutton(
                                    Icons.email,
                                    "Send Email",
                                    () {
                                      final Uri emailLaunchUri = Uri(
                                        scheme: 'mailto',
                                        path: '${getProfile.email}',
                                        query: encodeQueryParameters(<String,
                                            String>{
                                          'subject':
                                              'Example Subject & Symbols are allowed!',
                                        }),
                                      );
                                      _launchUrl(emailLaunchUri);
                                    },
                                  ),
                                  const SizedBox(width: 5),
                                  commanbutton(
                                    Icons.wifi_calling,
                                    "Call Business",
                                    () {
                                      _launchUrl(
                                        Uri.parse("tel://${getProfile.phone}"),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 45,
                                width: double.infinity,
                                margin: const EdgeInsets.only(
                                    top: 10, left: 10, right: 10),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      ContactPage.route,
                                      arguments: {
                                        'username': getProfile.username ?? '',
                                        'userid': getProfile.id,
                                      },
                                    );
                                  },
                                  child: Text(
                                    "Schedule Consultation".toUpperCase(),
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
                            ),
                          ],
                        ),
                      ),
                    if (getProfile != null)
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
                            getProfile.profileImage ??
                                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png',
                            height: 90,
                            errorBuilder: (a, s, d) {
                              return Icon(Icons.error);
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const LoadingIndicatorConsumer<DashBoardViewModel>(),
      ],
    );
  }

  Widget commanlisttile(image, title) {
    return ListTile(
      leading: SvgPicture.asset(
        image.toString(),
        color: const Color(0xFF13DB87),
      ),
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

  Future<void> _launchUrl(params) async {
    if (!await launchUrl(params)) {
      throw Exception('Could not launch ');
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Widget commanbutton(icon, title, ontap) {
    return ElevatedButton(
      onPressed: ontap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: const Color(0xFF13DB87),
            size: 18,
          ),
          const SizedBox(width: 5),
          Text(
            title.toString(),
            style: const TextStyle(
                color: Color(0xFF2C2C2C),
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontFamily: ''),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: const Color(0xFFFFFFFF),
      ),
    );
  }
}

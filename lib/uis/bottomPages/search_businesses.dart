import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/data/local/sharedPrefHelper.dart';
import 'package:task/uis/bottomPages/directory_page.dart';
import 'package:task/uis/pages/home_page.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/common_textform_field.dart';
import 'package:task/utils/constant.dart';

import '../pages/background_image.dart';

class SearchBusinessPage extends StatefulWidget {
  const SearchBusinessPage({Key? key}) : super(key: key);

  @override
  State<SearchBusinessPage> createState() => _SearchBusinessPageState();
}

class _SearchBusinessPageState extends State<SearchBusinessPage> {
  TextEditingController searchIndustry = TextEditingController();
  TextEditingController searchLocation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var comanhight = MediaQuery.of(context).size.height;

    return Stack(
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
          body: Column(
            children: [
              SharedPrefHelper.userRole == 'business'
                  ? Container(
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 35,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        bottom: 15,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            "Use The Filter",
                            style: kCheckStyle,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "& Find Professional Talent",
                            style: kCheckStyle_1,
                          ),
                          hBox(25.0),
                          CommonTextField(
                            hintText: 'Industry',
                            controller: searchIndustry,
                            textInputType: TextInputType.name,
                          ),
                          hBox(20.0),
                          CommonTextField(
                            hintText: 'Location',
                            controller: searchLocation,
                            textInputType: TextInputType.name,
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.search,
                                  color: Color(0xFF151C47),
                                  size: 20,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "SEARCH",
                                  style: kButtonStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF13DB87),
                              elevation: 0,
                              fixedSize: const Size(140, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                DirectoryPage.route,
                                arguments: {
                                  'location': searchLocation.text,
                                  'industry': searchIndustry.text,
                                  'isBack': true,
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(20),
                      margin:
                          const EdgeInsets.only(left: 25, right: 25, top: 20),
                      child: Text(
                        "You need to create business account for view professionals",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.redColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
            ],
          ),
        )
      ],
    );
  }
}

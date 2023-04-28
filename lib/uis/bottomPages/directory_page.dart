import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:task/data/local/sharedPrefHelper.dart';
import 'package:task/data/remote/models/business_professionals_model.dart';
import 'package:task/uis/pages/dashboard_view_model.dart';
import 'package:task/uis/pages/home_page.dart';
import 'package:task/uis/pages/profile_1_page.dart';
import 'package:task/uis/pages/view_button_page.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/common_textform_field.dart';
import 'package:task/utils/constant.dart';
import 'package:task/utils/loading_screen.dart';

import '../pages/background_image.dart';

class DirectoryPage extends StatefulWidget {
  static const String route = 'DirectoryPage';
  const DirectoryPage({Key? key}) : super(key: key);

  @override
  State<DirectoryPage> createState() => _DirectoryPageState();
}

class _DirectoryPageState extends State<DirectoryPage> {
  TextEditingController searchKey = TextEditingController();
  String location = '';
  String industry = '';
  bool isBack = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<DashBoardViewModel>().getSearchBusinesses(
            searchKey.text,
            industry,
            location,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final arg = ModalRoute.of(context)!.settings.arguments;
    if (arg != null) {
      Map getArgs = arg as Map;
      location = getArgs['location'];
      industry = getArgs['industry'];
      isBack = getArgs['isBack'];
    }
    List<ProfessionalsData> professionals =
        context.watch<DashBoardViewModel>().professionals;
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: isBack
              ? AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  centerTitle: false,
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
                )
              : AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  centerTitle: false,
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
                        ),
                      ),
                    ),
                  ],
                ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 75),
            child: SharedPrefHelper.userRole == 'business'
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      hBox(15.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: CommonTextField(
                          hintText: 'Search',
                          textInputType: TextInputType.name,
                          controller: searchKey,
                          onChanged: (String? value) {
                            context
                                .read<DashBoardViewModel>()
                                .getSearchBusinesses(
                                  searchKey.text,
                                  industry,
                                  location,
                                );
                          },
                        ),
                      ),
                      hBox(15.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (industry.isNotEmpty)
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/Group_2.svg",
                                    height: 16,
                                    width: 13,
                                  ),
                                  wBox(7.0),
                                  Text(
                                    industry!,
                                    style: const TextStyle(
                                      color: Color(0xFF151C47),
                                      fontSize: 15,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            if (location.isNotEmpty)
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/Vector_2.svg",
                                    height: 16,
                                    width: 13,
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    location ?? '',
                                    style: const TextStyle(
                                      color: Color(0xFF151C47),
                                      fontSize: 15,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            /* SvgPicture.asset(
                              "assets/images/Vector_1.svg",
                              height: 30,
                              width: 30,
                            ),*/
                          ],
                        ),
                      ),
                      hBox(15.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "${professionals.length} Results",
                          style: const TextStyle(
                            color: Color(0xFF2C2C2C),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                      hBox(10.0),
                      ListView.builder(
                        padding: const EdgeInsets.only(top: 1),
                        itemCount: professionals.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, i) {
                          return commonProfile(professionals[i]);
                        },
                      ),
                    ],
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(left: 25, right: 25, top: 20),
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
          ),
        ),
        const LoadingIndicatorConsumer<DashBoardViewModel>(),
      ],
    );
  }

  Widget commonProfile(ProfessionalsData data) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(
              context,
              ProfileNextPage.route,
              arguments: data.id,
            );
          },
          leading: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(45),
              image: DecorationImage(
                image: NetworkImage(
                  data.profileImage ??
                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            data.name ?? '',
            style: kDirectoryTextStyle,
          ),
          subtitle: Text(
            data.industry ?? '',
            style: kDirectoryTextStyle_1,
          ),
          trailing: const ViewButtonPage(),
        ),
      ),
    );
  }
}

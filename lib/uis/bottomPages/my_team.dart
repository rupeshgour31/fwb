import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:task/data/local/sharedPrefHelper.dart';
import 'package:task/data/remote/models/my_businesses_model.dart';
import 'package:task/data/remote/models/my_teams_model.dart';
import 'package:task/uis/pages/background_image.dart';
import 'package:task/uis/pages/dashboard_view_model.dart';
import 'package:task/uis/pages/home_page.dart';
import 'package:task/utils/common_textform_field.dart';
import 'package:task/utils/constant.dart';
import 'package:task/utils/loading_screen.dart';

import '../pages/profile_1_page.dart';
import '../pages/view_button_page.dart';

class MyTeamPage extends StatefulWidget {
  const MyTeamPage({Key? key}) : super(key: key);

  @override
  State<MyTeamPage> createState() => _MyTeamPageState();
}

class _MyTeamPageState extends State<MyTeamPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SharedPrefHelper.userRole == 'business'
          ? context.read<DashBoardViewModel>().getMyTeams()
          : context.read<DashBoardViewModel>().getMyBusinesses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text(
                SharedPrefHelper.userRole == 'business'
                    ? 'My Team'
                    : 'My Businesses',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: CommonTextField(
                    hintText: 'Search',
                    textInputType: TextInputType.name,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Current Team Members",
                    style: TextStyle(
                      color: Color(0xFF2C2C2C),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SharedPrefHelper.userRole == 'business'
                    ? myTeams()
                    : myBusiness(),
                hBox(75.0),
              ],
            ),
          ),
        ),
        const LoadingIndicatorConsumer<DashBoardViewModel>(),
      ],
    );
  }

  myTeams() {
    List<Teams> teamUsers = context.watch<DashBoardViewModel>().teamUsers;
    return ListView.builder(
      padding: const EdgeInsets.only(top: 1),
      itemCount: teamUsers.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (ctx, i) {
        return commonProfile(teamUsers[i].professionalUser!);
      },
    );
  }

  myBusiness() {
    List<BusinessData> teamUsers =
        context.watch<DashBoardViewModel>().businessUsers;
    return ListView.builder(
      padding: const EdgeInsets.only(top: 1),
      itemCount: teamUsers.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (ctx, i) {
        return commonBusinessProfile(teamUsers[i].businessUser!);
      },
    );
  }

  Widget commonProfile(TeamUser user) {
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
              arguments: user.id,
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
                  user.profileImage ??
                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            user.name ?? '',
            style: kDirectoryTextStyle,
          ),
          subtitle: Text(
            user.city ?? '',
            style: kDirectoryTextStyle_1,
          ),
          trailing: const ViewButtonPage(),
        ),
      ),
    );
  }

  Widget commonBusinessProfile(BusinessUser user) {
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
              arguments: user.id,
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
                  user.profileImage ??
                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            user.name ?? '',
            style: kDirectoryTextStyle,
          ),
          subtitle: Text(
            user.city ?? '',
            style: kDirectoryTextStyle_1,
          ),
          trailing: const ViewButtonPage(),
        ),
      ),
    );
  }
}

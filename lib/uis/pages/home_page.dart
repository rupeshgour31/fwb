import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/data/remote/models/notiications_model.dart';
import 'package:task/uis/pages/background_image.dart';
import 'package:task/uis/pages/dashboard_view_model.dart';
import 'package:task/uis/pages/view_button_page.dart';
import 'package:task/utils/app_colors.dart';
import 'package:task/utils/constant.dart';
import 'package:task/utils/loading_screen.dart';

class HomePage extends StatefulWidget {
  static const String route = 'HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<DashBoardViewModel>().getNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    var comanhight = MediaQuery.of(context).size.height;
    List<NotificationData> notifications =
        context.watch<DashBoardViewModel>().notifications;

    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            centerTitle: false,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppColors.blackFont,
                ),
              ),
            ),
            title: const Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text(
                'Notifications',
                style: kMainTextStyle,
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10),
                child: Text(
                  "(${notifications.length}) New Notification",
                  style: const TextStyle(
                    color: Color(0xFF151C47),
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              /*if (notifications.length <= 0)
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 250.0),
                  child: Text('No record found'),
                )),*/
              for (int i = 0; i < notifications.length; i++)
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(45),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/unsplash.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "ColorVibe12",
                                    style: TextStyle(
                                      color: Color(0xFF0024FF),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Source Sans Pro',
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "October 10,2021",
                                    style: kHomeTextStyle,
                                  ),
                                  SizedBox(height: 1),
                                  Text(
                                    "12:49 PM",
                                    style: kHomeTextStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const ViewButtonPage(),
                        ],
                      ),
                      const SizedBox(height: 10),
                      kDivide,
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          "${notifications[i].message}",
                          style: const TextStyle(
                            color: Color(0xFF2C2C2C),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        const LoadingIndicatorConsumer<DashBoardViewModel>()
      ],
    );
  }
}

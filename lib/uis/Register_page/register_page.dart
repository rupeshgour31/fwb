import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/uis/pages/bottom_page.dart';
import 'package:task/utils/constant.dart';

import '../pages/background_image.dart';

class RegisterPage extends StatefulWidget {
  static const String route = 'RegisterPage';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isExpand = false;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    var comanhight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const BackgroundImage(),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 115,
                ),
                height: comanhight * 0.60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          "Register My Business",
                          style: kMainTextStyle,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "\$600 to Register A Business",
                          style: kRichTextStyle,
                        ),
                        commancard(
                          "What You Get",
                          "demo",
                        ),
                        commancard(
                          "Payment & Checkout",
                          "demo",
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          child: const Text(
                            "PAY \$600",
                            style: kButtonStyle,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF13DB87),
                            elevation: 0,
                            fixedSize: const Size(140, 45),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              DashBoardScreen.route,
                              (route) => false,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 65),
            child: SvgPicture.asset(
              "assets/images/logox.svg",
              height: 85,
            ),
          ),
        ],
      ),
    );
  }

  Widget commancard(title, subtitle) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
      ),
      child: Card(
        color: const Color(0xFF151C47),
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.white),
          child: ExpansionTile(
            onExpansionChanged: (bool value) {
              isSelected = value;
              if (mounted) setState(() {});
            },
            title: Text(
              title.toString(),
              style: const TextStyle(
                  color: Color(0xFF13DB87),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Source Sans Pro'),
            ),
            trailing: Icon(
              isSelected
                  ? Icons.remove_circle_outline_outlined
                  : Icons.add_circle_outline_outlined,
              color: const Color(0xFF13DB87),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
            children: [
              ListTile(
                tileColor: Colors.white,
                title: Text(
                  subtitle.toString(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Padding(
//   padding: const EdgeInsets.only(
//     left: 12,
//     right: 12,
//     top: 12,
//   ),
//   child: Card(
//     color: const Color(0xFF151C47),
//     elevation: 0.0,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15.0),
//     ),
//     child: Theme(
//       data: Theme.of(context)
//           .copyWith(dividerColor: Colors.white),
//       child: ExpansionTile(
//         onExpansionChanged: (bool value) {
//           isExpand = value;
//           if (mounted) setState(() {});
//         },
//         title: const Text(
//           "What You Get",
//           style: TextStyle(
//               color: Color(0xFF13DB87),
//               fontSize: 15,
//               fontWeight: FontWeight.w600,
//               fontFamily: 'Source Sans Pro'),
//         ),
//         trailing: Icon(
//           isExpand
//               ? Icons.remove_circle_outline_outlined
//               : Icons.add_circle_outline_outlined,
//           color: const Color(0xFF13DB87),
//         ),
//         controlAffinity:
//             ListTileControlAffinity.trailing,
//         children: const [
//           ListTile(
//             tileColor: Colors.white,
//             title: Text("demo"),
//           ),
//         ],
//       ),
//     ),
//   ),
// ),

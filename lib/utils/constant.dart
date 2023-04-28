import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const kAppColor = Color(0xFF13DB87);
const kTextColor = Color(0xFF151C47);

const kTextFieldStyle = TextStyle(
    color: Color(0xFF323232),
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'Source Sans Pro');

const kButtonStyle = TextStyle(
    color: Color(0xFF151C47),
    fontSize: 18,
    fontFamily: 'Source Sans Pro',
    fontWeight: FontWeight.w700);

const kRichTextStyle = TextStyle(
    color: Color(0xFF323232),
    fontSize: 15,
    fontWeight: FontWeight.w600,
    fontFamily: 'Source Sans Pro');

const kMainTextStyle = TextStyle(
    color: Color(0xFF151C47),
    fontSize: 26,
    fontFamily: 'Orpheus Pro',
    fontWeight: FontWeight.w700);

const kCheckStyle = TextStyle(
    fontSize: 18,
    color: Color(0xFF151C47),
    fontWeight: FontWeight.w700,
    fontFamily: 'Roboto');

const kCheckStyle_1 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Color(0xFF858FAF),
    fontFamily: 'Roboto');

const kDivide = Divider(
  height: 15,
  thickness: 1,
  color: Color(0xFFEBF0F3),
);

const kProfileTextStyle = TextStyle(
  color: Color(0xFF151C47),
  fontSize: 14,
  fontWeight: FontWeight.w700,
  fontFamily: 'Roboto',
);

const kDirectoryTextStyle = TextStyle(
  color: Color(0xFF0024FF),
  fontSize: 13,
  fontWeight: FontWeight.w700,
  fontFamily: 'Roboto',
);

const kDirectoryTextStyle_1 = TextStyle(
  color: Color(0xFF383838),
  fontSize: 13,
  fontWeight: FontWeight.w700,
  fontFamily: 'Roboto',
);

const kHomeTextStyle = TextStyle(
  color: Color(0xFF383838),
  fontSize: 9,
  fontWeight: FontWeight.w700,
  fontFamily: 'Roboto',
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: kTextFieldStyle,
  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  fillColor: Color(0xFFF6F6F6),
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
    borderSide: BorderSide(
      color: Color(0xFFF6F6F6),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
    borderSide: BorderSide(
      color: Color(0xFFF6F6F6),
    ),
  ),
);

SizedBox hBox(double height) {
  return SizedBox(height: height);
}

SizedBox wBox(double width) {
  return SizedBox(width: width);
}

showToast(msz, Color getColor) {
  return Fluttertoast.showToast(
    msg: msz.toString(),
    toastLength: Toast.LENGTH_SHORT,
    textColor: Colors.white,
    backgroundColor: getColor,
  );
}

const kTextFieldDecoration_1 = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: kTextFieldStyle,
  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  fillColor: Color(0xFFF6F6F6),
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
    borderSide: BorderSide(
      color: Color(0xFFF6F6F6),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
    borderSide: BorderSide(
      color: Color(0xFFF6F6F6),
    ),
  ),
);

errorDialog(context, error) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text(
      "Ok",
    ),
    onPressed: () => Navigator.pop(context),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text(
      'Validation error',
    ),
    content: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            error
                .toString()
                .replaceAll('{', '')
                .replaceAll('}', '')
                .replaceAll(',', '\n\n')
                .trim(),
            textAlign: TextAlign.left,
            style: TextStyle(),
          ),
        ],
      ),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

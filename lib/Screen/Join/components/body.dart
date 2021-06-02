import 'package:first/Screen/Room/components/test.dart';
import 'package:first/Screen/Room/room_screen.dart';
import 'package:first/Screen/components/rounded_button.dart';
import 'package:first/Screen/components/rounded_input_field.dart';
import 'package:first/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "加入房间",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: kPrimaryLightColor,
                // fontFamily: 'Raleway',
              ),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.20),
            RoundedInputField(
              hintText: "输入昵称",
              onChanged: (value) {},
            ),
            SizedBox(height: size.height * 0.03),
            RoundedButton(
              text: "开始匹配",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return RoomScreen();
                  }),
                );
              },
            ),
            // SizedBox(height: size.height * 0.03),
            // AlreadyHaveAnAccountCheck(
            //   press: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return SignUpScreen();
            //         },
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

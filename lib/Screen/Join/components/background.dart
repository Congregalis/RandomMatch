import 'package:first/Screen/Join/components/glass.dart';
import 'package:first/constants.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   child: Image.asset(
          //     "assets/images/main_top.png",
          //     width: size.width * 0.35,
          //   ),
          // ),
          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   child: Image.asset(
          //     "assets/images/login_bottom.png",
          //     width: size.width * 0.4,
          //   ),
          // ),
          WaveWidget(
            config: CustomConfig(
              colors: [
                Colors.white70,
                Colors.white54,
                Colors.white30,
                Colors.white24,
              ],
              durations: [32000, 21000, 18000, 5000],
              // heightPercentages: [0.25, 0.26, 0.28, 0.31],
              heightPercentages: [0.48, 0.49, 0.51, 0.54],
              blur: null,
            ),
            // backgroundColor: Colors.blue[600],
            backgroundColor: kPrimaryColor,
            size: Size(double.infinity, double.infinity),
            // size: size,
          ),
          Positioned(
            top: size.height * 0.08,
            child: child,
          ),
          // Glass(),
        ],
      ),
    );
  }
}

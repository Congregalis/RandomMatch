import 'package:first/constants.dart';
import 'package:flutter/cupertino.dart';

import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;

class LocalView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 100,
        right: 5,
        width: 150,
        height: 190,
        child: Container(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 4, color: kPrimaryColor),
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child:
                  RtcLocalView.SurfaceView()
              ),
            )
        )
    );
  }
}
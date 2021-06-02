import 'package:first/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

class RemoteView extends StatelessWidget {
  int _remoteUid;
  RemoteView(this._remoteUid);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      color: kPrimaryLightColor,
      child: _renderRemoteVideo(size),
    );
  }

  // 生成远端预览
  Widget _renderRemoteVideo(Size size) {

    if (_remoteUid != null) {
      return RtcRemoteView.SurfaceView(uid: _remoteUid);
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '正在等待TA加入房间...',
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 20.0,
              fontFamily: "Courier",
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height * 0.07),
          CircularProgressIndicator(
            backgroundColor: kPrimaryLightColor,
            valueColor: AlwaysStoppedAnimation(kPrimaryColor),
          ),
        ]
      );

    }
  }
}
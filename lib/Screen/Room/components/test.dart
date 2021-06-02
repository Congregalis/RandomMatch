import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:first/Screen/Room/components/info_panel.dart';
import 'package:first/Screen/Room/components/toolbar.dart';
import 'package:first/Screen/Room/components/background.dart';
import 'package:first/Screen/Room/components/local.dart';
import 'package:first/Screen/Room/components/remote.dart';
import 'package:first/constants.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Test extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Test> {
  final _info = <String>[];
  final _users = <int>[];
  bool _joined = false;
  int _remoteUid = null;
  RtcEngine _engine;


  @override
  void dispose() {
    _users.clear();
    _engine.leaveChannel();
    _engine.destroy();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    initialize();
    // initPlatFormState();
  }

  Future<void> initialize() async {
    await _initAgoraRtcEngine();
    _addAgoraEventHandlers();
    await _engine.enableWebSdkInteroperability(true);
    VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
    configuration.dimensions = VideoDimensions(1920, 1080);
    await _engine.setVideoEncoderConfiguration(configuration);
    await _engine.joinChannel(Token, "test", null, 0);
  }

  /// Create agora sdk instance and initialize
  Future<void> _initAgoraRtcEngine() async {
    _engine = await RtcEngine.create(APP_ID);
    await _engine.enableVideo();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(ClientRole.Broadcaster);
  }

  /// Add agora event handlers
  void _addAgoraEventHandlers() {
    _engine.setEventHandler(RtcEngineEventHandler(error: (code) {
      setState(() {
        final info = 'onError: $code';
        _info.add(info);
      });
    }, joinChannelSuccess: (channel, uid, elapsed) {
      setState(() {
        final info = 'onJoinChannel: $channel, uid: $uid';
        _info.add(info);
      });
    }, leaveChannel: (stats) {
      setState(() {
        _info.add('onLeaveChannel');
        _info.clear();
      });
    }, userJoined: (uid, elapsed) {
      setState(() {
        final info = 'userJoined: $uid';
        _info.add(info);
        // _users.add(uid);
        _remoteUid = uid;
      });
    }, userOffline: (uid, elapsed) {
      setState(() {
        final info = 'userOffline: $uid';
        _info.add(info);
        // _users.remove(uid);
        _remoteUid = null;
      });
    }, firstRemoteVideoFrame: (uid, width, height, elapsed) {
      setState(() {
        final info = 'firstRemoteVideo: $uid ${width}x $height';
        _info.add(info);
      });
    }));
  }

  // Future<void> initPlatFormState() async {
  //   await PermissionHandler().requestPermissions(
  //     [PermissionGroup.camera, PermissionGroup.microphone],
  //   );
  //
  //   // 创建RTC客户端实例
  //   RtcEngineConfig config = RtcEngineConfig(APP_ID);
  //   var engine = await RtcEngine.createWithConfig(config);
  //
  //   // 定义事件处理逻辑
  //   engine.setEventHandler(RtcEngineEventHandler(
  //       joinChannelSuccess: (String channel, int uid, int elapsed) {
  //     print('joinChannelSuccess ${channel} ${uid}');
  //     setState(() {
  //       _joined = true;
  //     });
  //   }, userJoined: (int uid, int elapsed) {
  //     print('userJoined ${uid}');
  //     setState(() {
  //       _remoteUid = uid;
  //     });
  //   }, userOffline: (int uid, UserOfflineReason reason) {
  //     print('userOffline ${uid}');
  //     setState(() {
  //       _remoteUid = null;
  //     });
  //   }));
  //
  //   // 开启视频
  //   await engine.enableVideo();
  //   // 加入频道,频道名为 123
  //   await engine.joinChannel(Token, 'test', null, 0);
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        RemoteView(_remoteUid),
        LocalView(),
        InfoPanel(_info),
        Toolbar(),
      ],
    );
  }
}

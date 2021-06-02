import 'package:first/Screen/Join/join_screen.dart';
import 'package:first/Screen/Room/room_screen.dart';
import 'package:first/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Toolbar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () async =>  _showExitConfirmDialog(context),
            child: Icon(
              Icons.keyboard_return_rounded,
              color: Colors.white,
              size: 20.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: kPrimaryColor,
            padding: const EdgeInsets.all(12.0),
          ),
          // RawMaterialButton(
          //   onPressed: () => _onCallEnd(context),
          //   child: Icon(
          //     Icons.call_end,
          //     color: kPrimaryLightColor,
          //     size: 35.0,
          //   ),
          //   shape: CircleBorder(),
          //   elevation: 2.0,
          //   fillColor: kPrimaryColor,
          //   padding: const EdgeInsets.all(15.0),
          // ),
          RawMaterialButton(
            onPressed: () async => _showNextConfirmDialog(context),
            child: Icon(
              Icons.skip_next_rounded,
              color: kPrimaryColor,
              size: 20.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(12.0),
          )
        ],
      ),
    );
  }

  _onCallEnd(BuildContext context) {
    Navigator.pop(context);
    print("end");
  }

  // 弹出是否退出对话框
  Future<bool> _showExitConfirmDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "提示",
            style: TextStyle(
              color: kPrimaryColor,
              // fontSize: 20.0,
              fontFamily: "Courier",
            ),
          ),
          content: Text(
            "要退出了吗?",
            style: TextStyle(
              color: kPrimaryColor,
              // fontSize: 20.0,
              fontFamily: "Courier",
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "再聊会",
                style: TextStyle(
                  color: kPrimaryColor,
                  // fontSize: 20.0,
                  fontFamily: "Courier",
                ),
              ),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            TextButton(
              child: Text(
                "是的",
                style: TextStyle(
                  color: kPrimaryColor,
                  // fontSize: 20.0,
                  fontFamily: "Courier",
                ),
              ),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) {
                    return JoinScreen();
                  }), (Route<dynamic> route) {
                    //返回的事false的都会被从路由队列里面清除掉
                    return route.isFirst;
                });
              },
            ),
          ],
        );
      },
    );
  }

  // 弹出是否下一个对话框
  Future<bool> _showNextConfirmDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "提示",
            style: TextStyle(
              color: kPrimaryColor,
              fontFamily: "Courier",
            ),
          ),
          content: Text(
            "不陪TA聊了吗?",
            style: TextStyle(
              color: kPrimaryColor,
              // fontSize: 20.0,
              fontFamily: "Courier",
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "再聊会吧",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontFamily: "Courier",
                ),
              ),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            TextButton(
              child: Text(
                "不陪了，下一个",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontFamily: "Courier",
                ),
              ),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                      return RoomScreen();
                    }), (Route<dynamic> route) {
                  //返回的事false的都会被从路由队列里面清除掉
                  return route.isFirst;
                });
              },
            ),
          ],
        );
      },
    );
  }
}
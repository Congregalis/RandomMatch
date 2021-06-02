import 'dart:ui';

import 'package:flutter/material.dart';

class Glass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      //可裁切的矩形
      child: ClipRect(
        //背景过滤器
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
          child: Opacity(
            opacity: 0.2,
            child: Container(
              width: 500.0,
              height: 700.0,
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: Center(
                child: Text(
                  "对方设置了隐私",
                  style: TextStyle(fontSize: 40, color: Colors.black),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';

class SaawariCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final double height;
  final double width;
  const SaawariCard({
    Key key,
    @required this.child,
    this.color = Colors.red,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(25),
        vertical: ScreenUtil().setHeight(25),
      ),
      height: ScreenUtil().setHeight(height), // 460
      width: ScreenUtil().setWidth(width), // 310
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(15),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: color,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: child,
    );
  }
}

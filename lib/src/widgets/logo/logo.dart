import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';

class Logo extends StatelessWidget {
  final Color color;

  const Logo({
    Key key,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Container(
      alignment: Alignment.center,
      width: ScreenUtil().setWidth(150),
      height: ScreenUtil().setHeight(50),
      child: Text(
        'Sawaari',
        style: TextStyle(
          fontSize: FontSize.fontSize30,
          color: color,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';

class LocationWidget extends StatelessWidget {
  final String city;
  final String image;

  const LocationWidget({
    Key key,
    @required this.city,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(
            ScreenUtil().setWidth(10),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              ScreenUtil().setWidth(10),
            ),
            image:
                DecorationImage(fit: BoxFit.cover, image: NetworkImage(image)),
          ),
        ),
        Container(
          margin: EdgeInsets.all(
            ScreenUtil().setWidth(10),
          ),
          decoration: BoxDecoration(
            color: Color(0x44000000),
            borderRadius: BorderRadius.circular(
              ScreenUtil().setWidth(10),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(
              ScreenUtil().setHeight(10),
            ),
            alignment: Alignment.bottomLeft,
            child: Text(
              city,
              style: TextStyle(
                fontSize: FontSize.fontSize14,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';
import 'package:sawari/src/widgets/saawari_card/saawari_card.dart';

class Pages extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color color;
  final String image;

  const Pages({
    Key key,
    @required this.title,
    @required this.subTitle,
    @required this.color,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Padding(
      padding: EdgeInsets.all(ScreenUtil().setWidth(20.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Saawari',
            style: TextStyle(
              fontSize: FontSize.fontSize24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(15)),
          Center(
            child: SaawariCard(
              color: color,
              height: 460,
              width: 310,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: FontSize.fontSize20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(10)),
                  Text(
                    subTitle,
                    style: TextStyle(
                      color: Colors.white,
                      wordSpacing: 4,
                      fontSize: FontSize.fontSize14,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(image),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

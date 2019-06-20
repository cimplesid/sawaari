import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';

class PageIndicator extends StatelessWidget {
  final int pageCount;
  final int page;

  const PageIndicator({
    Key key,
    @required this.pageCount,
    @required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Container(
      height: ScreenUtil().setHeight(20),
      width: ScreenUtil().setWidth(300),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (int i = 0; i < pageCount; i++) ...[
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: ScreenUtil().setHeight(10),
              height: ScreenUtil().setHeight(10),
              decoration: BoxDecoration(
                color: page == i ? Color(AppColors.PINK) : Colors.grey[350],
                borderRadius: BorderRadius.circular(
                  ScreenUtil().setHeight(10),
                ),
              ),
            ),
            if (i != pageCount - 1) SizedBox(width: ScreenUtil().setWidth(5)),
          ]
        ],
      ),
    );
  }
}

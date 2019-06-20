import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';
import 'package:sawari/src/pages/getting_started/pages.dart';
import 'package:sawari/src/widgets/page_indicator/page_indicator.dart';

class GettingStarted extends StatefulWidget {
  @override
  _GettingStartedState createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          PageView(
            children: <Widget>[
              Pages(
                title: 'Convenience',
                color: Color(AppColors.BLUE),
                image: Images.onboarding1,
                subTitle: 'Get vehicles delivered at your doorstep.',
              ),
              Pages(
                title: 'Flexibility',
                color: Color(AppColors.PURPLE),
                image: Images.onboarding2,
                subTitle: 'Book by the hour, day or week or month.',
              ),
              Pages(
                title: 'Varieties',
                color: Color(AppColors.ORANGE),
                image: Images.onboarding3,
                subTitle:
                    'Choose from a wide range of vehicles (Car, Bike or Scooter).',
              ),
              Stack(
                children: <Widget>[
                  Pages(
                    title: 'Payment',
                    color: Color(AppColors.LIGHT_PURPLE),
                    image: Images.onboarding4,
                    subTitle: 'Various methods of payment available.',
                  ),
                  Positioned(
                    bottom: ScreenUtil().setHeight(20),
                    right: ScreenUtil().setWidth(20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoutes.LOGIN,
                          (predicate) => false,
                        );
                      },
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          color: Color(AppColors.PINK),
                          fontSize: FontSize.fontSize14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
            onPageChanged: (page) {
              setState(() {
                selectedPage = page;
              });
            },
          ),
          Positioned(
            bottom: ScreenUtil().setHeight(20),
            left: ScreenUtil().setWidth(30),
            child: Center(
              child: PageIndicator(
                page: selectedPage,
                pageCount: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';
import 'package:sawari/src/widgets/logo/logo.dart';
import 'package:sawari/src/widgets/sawaari_text_field/sawaari_text_field.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Stack(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(ScreenSize.screenWidth),
            height: ScreenUtil().setHeight(ScreenSize.screenHeight),
            child: Image.asset(
              Images.login,
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Opacity(
            opacity: 0.55,
            child: Container(
              width: ScreenUtil().setWidth(ScreenSize.screenWidth),
              height: ScreenUtil().setHeight(ScreenSize.screenHeight),
              color: Colors.pinkAccent,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(
              ScreenUtil().setHeight(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Logo(),
                SizedBox(height: ScreenUtil().setHeight(30)),
                Text(
                  'Travelling companion for your next trip.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: FontSize.fontSize16,
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(100)),
                SaawariTextField(
                  label: 'Email Address',
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),
                SaawariTextField(
                  label: 'Password',
                  obscureText: true,
                ),
                SizedBox(height: ScreenUtil().setHeight(20)),
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.HOME_PAGE,
                        (predicate) => false,
                      );
                    },
                    color: Colors.lime,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(5),
                        horizontal: ScreenUtil().setWidth(10),
                      ),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: FontSize.fontSize14,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Don\'t have an account yet? ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: FontSize.fontSize12,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.SIGN_UP);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: FontSize.fontSize12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

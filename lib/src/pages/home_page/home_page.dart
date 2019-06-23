import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';
import 'package:sawari/src/widgets/location_widget/location_widget.dart';
import 'package:sawari/src/widgets/logo/logo.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  Future<List> getCity() async {
    http.Response res = await http.get('http://sawari.nepsify.com/api/city/');
    return json.decode(res.body);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Color(AppColors.PINK),
          ),
        ),
        centerTitle: true,
        title: Logo(
          color: Color(AppColors.PINK),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(20),
          left: ScreenUtil().setHeight(20),
          right: ScreenUtil().setHeight(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Hello, User',
              style: TextStyle(
                fontSize: FontSize.fontSize20,
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            Text(
              'Please select your pickup location',
              style: TextStyle(
                fontSize: FontSize.fontSize16,
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(15)),
            Expanded(
              child: Container(
                child: FutureBuilder(
                    future: getCity(),
                    builder:
                        (BuildContext context, AsyncSnapshot<List> snapshot) {
                      if (!snapshot.hasData)
                        return Center(child: CircularProgressIndicator());

                      List cities = snapshot.data;

                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 5 / 4,
                          ),
                          itemCount: cities.length,
                          itemBuilder: (context, index) {
                            var city = cities[index];
                            return LocationWidget(
                              city: city["name"],
                              image: city['city_image'],
                            );
                          });
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

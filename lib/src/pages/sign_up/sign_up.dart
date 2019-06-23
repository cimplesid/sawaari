import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sawari/src/assets/assets.dart';
import 'package:sawari/src/widgets/logo/logo.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var nameController = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(AppColors.PINK),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Logo(),
      ),
      backgroundColor: Color(AppColors.PINK),
      body: Container(
        height: double.infinity,
        width: ScreenUtil().setWidth(ScreenSize.screenWidth),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              ScreenUtil().setWidth(40),
            ),
            topRight: Radius.circular(
              ScreenUtil().setWidth(40),
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: ScreenUtil().setHeight(20),
          horizontal: ScreenUtil().setWidth(30),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: ScreenUtil().setHeight(20)),
                Text(
                  'Register with us',
                  style: TextStyle(
                    fontSize: FontSize.fontSize18,
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(40)),
                TextFormField(
                  onSaved: (input) => nameController.text = input,
                  validator: (input) =>
                      input.isEmpty ? 'Must not be empty' : null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(15)),
                TextFormField(
                  onSaved: (input) => emailController.text = input,
                  validator: (input) =>
                      !input.contains('@') ? 'Not a valid email' : null,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(15)),
                TextFormField(
                  onSaved: (input) => phoneController.text = input,
                  validator: (input) =>
                      input.length != 10 ? 'Must be 10 characters' : null,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone No.',
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(15)),
                TextFormField(
                  onSaved: (input) => passwordController.text = input,
                  validator: (input) => input.length < 8
                      ? 'Must be more than 8 characters'
                      : null,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(15)),
                TextFormField(
                  obscureText: true,
                  onSaved: (input) => confirmPasswordController.text = input,
                  validator: (input) => input != passwordController.text
                      ? 'password donot match'
                      : null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Re-enter Password',
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(15)),
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      if (form.currentState.validate()) {
                        form.currentState.save();
                        Map<String, dynamic> user = {
                          "name": nameController.text,
                          "username": usernameController.text,
                          "password": passwordController.text,
                          "address": addressController.text,
                          "phone_number": phoneController.text,
                          "email": emailController.text
                        };
                        print(user);
                      }
                    },
                    color: Colors.lime,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setHeight(5),
                        horizontal: ScreenUtil().setWidth(10),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: FontSize.fontSize14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

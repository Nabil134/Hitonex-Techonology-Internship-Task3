import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task3/constants/colors.dart';
import 'package:task3/constants/images.dart';

class SplashScreen extends StatefulWidget {
  final Widget child;
  const SplashScreen({super.key,required this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    Future.delayed(const Duration(milliseconds: 3000)).then((value){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget.child), (route) => false);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  kTertiaryColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset(splashscreen,
            height: 63.h,
            width: 228.w,
          ),
          Padding(
            padding:  EdgeInsets.only(left:80.w),
            child: Text('File sharing made easy',style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 30.sp,
              color: Color(0xffFFFBFB),
            ),),
          ),

        ],),
      ),
    );
  }
}

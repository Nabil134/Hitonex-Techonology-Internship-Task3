import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task3/constants/colors.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kSecondaryColor,
        title: Text('Xchange',style: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.w400,
          fontSize: 30.sp,
        ),),
      ),
   body: Column(children: [
     ReuseableWidget(img: 'Folder1.png', txt: 'Internal Storage\n 98GB of 128GB'),

   ],),
    );
  }
}
/*reuseablewidget start here*/
class ReuseableWidget extends StatelessWidget {
  final String img,txt;
  const ReuseableWidget({super.key,required this.img,required this.txt});

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      Image.asset('assets/$img',height: 45.h,),
      Text(txt,style: TextStyle(
        color: kTertiaryColor,
        fontWeight: FontWeight.w400,
        fontSize: 26.sp,
      ),),
    ],);
  }
}

/*reuseablewidget end here*/
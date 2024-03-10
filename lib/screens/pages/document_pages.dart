import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task3/constants/colors.dart';

class DocumentPages extends StatefulWidget {
  const DocumentPages({super.key});

  @override
  State<DocumentPages> createState() => _DocumentPagesState();
}

class _DocumentPagesState extends State<DocumentPages> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(children: [
      Expanded(child:
        ListView.builder(
          itemCount: 4,
            itemBuilder: (context,index){
          return ReuseableWidget(img: 'File.png', txt: 'WA-22021809');
        }),
      ),
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
      Image.asset('assets/$img',height: 44.h,),
      Text(txt,style: TextStyle(
        color: kSecondaryColor,
        fontWeight: FontWeight.w400,
        fontSize: 26.sp,
      ),),
    ],);
  }
}

/*reuseablewidget end here*/
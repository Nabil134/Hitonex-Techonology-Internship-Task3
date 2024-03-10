import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task3/constants/colors.dart';

class FolderPage extends StatefulWidget {
  const FolderPage({super.key});

  @override
  State<FolderPage> createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kSecondaryColor,
        title: Text('Xchange',style: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.w400,
          fontSize: 30.sp,
        ),),
      ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
       ReuseableWidget(img: 'Folder1.png', txt: 'Document1.pdf'),
        SizedBox(height: 10,),
        ReuseableWidget(img: 'Folder1.png', txt: 'Word_file.docx'),
        SizedBox(height: 10,),
        ReuseableWidget(img: 'Image.png', txt: 'IMG220234.png'),

      ],),
    ),
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
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task3/constants/colors.dart';

class SharePage extends StatefulWidget {
  const SharePage({super.key});

  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kSecondaryColor,
        title: Text('Xchange',style: TextStyle(
          color:kPrimaryColor ,
          fontWeight: FontWeight.w400,
          fontSize: 30.sp,
        ),),
      ),
  body: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(children: [
      /*first portion start here*/
      Center(
        child: Text('Share file via',style: TextStyle(
          color: kSecondaryColor,
          fontSize: 30.sp,
          fontWeight: FontWeight.w600,
        ),),
      ),
      /*first portion end here*/
      /*second portion start here*/
      ReuseableRow(txt: 'Get Code'),
      /*second portion end here*/
      Divider(
        color: kTertiaryColor,
      ),
      /*third portion start here*/
      ReuseableRow(txt: 'Nearby devices'),
      /*third portion end here*/
      Divider(
        color: kTertiaryColor,
      ),
      /*third portion start here*/
      ReuseableRow(txt: 'QR code scanning'),
      /*third portion end here*/
      Divider(
        color: kTertiaryColor,
      ),
    ],),
  ),
    );
  }
}
/*reuseablerow start here*/
class ReuseableRow extends StatelessWidget {
  final String txt;
  const ReuseableRow({super.key,required this.txt});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(txt,style: TextStyle(
          color: kTertiaryColor,
          fontSize: 30.sp,
          fontWeight: FontWeight.w600,
        ),),
        Icon(Icons.arrow_forward_ios,
          color: kTertiaryColor,
        ),
      ],
    );
  }
}

/*reuseablerow end here here*/
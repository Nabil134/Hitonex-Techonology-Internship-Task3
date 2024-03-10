import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task3/constants/colors.dart';
import 'package:task3/screens/pages/audio_pages.dart';
import 'package:task3/screens/pages/document_pages.dart';
import 'package:task3/screens/pages/photo_pages.dart';
import 'package:task3/screens/pages/share_page.dart';
import 'package:task3/screens/pages/video_pages.dart';

import '../pages/apps_page.dart';
import '../pages/folder_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentSelectedCategory = 0;
  List<Widget> _pages = [
    const  FolderPage(),
    const  AppPage(),
    const SharePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kPrimaryColor,
      bottomNavigationBar: Container(
        height: 70,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color:kPrimaryColor ,
        ),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
       IconBottomBar(icon: Icons.folder, selected: _selectedIndex==0, onTap: (){
         Navigator.push(context,MaterialPageRoute(builder: (context) =>FolderPage()));
         setState(() {
           _selectedIndex=0;
         });
       }),
       IconBottomBar(icon: Icons.apps, selected: _selectedIndex==1, onTap: (){
         Navigator.push(context,MaterialPageRoute(builder: (context) =>AppPage()));
         setState(() {
           _selectedIndex=1;
         });
       }),
       IconBottomBar(icon: Icons.share, selected: _selectedIndex==2, onTap: (){
         Navigator.push(context,MaterialPageRoute(builder: (context) =>SharePage()));
         setState(() {
           _selectedIndex=2;
         });
       }),
     ],),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kSecondaryColor,
        title: Text('Xchange',style: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.w400,
          fontSize: 30.sp,
        ),),
      ),
   body:Container(
     margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
     child: SingleChildScrollView(
       child: Column(children: [
         /*first portion start here*/
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          ReuseableContainer(img: 'Download.png', txt: 'Sent'),
          ReuseableContainer(img: 'Upload.png', txt: 'Received'),
        ],),
         /*first portion end here*/
         /*second portion start here*/
SingleChildScrollView(
scrollDirection: Axis.horizontal,
  child:
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
           _singleCategoryItemWidget(
             title: 'Photos',
             color: _currentSelectedCategory==0?kTertiaryColor:kPrimaryColor,
             onTap: (){
               setState(() {
                 _currentSelectedCategory=0;
               });
             },
           ),
             SizedBox(width: 10.w,),
           _singleCategoryItemWidget(
             title: 'Videos',
             color: _currentSelectedCategory==1?kTertiaryColor:kPrimaryColor,
             onTap: (){
               setState(() {
                 _currentSelectedCategory=1;
               });
             },
           ),
             SizedBox(width: 10.w,),
           _singleCategoryItemWidget(
             title: 'Audio',
             color: _currentSelectedCategory==2?kTertiaryColor:kPrimaryColor,
             onTap: (){
               setState(() {
                 _currentSelectedCategory=2;
               });
             },
           ),
             SizedBox(width: 10.w,),
           _singleCategoryItemWidget(
             title: 'Documents',
             color: _currentSelectedCategory==3?kTertiaryColor:kPrimaryColor,
             onTap: (){
               setState(() {
                 _currentSelectedCategory=3;
               });
             },
           ),

         ],),
),
/*second portion end here*/
       /*last portion start here*/
SizedBox(
  height: 500,
  child:
         _switchSingleCategoryItemWidgetOnSelectedIndex(_currentSelectedCategory),
),
         /*last portion end here*/

       ],),
     ),
   ),
    );
  }
}
/*IconBottomBar start here*/
class IconBottomBar extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final Function() onTap;
  const IconBottomBar({super.key,required this.icon,required this.selected,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      IconButton(onPressed: onTap, icon: Icon(icon),
        color: selected?kSecondaryColor:kGreyColor,
      ),
    ],);
  }
}

/*IconBottomBar end here*/
/*reuseablecontainer start here*/
class ReuseableContainer extends StatelessWidget {
  final String img, txt;
  const ReuseableContainer({super.key,required this.img,required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(height:150.h,
      width: 150.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kTertiaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/$img',height: 58.h,),
          Text(txt,style: TextStyle(
            color:kPrimaryColor,
            fontSize: 25.sp,
            fontWeight: FontWeight.w400,
          ),),
        ],),
    );
  }
}

/*reuseablecontainer end here*/
/*_singleCategoryItemWidget start here*/
_singleCategoryItemWidget({VoidCallback? onTap,Color? color,String? title}){
  return GestureDetector(
    onTap: onTap,
    child: Column(children: [
      Text('$title',style: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w600,
        color: kTertiaryColor,
      ),),
      Container(
        height: 2.h,
        width: 68.w,
        color: color,
      ),
    ],),
  );
}
/*_singleCategoryItemWidget end here*/
_switchSingleCategoryItemWidgetOnSelectedIndex(int index){
  switch(index){
    case 0:
      {
        return PhotoPage();
      }
    case 1:
      {
        return VideoGridView();
      }
    case 2:{
      return  AudioPage();
    }
    case 3:{
      return  DocumentPages();
    }
  }

}
/*_switchSpecialCategoryOnSelectedIndex end here*/
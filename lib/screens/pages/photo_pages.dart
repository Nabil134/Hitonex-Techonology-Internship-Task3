import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task3/data/task3_data.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8),
        child: photogridview(),
      ),
    );
  }
}
/*photogridview start here*/
photogridview(){
  return GridView.builder(
      itemCount:PHOTO_CATEGORY_LIST.length,
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 10,
      ),
      itemBuilder:(context,index){
        return Image.asset('assets/${PHOTO_CATEGORY_LIST[index]['image']}',height: 115.h,width: 115.h,);

      });
}

/*photogridview end here*/

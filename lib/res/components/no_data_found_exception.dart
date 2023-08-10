

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_darshan/res/colors/app_color.dart';


class NoDataFoundExceptionWidget extends StatefulWidget {
  final VoidCallback onPress ;
  const NoDataFoundExceptionWidget({Key? key , required this.onPress}) : super(key: key);

  @override
  State<NoDataFoundExceptionWidget> createState() => _NoDataFoundExceptionWidgetState();
}

class _NoDataFoundExceptionWidgetState extends State<NoDataFoundExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: height * .15 ,),
          const Icon(Icons.image_not_supported_outlined , color: AppColor.redColor,size: 50,),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(child: Text('No data available' , textAlign: TextAlign.center,)),
          ),
          SizedBox(height: height * .15 ,),
          InkWell(
            onTap: widget.onPress,
            child: Container(
              height: 44,
              width: 160,
              decoration: BoxDecoration(
                  color: AppColor.primaryColor ,
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Center(child: Text('Retry' , style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),)),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';

import '../../../Utils/translation_key.dart';


class ReviewingSuccessWidget extends StatelessWidget {

  const ReviewingSuccessWidget({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child:
      Container(
        color: kWhiteColor,
        height: Get.height*0.4,
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children:  [
            SizedBox(
              height: Get.height*0.3,
              width: Get.width*0.7,
              child: Image.asset("assets/images/reservationSuccess.jpg",fit: BoxFit.fitWidth,),
            ),
            SizedBox(
              height: Get.height*0.03,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Center(
                child:  CustomText(commentSuccess.tr,
                  style: const TextStyle(
                      height: 1,
                      fontFamily: fontFamilyName,
                      color: kGreenColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 30),),
              ),
            ),

          ],
        ),
      ),
    );

  }
}
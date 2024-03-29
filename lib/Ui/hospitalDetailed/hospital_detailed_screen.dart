// ignore_for_file: sized_box_for_whitespace, prefer_is_empty


import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Ui/dector_detailed_screen/controller/doctor_detailed_controller.dart';
import 'package:privilegecare/Ui/dector_detailed_screen/doctor_detailed_screen.dart';
import 'package:privilegecare/Ui/hospitalDetailed/controller/hospital_detailed_controller.dart';

import 'package:privilegecare/Utils/colors.dart';
import 'package:privilegecare/Utils/constant.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/services.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/widgets/bottom_navigation_bar.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';
import 'package:privilegecare/widgets/loader.dart';
import 'package:star_rating/star_rating.dart';

class HospitalDetailedScreen extends StatelessWidget {
  final String hospitalId;
  const HospitalDetailedScreen({Key? key, required this.hospitalId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HospitalDetailedController>(
      init: HospitalDetailedController(hospitalId),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: kGreenColor,
          leadingWidth: 60,
          leading: IconButton(icon: Get.find<StorageService>().activeLocale == SupportedLocales.english?const Icon(Icons.arrow_circle_left_outlined,color: kWhiteColor,size: 40,):const Icon(Icons.arrow_circle_right_outlined,color: kWhiteColor,size: 40,),onPressed: (){
            Get.back();
          },),
          centerTitle: false,
          title:   CustomText(
            hospDetailsTitle.tr,
            style: const TextStyle(
                fontFamily: fontFamilyName,
                color: kWhiteColor,
                fontWeight: FontWeight.w800,
                fontSize: 18),
          ),
          actions: [InkWell(
            onTap: (){
            },

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){

            controller.screenIndex = 3;
            if(Get.find<StorageService>().getId == "0") {

            CoolAlert.show(
            context: context,
            type: CoolAlertType.confirm,
            title: "",
            text: addToFavText.tr,
            textTextStyle: const TextStyle(
            fontFamily: fontFamilyName,
            color: kBlueColor,
            fontWeight: FontWeight.w800,
            fontSize: 15),
            onConfirmBtnTap: (){
            controller.screenIndex = 1;
            },
            onCancelBtnTap:(){
            controller.screenIndex = 2;
            },
            confirmBtnText: signInProfile.tr,
            cancelBtnText: signUpProfile.tr,
            confirmBtnColor: Colors.white,
            cancelBtnTextStyle:   const TextStyle(
            fontFamily: fontFamilyName,
            color: kGreenColor,
            fontWeight: FontWeight.w800,
            fontSize: 15),
            confirmBtnTextStyle: const TextStyle(
            fontFamily: fontFamilyName,
            color: kGreenColor,
            fontWeight: FontWeight.w800,
            fontSize: 15),
            ).then((value){
            controller.goToScreen();
            });
            }else{
            controller.addingOrRemovingFromFavorite(
            "${controller.hospitalData?.id}",
            context,
            controller.hospitalData?.name ?? "");
            }},

              child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(10),

              ),
              child:  Center(
                child: controller.hospitalAddedOrNot?const Icon(
                  Icons.favorite,
                  color: kBlueColor,
                ):const Icon(
                  Icons.favorite_border_rounded,
                  color: kBlueColor,
                ),
                  ),
                ),
                  ),
                  const SizedBox(width: 10,),
                  InkWell(
                    onTap: (){
                      controller.shareDoctorLink();
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.share,
                          color: kBlueColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          ],
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(selectedTap: 3,),
        backgroundColor: kLightGrayColor,
        body: controller.isLoading?const Loader():RawScrollbar(
          thumbColor: kBlueColor,
          radius: const Radius.circular(20),
          thickness: 5,
          child: SingleChildScrollView(
            controller: controller.sController,
            child:  Container(
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),
              controller.hospitalData?.image?.length!=0? CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: "${Services.baseUrl}${controller.hospitalData?.image?[0]??""}",
                    imageBuilder: ((context, image){
                      return   Container(
                        height: Get.height*0.11,
                        width: Get.width*0.3,
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          border: Border.all(color: kBlueColor,width: 2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          height: Get.height*0.12,
                          width: Get.width*0.3,
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            border: Border.all(color: kGreenColor,width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            height: Get.height*0.12,
                            width: Get.width*0.3,
                            decoration: BoxDecoration(
                              color: kBlueColor,
                              image: DecorationImage(
                                image: image,
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),

                          ),
                        ),
                      );
                    }),
                    placeholder: (context, image){
                      return    Container(
                        height: Get.height*0.11,
                        width: Get.width*0.3,
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          border: Border.all(color: kBlueColor,width: 2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          height: Get.height*0.12,
                          width: Get.width*0.3,
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            border: Border.all(color: kGreenColor,width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            height: Get.height*0.12,
                            width: Get.width*0.3,
                            decoration: BoxDecoration(
                              color: kBlueColor,

                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Center(
                              child: CircularProgressIndicator(color: kGreenColor,),
                            ),
                          ),
                        ),
                      );
                    },
                    errorWidget: (context, url, error){
                      return Container(
                          height: 80,
                          width: 80,

                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/logo.png"),
                              fit: BoxFit.fill,
                            ),


                          )
                      );
                    },
                  ):Container(
              height: 80,
              width: 80,

              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                  fit: BoxFit.fill,
                ),
              )
              ),

                  const SizedBox(height: 20,),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomText(Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.hospitalData?.nameEn??"":controller.hospitalData?.name??"",
                      style: const TextStyle(
                          fontFamily: fontFamilyName,

                          color: kBlueColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 20),),
                  ),
                  const SizedBox(height: 10,),
                  StarRating(
                    color: kGreenColor,
                    mainAxisAlignment: MainAxisAlignment.center,
                    length: 5,
                    rating: (controller.hospitalData?.rate??0).toDouble(),
                    between: 0,
                    starSize: 20,
                    onRaitingTap: (rating) {

                    },
                  ),
                  controller.hospitalData?.lab==0 && controller.hospitalData?.xray==0 ?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 27,
                              child: Image.asset("assets/icons/specialty_icon.png",fit: BoxFit.fitHeight,),
                            ),
                            const SizedBox(width: 5,),
                             Column(
                              children: [
                                 Text(hospCategoryTitle2.tr,
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),),
                                const SizedBox(height: 5,),
                                CustomText("${controller.hospitalData?.specCount??0} ${hospCategoryText2.tr}",
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kGreenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 38,
                              child: Image.asset("assets/icons/doctor_icon.png",fit: BoxFit.fitHeight,),
                            ),
                            const SizedBox(width: 5,),
                             Column(
                              children: [
                                CustomText(hospCategoryTitle1.tr,
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),),
                                const SizedBox(height: 5,),
                                CustomText("${controller.hospitalData?.doctors??0} ${hospCategoryText1.tr}",
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kGreenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),),
                              ],
                            )
                          ],
                        ),


                      ],
                    ),
                  ):
                      //this if the hospital activate all categories
                  controller.hospitalData?.lab==1 && controller.hospitalData?.xray == 1?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                        children: [
                          SizedBox(
                            height: 35,
                            width: 23,
                            child: Image.asset("assets/icons/specialty_icon.png",fit: BoxFit.fitHeight,),
                          ),
                          const SizedBox(width: 1,),
                          Column(
                            children: [
                              CustomText(hospCategoryTitle2.tr,
                                style: const TextStyle(
                                    fontFamily: fontFamilyName,

                                    color: kBlueColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13),),
                              const SizedBox(height: 5,),
                              CustomText("${controller.hospitalData?.specCount??0} ${hospCategoryText2.tr}",
                                style: const TextStyle(
                                    fontFamily: fontFamilyName,

                                    color: kGreenColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13),),
                            ],
                          )
                        ],
                      ),
                        const SizedBox(width: 3,),
                        Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 38,
                              child: Image.asset("assets/icons/doctor_icon.png",fit: BoxFit.fitHeight,),
                            ),
                            const SizedBox(width: 5,),
                            Column(
                              children: [
                                CustomText(hospCategoryTitle1.tr,
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),),
                                const SizedBox(height: 5,),
                                CustomText("${controller.hospitalData?.doctors??0} ${hospCategoryText1.tr}",
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kGreenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(width: 3,),
                        Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 27,
                              child: Image.asset("assets/icons/analysis_icon.png",fit: BoxFit.fitHeight,),
                            ),
                            const SizedBox(width: 5,),
                             Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(hospCategoryTitle3.tr,
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),),

                              ],
                            )
                          ],
                        ),
                        const SizedBox(width: 3,),
                        Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 27,
                              child: Image.asset("assets/icons/rays_icons.png",fit: BoxFit.fitHeight,),
                            ),
                            const SizedBox(width: 3,),
                             Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(

                                  child: CustomText(hospCategoryTitle4.tr,
                                    style: const TextStyle(
                                        fontFamily: fontFamilyName,

                                        color: kBlueColor,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 13),),
                                ),

                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ):
                  //this if the hospital activate lap categories
                  controller.hospitalData?.lab==1?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 27,
                              child: Image.asset("assets/icons/specialty_icon.png",fit: BoxFit.fitHeight,),
                            ),
                            const SizedBox(width: 5,),
                            Column(
                              children: [
                                CustomText(hospCategoryTitle2.tr,
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),),
                                const SizedBox(height: 5,),
                                CustomText("${controller.hospitalData?.specCount??0} ${hospCategoryText2.tr}",
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kGreenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 38,
                              child: Image.asset("assets/icons/doctor_icon.png",fit: BoxFit.fitHeight,),
                            ),
                            const SizedBox(width: 5,),
                            Column(
                              children: [
                                CustomText(hospCategoryTitle1.tr,
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),),
                                const SizedBox(height: 5,),
                                CustomText("${controller.hospitalData?.doctors??0} ${hospCategoryText1.tr}",
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kGreenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 27,
                              child: Image.asset("assets/icons/analysis_icon.png",fit: BoxFit.fitHeight,),
                            ),
                            const SizedBox(width: 5,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(hospCategoryTitle3.tr,
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),),

                              ],
                            )
                          ],
                        ),


                      ],
                    ),
                  ):controller.hospitalData?.xray==1?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 27,
                              child: Image.asset("assets/icons/specialty_icon.png",fit: BoxFit.fitHeight,),
                            ),
                            const SizedBox(width: 5,),
                            Column(
                              children: [
                                CustomText(hospCategoryTitle2.tr,
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),),
                                const SizedBox(height: 5,),
                                CustomText("${controller.hospitalData?.specCount??0} ${hospCategoryText2.tr}",
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kGreenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 38,
                              child: Image.asset("assets/icons/doctor_icon.png",fit: BoxFit.fitHeight,),
                            ),
                            const SizedBox(width: 5,),
                            Column(
                              children: [
                                CustomText(hospCategoryTitle1.tr,
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),),
                                const SizedBox(height: 5,),
                                CustomText("${controller.hospitalData?.doctors??0} ${hospCategoryText1.tr}",
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kGreenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),),
                              ],
                            )
                          ],
                        ),

                        Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 27,
                              child: Image.asset("assets/icons/rays_icons.png",fit: BoxFit.fitHeight,),
                            ),
                            const SizedBox(width: 5,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(hospCategoryTitle3.tr,
                                  style: const TextStyle(
                                      fontFamily: fontFamilyName,

                                      color: kBlueColor,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 13),),

                              ],
                            )
                          ],
                        ),

                      ],
                    ),
                  ):
                  const SizedBox(),
                  const SizedBox(height: 20,),
                  controller.hospitalData?.image?.length!=0?CarouselSlider.builder(
                    carouselController: controller.cController,
                    itemCount: controller.hospitalData?.image?.length,
                    itemBuilder: (context, index, realIdx){
                      return CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: "${Services.baseUrl}${controller.hospitalData?.image?[index]??""}",
                        imageBuilder: ((context, image){
                          return  Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: Get.width*0.9,
                                  height: Get.height*0.2,

                                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration:   BoxDecoration(
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                        image: image,
                                        fit: BoxFit.fitHeight),
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(0, 2),
                                        blurRadius: 6,
                                        color: Colors.black12,
                                      ),
                                    ],
                                  ),

                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height:30,
                                    width:50,
                                    decoration:  const BoxDecoration(
                                      color: Color.fromRGBO(0, 0, 0, 0.3),

                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 2),
                                          blurRadius: 6,
                                          color: Colors.black12,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${controller.currentIndex+1}/${controller.hospitalData?.image?.length??0}",
                                        style: const TextStyle(
                                            fontFamily: fontFamilyName,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18),
                                      ),
                                    ),

                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                        placeholder: (context, image){
                          return  Padding(
                            padding:  const EdgeInsets.all(5),
                            child: Container(
                                decoration: const BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(15))
                                ),
                                child: Loader(width: MediaQuery.of(context).size.width,height: 150.0)),
                          );
                        },
                        errorWidget: (context, url, error){
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/no_data_slideShow.png"),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))

                              )
                          );
                        },
                      );

                    },
                    options: CarouselOptions(
                        height: Get.height*0.23,
                        initialPage: 0,
                        onPageChanged: (index,_){controller.selectingPage(index);},
                        aspectRatio: 2.0,
                        enlargeCenterPage: false,
                        viewportFraction: 1,

                        autoPlay: true),
                  ):
                  Container(
                      width: Get.width*0.9,
                      height: Get.height*0.2,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/no_data_slideShow.png"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius:
                          BorderRadius.all(Radius.circular(15))

                      )
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    width: Get.width,
                    child:    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: CustomText(aboutHospKey.tr,
                        style: const TextStyle(
                            fontFamily: fontFamilyName,

                            color: kBlueColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    width: Get.width,
                    child:   Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: CustomText(Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.hospitalData?.detailsEn??"":controller.hospitalData?.details??"",

                        style: const TextStyle(
                            fontFamily: fontFamilyName,

                            color: kGreenColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [ SizedBox(
                        height: 15,
                        width: 20,
                        child: Image.asset("assets/images/place.png",fit: BoxFit.fitHeight,),
                      ),
                        const SizedBox(width: 10,),
                        Container(
                          width: Get.width*0.6,
                          child:   CustomText(controller.hospitalData?.address??"",
                            style: const TextStyle(
                                fontFamily:fontFamilyName,
                                color: kBlueColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                            textAlign: TextAlign.start,
                          ),

                        ),




                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      controller.callNumber(controller.hospitalData?.phone??"");
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [SizedBox(
                          height: 8,
                          width: 20,
                          child: Image.asset("assets/images/call.png",fit: BoxFit.fitHeight,),
                        ),
                          const SizedBox(width: 10,),
                          Container(
                            width:  Get.width*0.4,
                            child:  CustomText(controller.hospitalData?.phone??"",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontFamily: fontFamilyName,
                                  color: kBlueColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: "${Services.baseUrl}${controller.hospitalData?.mapImage??""}",
                    imageBuilder: ((context, image){
                      return  Container(
                        width: Get.width*0.9,
                        height: Get.height*0.2,

                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration:   BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                              image: image,
                              fit: BoxFit.cover),
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 2),
                              blurRadius: 6,
                              color: Colors.black12,
                            ),
                          ],
                        ),

                      );
                    }),
                    placeholder: (context, image){
                      return  Padding(
                        padding:  const EdgeInsets.all(5),
                        child: Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(15))
                            ),
                            child: Loader(width: MediaQuery.of(context).size.width,height: 150.0)),
                      );
                    },
                    errorWidget: (context, url, error){
                      return Container(
                          width: Get.width*0.9,
                          height: Get.height*0.2,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/no_data_slideShow.png"),
                                fit: BoxFit.fill,
                              ),
                              borderRadius:
                              BorderRadius.all(Radius.circular(15))

                          )
                      );
                    },
                  ),

                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      controller.showHospitalLocation();
                    },
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: CustomText(moreDetailsHosp.tr,
                        style: const TextStyle(
                            fontFamily: fontFamilyName,
                            color: kGreenColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 15),),
                    ),
                  ),
                  const SizedBox(height: 10,),
                   Row(
                    mainAxisAlignment: controller.hospitalData?.lab==1 && controller.hospitalData?.xray == 1?MainAxisAlignment.spaceBetween:MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap:(){
                          controller.selectingCategory(0);
                        },
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: CustomText(hospCategoryTitle1.tr,
                            style: TextStyle(
                                fontFamily: fontFamilyName,

                                color: controller.currentActivePage==0?kBlueColor:kGreenColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 17),),
                        ),
                      ),
                      controller.hospitalData?.lab==1?InkWell(
                        onTap:(){
                          controller.selectingCategory(1);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: CustomText(hospCategoryTitle3.tr,
                            style: TextStyle(
                                fontFamily: fontFamilyName,
                                color:  controller.currentActivePage==1?kBlueColor:kGreenColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 17),),
                        ),
                      ):const SizedBox(),
                      controller.hospitalData?.xray==1?InkWell(
                        onTap:(){
                          controller.selectingCategory(2);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: CustomText(hospCategoryTitle4.tr,
                            style: TextStyle(
                                fontFamily: fontFamilyName,
                                color:  controller.currentActivePage==2?kBlueColor:kGreenColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 17),),
                        ),
                      ):const SizedBox(),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  controller.currentActivePage==0?
                  controller.doctorHasNoData?Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 7.0),
                      child: SizedBox(
                          child: DecoratedBox(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 2),
                                    blurRadius: 6,
                                    color: Colors.black12,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Container(
                                  height: 130,
                                  width: Get.width*0.75,
                                  child: Row(
                                    children: [
                                      Image.asset("assets/images/Doctors-rafiki.png",height: Get.width*0.23,),
                                      Container(
                                        width: Get.width*0.5,
                                          child:  CustomText(noDoctorDataHosp.tr,style: const TextStyle(color: kGreenColor,fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,)),
                                    ],
                                  ),
                                ),
                              )))):
                  Container(
                    height: Get.height*0.17,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                      itemCount: controller.doctorsData?.length,
                      controller: controller.sController,
                      itemBuilder: (_,index){
                        return   InkWell(
                            onTap: (){
                              bool test1 = Get.isRegistered<DoctorDetailedController>();
                              if(test1){
                                Get.delete<DoctorDetailedController>();
                              }
                              Get.to( DoctorDetailedScreen(doctorId: "${controller.doctorsData?[index].id??0}",));
                            },
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: Get.width*0.03),
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: "${Services.baseUrl}${controller.doctorsData?[index].image??""}",
                                  imageBuilder: ((context, image){
                                    return  Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: image,
                                            fit: BoxFit.cover,
                                          ),


                                        )
                                    );
                                  }),
                                  placeholder: (context, image){
                                    return  const Center(child: CircularProgressIndicator(color: kBlueColor,));
                                  },
                                  errorWidget: (context, url, error){
                                    return Container(
                                        height: 80,
                                        width: 80,

                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage("assets/images/doctor.png"),
                                            fit: BoxFit.fill,
                                          ),


                                        )
                                    );
                                  },
                                ),
                                const SizedBox(height: 5),
                                CustomText( Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.doctorsData![index].nameEn!:controller.doctorsData![index].name!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      height: 1,
                                      fontFamily:fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),),
                                const SizedBox(height: 5,),
                                CustomText(Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.doctorsData![index].specialistEn!:controller.doctorsData![index].specialist!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      height: 1,
                                      fontFamily: fontFamilyName,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),),
                              ],
                            ),
                          ),
                        );
                      }
                      )):controller.currentActivePage==1?Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: CustomText(Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.lapData?.titleEn??"":controller.lapData?.title??"",
                            style: const TextStyle(
                                fontFamily: fontFamilyName,

                                color: kBlueColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 20),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Html(
                          data: Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.lapData?.descEn??"":controller.lapData?.desc??"",
                          style: {
                            "body": Style(
                              fontFamily: fontFamilyName,
                              color: kGreenColor,
                              fontWeight: FontWeight.w800,
                              fontSize: FontSize(20),
                            ),
                          },),
                      )
                    ],
                  ):Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: CustomText(Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.xrayData?.titleEn??"":controller.xrayData?.title??"",
                            style: const TextStyle(
                                fontFamily: fontFamilyName,

                                color: kBlueColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 20),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Html(
                          data: Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.xrayData?.descEn??"":controller.xrayData?.desc??"",
                          style: {
                            "body": Style(
                              fontFamily: fontFamilyName,
                              color: kGreenColor,
                              fontWeight: FontWeight.w800,
                              fontSize: FontSize(20),
                            ),
                          },),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
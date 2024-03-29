// ignore_for_file: prefer_is_empty, prefer_typing_uninitialized_variables

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privilegecare/Models/hospital_list_model.dart';
import 'package:privilegecare/Models/response_model.dart';
import 'package:privilegecare/Services/favoutite_services.dart';
import 'package:privilegecare/Utils/localization_services.dart';
import 'package:privilegecare/Utils/memory.dart';
import 'package:privilegecare/Utils/translation_key.dart';
import 'package:privilegecare/widgets/custom_text_widget.dart';

class FavoriteHospitalController extends GetxController{
  bool isLoading = true;
  bool hasNoData = false;
  List<HospitalListModel>? hospitalsData = [];
  @override
  void onInit() {
    super.onInit();
    getData();
  }
  @override
  void dispose(){
    super.dispose();
    Get.delete<FavoriteHospitalController>();
  }
  getData() async {
    isLoading = true;
    update();
    hospitalsData = await FavouriteServices.getHospitalInThisFavoriteList(Get
        .find<StorageService>()
        .getId);
    if (hospitalsData?.length == 0 || hospitalsData == null) {
      hasNoData = true;
    }
    isLoading = false;
    update();
  }
  addingOrRemovingFromFavorite(String hospitalId,context,String hospitalName,HospitalListModel index) async {

    ResponseModel? status = await FavouriteServices
        .addOrRemoveHospitalFromFavorite(
        hospitalId, Get
        .find<StorageService>()
        .getId, "0");

    hospitalsData?.remove(index);
    if(hospitalsData?.length == 0){
      hasNoData = true;
      update();
    }
    update();
    if (status?.msg == "succeeded") {
      final snackBar = SnackBar(
        content: CustomText(' ${removeHospToFavText1.tr} $hospitalName ${removeHospToFavText2.tr}  '),

      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Future.delayed(const Duration(milliseconds: 7000), () {
        update();});
    } else {
      var data;
      CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: errorKey.tr,
          text: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg:data?.msgAr
      );
    }
  }
}
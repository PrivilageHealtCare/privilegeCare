import 'package:privilegecare/Models/banner_model.dart';
import 'package:privilegecare/Utils/api_service.dart';
import 'package:privilegecare/Utils/services.dart';

class BannerServices {
  static ApiService api = ApiService();
  static Future<List<BannerModel>?> getHomeBanners() async {
    List<BannerModel>? bannerList = [];
    var data = await api.request(Services.homeBannersEndPoint, "POST");
    if (data != null) {
      for (var banner in data){
        bannerList.add(BannerModel.fromJson(banner));
      }
      return bannerList;
    }
    return null;
  }

}
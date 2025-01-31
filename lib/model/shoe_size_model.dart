import 'package:shoe_size/utils/app_enums.dart';

class ShoeSizeModel {
  List<double> shoeSizeUSList;
  List<double> shoeSizeUKList;
  List<double> shoeSizeEUList;
  List<double> shoeSizeCMList;
  List<double> shoeSizeINCHList;

  ShoeSizeModel(
      {required this.shoeSizeUSList,
      required this.shoeSizeUKList,
      required this.shoeSizeEUList,
      required this.shoeSizeCMList,
      required this.shoeSizeINCHList});
}

class ShoeSizeResultModel {
  String name;
  double result;
  CountryType countryType;

  ShoeSizeResultModel({required this.name, required this.result, required this.countryType});
}

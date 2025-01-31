import 'package:get/get.dart';
import 'package:shoe_size/localization/app_strings.dart';
import 'package:shoe_size/model/shoe_size_model.dart';
import 'package:shoe_size/utils/app_enums.dart';
import 'package:shoe_size/utils/app_images.dart';

class DashboardController extends GetxController {
  Rx<ShoeSizeGenderType> selectedGender = ShoeSizeGenderType.male.obs;
  ShoeSizeGenderType get selectedGenderValue => selectedGender.value;

  Rx<CountryType> selectedCountryType = CountryType.us.obs;
  CountryType get selectedCountryTypeValue => selectedCountryType.value;

  RxInt selectedShoeSizeIndex = 0.obs;
  int get selectedShoeSizeIndexValue => selectedShoeSizeIndex.value;

  void toggleSelectedGenderValue(
      {required ShoeSizeGenderType shoeSizeGenderType}) {
    selectedGender.value = shoeSizeGenderType;
    selectedShoeSizeIndex.value = 0;
    update();
  }

  void toggleSelectedCountryTypeValue({required CountryType countryType}) {
    selectedCountryType.value = countryType;
    update();
  }

  void toggleSelectedShoeSizeIndexValue({required int index}) {
    selectedShoeSizeIndex.value = index;
    update();
  }

  ShoeSizeModel shoeSizeMaleList = ShoeSizeModel(shoeSizeUSList: [
    6,
    6.5,
    7,
    7.5,
    8,
    8.5,
    9,
    9.5,
    10,
    10.5,
    11,
    11.5,
    12,
    13,
    14,
    15,
    16
  ], shoeSizeUKList: [
    5.5,
    6,
    6.5,
    7,
    7.5,
    8,
    8.5,
    9,
    9.5,
    10,
    10.5,
    11,
    11.5,
    12.5,
    13.5,
    14.5,
    15.5
  ], shoeSizeEUList: [
    39,
    39,
    40,
    40.5,
    41,
    41.5,
    42,
    42.5,
    43,
    43.5,
    44,
    44.5,
    45,
    46,
    47,
    48,
    49
  ], shoeSizeCMList: [
    23.5,
    24.1,
    24.4,
    24.8,
    25.4,
    25.7,
    26,
    26.7,
    27,
    27.3,
    27.9,
    28.3,
    28.6,
    29.4,
    30.2,
    31,
    31.8
  ], shoeSizeINCHList: [
    9.3,
    9.5,
    9.6,
    9.8,
    9.9,
    10.1,
    10.3,
    10.4,
    10.6,
    10.8,
    10.9,
    11.1,
    11.3,
    11.6,
    11.9,
    12.2,
    12.5
  ]);
  ShoeSizeModel shoeSizeFemaleList = ShoeSizeModel(shoeSizeUSList: [
    4,
    4.5,
    5,
    5.5,
    6,
    6.5,
    7,
    7.5,
    8,
    8.5,
    9,
    9.5,
    10,
    10.5,
    11,
    11.5,
    12
  ], shoeSizeUKList: [
    2,
    2.5,
    3,
    3.5,
    4,
    4.5,
    5,
    5.5,
    6,
    6.5,
    7,
    7.5,
    8,
    8.5,
    9,
    9.5,
    10
  ], shoeSizeEUList: [
    34.5,
    35,
    35.5,
    36,
    36.5,
    37,
    37.5,
    38,
    38.5,
    39,
    39.5,
    40,
    40.5,
    41,
    41.5,
    42,
    42.5
  ], shoeSizeCMList: [
    20.8,
    21.3,
    21.6,
    22.2,
    22.5,
    23,
    23.5,
    23.8,
    24.1,
    24.6,
    25.1,
    25.4,
    25.9,
    26.2,
    26.7,
    27.1,
    27.6
  ], shoeSizeINCHList: [
    8.2,
    8.3,
    8.5,
    8.8,
    8.9,
    9.1,
    9.3,
    9.4,
    9.5,
    9.7,
    9.9,
    10,
    10.2,
    10.3,
    10.5,
    10.7,
    10.9
  ]);
  ShoeSizeModel shoeSizeBigKidsList = ShoeSizeModel(
      shoeSizeUSList: [3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7],
      shoeSizeUKList: [2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6],
      shoeSizeEUList: [35, 36, 36.5, 37, 37.5, 38, 38.5, 39],
      shoeSizeCMList: [21.9, 22.2, 22.9, 23.2, 23.5, 24.1, 24.4, 24.8],
      shoeSizeINCHList: [8.6, 8.8, 9, 9.1, 9.3, 9.5, 9.6, 9.8]);
  ShoeSizeModel shoeSizeLittleKidsList = ShoeSizeModel(shoeSizeUSList: [
    10.5,
    11,
    11.5,
    12,
    12.5,
    13,
    13.5,
    1,
    1.5,
    2,
    2.5,
    3
  ], shoeSizeUKList: [
    9.5,
    10,
    10.5,
    11,
    11.5,
    12,
    12.5,
    13,
    14,
    1,
    1.5,
    2
  ], shoeSizeEUList: [
    27,
    28,
    29,
    30,
    30.5,
    31,
    31.5,
    32,
    33,
    33.5,
    34,
    34.5
  ], shoeSizeCMList: [
    16.8,
    17.1,
    17.8,
    18.1,
    18.4,
    19.1,
    19.4,
    19.7,
    20.3,
    20.6,
    21,
    21.6
  ], shoeSizeINCHList: [
    6.6,
    6.8,
    7,
    7.1,
    7.3,
    7.5,
    7.6,
    7.8,
    8,
    8.1,
    8.3,
    8.5
  ]);
  ShoeSizeModel shoeSizeToddlersList = ShoeSizeModel(shoeSizeUSList: [
    3.5,
    4,
    4.5,
    5,
    5.5,
    6,
    6.5,
    7,
    7.5,
    8,
    8.5,
    9,
    9.5,
    10
  ], shoeSizeUKList: [
    19,
    19.5,
    20,
    20.5,
    21,
    22,
    22.5,
    23,
    23.5,
    24,
    25,
    25.5,
    26,
    27
  ], shoeSizeEUList: [
    2.5,
    3,
    3.5,
    4,
    4.5,
    5,
    5.5,
    6,
    6.5,
    7,
    7.5,
    8,
    8.5,
    9
  ], shoeSizeCMList: [
    10.8,
    11.4,
    11.7,
    12.1,
    12.7,
    13,
    13.3,
    14,
    14.3,
    14.6,
    15.2,
    15.6,
    15.9,
    16.5
  ], shoeSizeINCHList: [
    4.3,
    4.5,
    4.6,
    4.8,
    5,
    5.1,
    5.3,
    5.5,
    5.6,
    5.8,
    6,
    6.1,
    6.3,
    6.5
  ]);
  ShoeSizeModel shoeSizeInfantsList = ShoeSizeModel(
      shoeSizeUSList: [0, 1, 1.5, 2, 2.5, 3],
      shoeSizeUKList: [0, 0.5, 1, 1, 1.5, 2],
      shoeSizeEUList: [15, 16, 17, 17.5, 18, 18.5],
      shoeSizeCMList: [7.9, 8.9, 9.2, 9.5, 10.2, 10.5],
      shoeSizeINCHList: [3.1, 3.5, 3.6, 3.8, 4, 4.1]);

  ShoeSizeModel getGenderList() {
    switch (selectedGenderValue) {
      case ShoeSizeGenderType.male:
        return shoeSizeMaleList;
      case ShoeSizeGenderType.female:
        return shoeSizeFemaleList;
      case ShoeSizeGenderType.bigKids:
        return shoeSizeBigKidsList;
      case ShoeSizeGenderType.littleKids:
        return shoeSizeLittleKidsList;
      case ShoeSizeGenderType.toddlers:
        return shoeSizeToddlersList;
      case ShoeSizeGenderType.infants:
        return shoeSizeInfantsList;
      default:
        return shoeSizeMaleList;
    }
  }

  List<double> getCountryList({required ShoeSizeModel shoeSizeModel}) {
    switch (selectedCountryTypeValue) {
      case CountryType.us:
        return shoeSizeModel.shoeSizeUSList;
      case CountryType.uk:
        return shoeSizeModel.shoeSizeUKList;
      case CountryType.eu:
        return shoeSizeModel.shoeSizeEUList;
      case CountryType.cm:
        return shoeSizeModel.shoeSizeCMList;
      case CountryType.inch:
        return shoeSizeModel.shoeSizeINCHList;
      default:
        return shoeSizeModel.shoeSizeUSList;
    }
  }

  String getSelectedGenderImagePathValue() {
    switch (selectedGenderValue) {
      case ShoeSizeGenderType.male:
        return AppImages.male;
      case ShoeSizeGenderType.female:
        return AppImages.female;
      case ShoeSizeGenderType.bigKids:
        return AppImages.bigKids;
      case ShoeSizeGenderType.littleKids:
        return AppImages.littleKids;
      case ShoeSizeGenderType.toddlers:
        return AppImages.toddlers;
      case ShoeSizeGenderType.infants:
        return AppImages.infants;
      default:
        return AppImages.male;
    }
  }

  String getSelectedGenderValue() {
    switch (selectedGenderValue) {
      case ShoeSizeGenderType.male:
        return AppStrings.strMale.tr;
      case ShoeSizeGenderType.female:
        return AppStrings.strFemale.tr;
      case ShoeSizeGenderType.bigKids:
        return AppStrings.strBigKids.tr;
      case ShoeSizeGenderType.littleKids:
        return AppStrings.strLittleKids.tr;
      case ShoeSizeGenderType.toddlers:
        return AppStrings.strToddlers.tr;
      case ShoeSizeGenderType.infants:
        return AppStrings.strInfants.tr;
      default:
        return AppStrings.strMale.tr;
    }
  }

  String getSelectedGenderDescriptionValue() {
    switch (selectedGenderValue) {
      case ShoeSizeGenderType.male:
        return AppStrings.strMaleDescription.tr;
      case ShoeSizeGenderType.female:
        return AppStrings.strFemaleDescription.tr;
      case ShoeSizeGenderType.bigKids:
        return AppStrings.strBigKidsDescription.tr;
      case ShoeSizeGenderType.littleKids:
        return AppStrings.strLittleKidsDescription.tr;
      case ShoeSizeGenderType.toddlers:
        return AppStrings.strToddlersDescription.tr;
      case ShoeSizeGenderType.infants:
        return AppStrings.strInfantsDescription.tr;
      default:
        return AppStrings.strMaleDescription.tr;
    }
  }

  (List<ShoeSizeResultModel>, ShoeSizeResultModel) calculateResult() {
    ShoeSizeModel shoeSizeModel = getGenderList();
    List<ShoeSizeResultModel> shoeSizeResultList = [
      ShoeSizeResultModel(
          name: AppStrings.strUSCanada.tr,
          countryType: CountryType.us,
          result: shoeSizeModel.shoeSizeUSList[selectedShoeSizeIndexValue]),
      ShoeSizeResultModel(
          name: AppStrings.strUKIndia.tr,
          countryType: CountryType.uk,
          result: shoeSizeModel.shoeSizeUKList[selectedShoeSizeIndexValue]),
      ShoeSizeResultModel(
          name: AppStrings.strEU.tr,
          countryType: CountryType.eu,
          result: shoeSizeModel.shoeSizeEUList[selectedShoeSizeIndexValue]),
      ShoeSizeResultModel(
          name: AppStrings.strCM.tr,
          countryType: CountryType.cm,
          result: shoeSizeModel.shoeSizeCMList[selectedShoeSizeIndexValue]),
      ShoeSizeResultModel(
          name: AppStrings.strINCH.tr,
          countryType: CountryType.inch,
          result: shoeSizeModel.shoeSizeINCHList[selectedShoeSizeIndexValue]),
    ];

    int availableIndex = shoeSizeResultList.indexWhere((item) => item.countryType == selectedCountryTypeValue);
    ShoeSizeResultModel shoeSizeResultModel = shoeSizeResultList.removeAt(availableIndex);

    return (shoeSizeResultList, shoeSizeResultModel);
  }
}

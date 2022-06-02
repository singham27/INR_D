import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/API.dart';
import '../Controllers/VerificationCodeController.dart';
import 'package:get_storage/get_storage.dart';
import '../Views/TabbarScreen.dart';
import '../Utils/Constants.dart';
import '../Utils/Constants.dart';

class PINScreenController extends GetxController {
  RxString pinValue = ''.obs;
  RxString pinConfirmValue = ''.obs;

  RxString mpin = ''.obs;
  reset() {}

  setPIN() async {
    final controlller = Get.put(VerificationCodeController());
    controlller.phoneNumber.value = controlller.phoneNumber.value.replaceAll('+', '');

    final response = await API.instance.post(
        endPoint: APIEndPoints.instance.kSetPIN, params: {
      'inrd_no': controlller.phoneNumber.value,
      'mpin': mpin.value
        });

    debugPrint(response!['status']);

    if (response != null || response.isNotEmpty) {
      Get.back();
      Get.offAll(TabbarScreen());
    }
  }

  login() async {
    final mobileNumber = GetStorage().read(Constants.instance.kMobileNumber) ?? '';
    debugPrint(mobileNumber);

    Map<String, String> params = {
      'inrd_no': mobileNumber,
      'mpin': mpin.value
    };

    final response = await API.instance.post(
        endPoint: APIEndPoints.instance.kLogin, params: params
    );

    if (response![Constants.instance.kData].toString().isNotEmpty) {
      Get.back();
      Get.offAll(TabbarScreen());
    }

  }
}
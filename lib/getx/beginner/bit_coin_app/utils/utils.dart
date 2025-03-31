// this is for registering services.

import 'package:get/get.dart';
import 'package:riverpod_practice/getx/beginner/bit_coin_app/services/http_service.dart';

Future<void> registerService() async {
  Get.put(HTTPService());
}

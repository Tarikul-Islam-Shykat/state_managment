import 'package:riverpod_practice/beginer/simple_api_simulation/1.home_model.dart';

class HomeRepository {
  Future<HomeModel> fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    return HomeModel(message: "This is from Home Model");
  }
}

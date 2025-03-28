import 'package:riverpod_practice/beginer/list_api_simulation/1.list_model.dart';

class ListRepo {
  Future<List<ListModel>> fetchList() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      ListModel(id: 1, content: "first contet"),
      ListModel(id: 2, content: "second contet"),
    ];
  }
}

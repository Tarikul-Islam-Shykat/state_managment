import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/beginer/list_api_simulation/2.list_repo.dart';

import '1.list_model.dart';

class ListViewModelNotifier extends StateNotifier<AsyncValue<List<ListModel>>> {
  final ListRepo _listRepo;
  ListViewModelNotifier(this._listRepo) : super(const AsyncValue.loading()) {
    fetchData();
  }

  fetchData() async {
    final list = await _listRepo.fetchList();
    state = AsyncValue.data(list);
  }

  void addItem(String content) {
    final newItem = ListModel(id: state.value!.length + 1, content: content);
    state = AsyncValue.data([...state.value!, newItem]);
  }

  void removeItem(int id) {
    state =
        AsyncValue.data(state.value!.where((item) => item.id != id).toList());
  }
}

final listViewModelProvider =
    StateNotifierProvider<ListViewModelNotifier, AsyncValue<List<ListModel>>>(
        (ref) => ListViewModelNotifier(ListRepo()));

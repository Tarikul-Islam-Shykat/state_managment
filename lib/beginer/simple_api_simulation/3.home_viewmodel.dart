import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/beginer/simple_api_simulation/2.home_repo.dart';

import '1.home_model.dart';

class HomeViewModelNotifier extends StateNotifier<AsyncValue<HomeModel>> {
  final HomeRepository _homeRepository;

  HomeViewModelNotifier(this._homeRepository)
      : super(const AsyncValue.loading()) {
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final data = await _homeRepository.fetchData();
      state = AsyncValue.data(data);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

// provider for view model.
final homeViewModelProivider =
    StateNotifierProvider<HomeViewModelNotifier, AsyncValue<HomeModel>>(
        (ref) => HomeViewModelNotifier(HomeRepository()));

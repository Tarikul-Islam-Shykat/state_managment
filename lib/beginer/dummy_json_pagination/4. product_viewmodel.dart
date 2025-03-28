import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_practice/beginer/dummy_json_pagination/1.%20product_mode.dart';
import 'package:riverpod_practice/beginer/dummy_json_pagination/3.%20product_repo.dart';

class ProductViewModel extends StateNotifier<AsyncValue<List<Product>>> {
  final ProductRepo _productRepo;

  ProductViewModel(this._productRepo) : super(const AsyncValue.loading());

  int _skip = 0;
  final int _limit = 10;
  bool _hasMoreData =
      true; // checking if the response has more data or we loaded all the data.

  Future<void> fetchInitialProducts() async {
    final result = await _productRepo.getProducts(skip: _skip, limit: 10);
    result.match((error) => state = AsyncValue.error(error, StackTrace.current),
        (productList) {
      if (productList.length > _limit) {
        _hasMoreData = true;
        state = AsyncValue.data(productList);
        _skip = _skip + productList.length;
      } else {
        _hasMoreData = false;
      }
    });
  }

  Future<void> fetchMoreProducts() async {
    if (!_hasMoreData) return; // meaning no more data present.
    final result = await _productRepo.getProducts(skip: _skip, limit: _limit);
    result.match((error) => AsyncValue.error(error, StackTrace.current),
        (productList) {
      if (productList.length > _limit) {
        _hasMoreData = true;
        // adding data to exisitng list
        state =
            state.whenData((existingList) => [...existingList, ...productList]);
        _skip = _skip + productList.length;
      } else {
        _hasMoreData = false;
      }
    });
  }
}

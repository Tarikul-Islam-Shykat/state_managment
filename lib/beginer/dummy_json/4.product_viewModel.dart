import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/beginer/dummy_json/1.product_model.dart';
import 'package:riverpod_practice/beginer/dummy_json/3.product_repo.dart';

class ProductViewModel extends StateNotifier<AsyncValue<List<Product>>> {
  final ProductRepo _productRepo;
  int _skip = 0;
  final int _limit = 10;
  bool _isLoadingMore = false;
  bool _hasMore = true;

  ProductViewModel(this._productRepo) : super(const AsyncValue.loading());

  Future<void> fetchInitialProducts() async {
    _skip = 0;
    _hasMore = true;
    final result =
        await _productRepo.getProducts(skip: _skip, limit: _limit);
    result.match(
      (error) => state = AsyncValue.error(error, StackTrace.current),
      (products) {
        _hasMore = products.length == _limit;
        state = AsyncValue.data(products);
        _skip += products.length;
      },
    );
  }

  Future<void> fetchMoreProducts() async {
    if (_isLoadingMore || !_hasMore) return;
    _isLoadingMore = true;
    final result =
        await _productRepo.getProducts(skip: _skip, limit: _limit);
    result.match(
      (error) {
        // Optionally handle load more errors
      },
      (newProducts) {
        if (newProducts.length < _limit) _hasMore = false;
        state = state.whenData(
          (existingProducts) => [...existingProducts, ...newProducts],
        );
        _skip += newProducts.length;
      },
    );
    _isLoadingMore = false;
  }
}

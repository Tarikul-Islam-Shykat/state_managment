import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/beginer/dummy_json/1.product_model.dart';
import 'package:riverpod_practice/beginer/dummy_json/2.product_service.dart';
import 'package:riverpod_practice/beginer/dummy_json/3.product_repo.dart';
import 'package:riverpod_practice/beginer/dummy_json/4.product_viewModel.dart';

final productServiceProvider = Provider<ProductService>((ref) {
  return ProductService();
});

final productRepositoryProvider = Provider<ProductRepo>((ref) {
  return ProductRepo(ref.read(productServiceProvider));
});

final productViewModelProvider =
    StateNotifierProvider<ProductViewModel, AsyncValue<List<Product>>>((ref) {
  return ProductViewModel(ref.read(productRepositoryProvider));
});

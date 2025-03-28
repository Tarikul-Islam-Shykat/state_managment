import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/beginer/dummy_json_pagination/1.%20product_mode.dart';
import 'package:riverpod_practice/beginer/dummy_json_pagination/2.%20product_service.dart';
import 'package:riverpod_practice/beginer/dummy_json_pagination/3.%20product_repo.dart';
import 'package:riverpod_practice/beginer/dummy_json_pagination/4.%20product_viewmodel.dart';



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

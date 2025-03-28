import 'package:fpdart/fpdart.dart';
import 'package:riverpod_practice/beginer/dummy_json_pagination/1.%20product_mode.dart';
import 'package:riverpod_practice/beginer/dummy_json_pagination/2.%20product_service.dart';

class ProductRepo {
  final ProductService _productService;

  ProductRepo(this._productService);

  Future<Either<String, List<Product>>> getProducts({
    required int skip,
    required int limit,
  }) async {
    return await _productService.fetchProducts(skip: skip, limit: limit);
  }
}

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_practice/beginer/dummy_json/1.product_model.dart';
import 'package:riverpod_practice/beginer/dummy_json/2.product_service.dart';

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

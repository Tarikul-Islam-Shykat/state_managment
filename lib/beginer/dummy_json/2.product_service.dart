import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_practice/beginer/dummy_json/1.product_model.dart';

class ProductService {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://dummyjson.com/"));

  Future<Either<String, List<Product>>> fetchProducts({
    required int skip,
    required int limit,
  }) async {
    try {
      final response = await _dio.get('/products', queryParameters: {
        'skip': skip,
        'limit': limit,
      });

      final List<Product> products =
          (response.data['products'] as List).map((product) {
        final Map<String, dynamic> productMap =
            (product as Map<String, dynamic>).map(
          (key, value) => MapEntry(key, value?.toString() ?? ''),
        );
        return Product.fromMap(productMap);
      }).toList();

      return Right(products);
    } catch (e) {
      return Left("Failed To Load The products $e");
    }
  }
}


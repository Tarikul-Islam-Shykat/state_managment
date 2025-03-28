import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_practice/beginer/dummy_json_pagination/1.%20product_mode.dart';

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

      if (response.statusCode == 200) {
        final List<Product> products =
            (response.data['products'] as List).map((product) {
          final Map<String, dynamic> productMap =
              (product as Map<String, dynamic>).map(
            (key, value) => MapEntry(key, value?.toString() ?? ''),
          );
          return Product.fromMap(productMap);
        }).toList();

        return Right(products);
      } else {
        return Left("Error: ${response.statusCode} ${response.statusMessage}");
      }
    } on DioError catch (dioError) {
      if (dioError.response != null) {
        final statusCode = dioError.response?.statusCode;
        final statusMessage = dioError.response?.statusMessage;
        return Left("HTTP Error: $statusCode $statusMessage");
      } else {
        return Left("Network Error: ${dioError.message}");
      }
    } catch (e) {
      return Left("Unexpected Error: $e");
    }
  }
}

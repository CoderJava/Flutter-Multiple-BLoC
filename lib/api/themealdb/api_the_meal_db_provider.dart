import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_multiple_bloc/model/randommeal/random_meal.dart';

class ApiTheMealDbProvider {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<RandomMeal> getRandomMeal() async {
    try {
      final response = await _dio.get('$_baseUrl/random.php');
      return RandomMeal.fromJson(response.data);
    } catch (error) {
      debugPrint('$error');
      return RandomMeal.withError('$error');
    }
  }
}
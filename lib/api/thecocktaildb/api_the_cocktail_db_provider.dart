import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_multiple_bloc/model/randomcocktail/random_cocktail.dart';

class ApiTheCocktailDbProvider {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1';

  Future<RandomCocktail> getRandomCocktail() async {
    try {
      final response = await _dio.get('$_baseUrl/random.php');
      return RandomCocktail.fromJson(response.data);
    } catch (error) {
      debugPrint('$error');
      return RandomCocktail.withError('$error');
    }
  }
}
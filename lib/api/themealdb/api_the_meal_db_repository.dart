import 'package:flutter_multiple_bloc/api/themealdb/api_the_meal_db_provider.dart';
import 'package:flutter_multiple_bloc/model/randommeal/random_meal.dart';

class ApiTheMealDbRepository {
  final ApiTheMealDbProvider _apiTheMealDbProvider = ApiTheMealDbProvider();

  Future<RandomMeal> fetchRandomMeal() => _apiTheMealDbProvider.getRandomMeal();
}
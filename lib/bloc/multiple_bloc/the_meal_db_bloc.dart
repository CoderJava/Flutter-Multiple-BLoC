import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multiple_bloc/api/themealdb/api_the_meal_db_repository.dart';
import 'package:flutter_multiple_bloc/model/randommeal/random_meal.dart';

abstract class TheMealDbState {}

class TheMealDbInitial extends TheMealDbState {}

class TheMealDbLoading extends TheMealDbState {}

class TheMealDbFailure extends TheMealDbState {
  final String errorMessage;

  TheMealDbFailure(this.errorMessage);
}

class TheMealDbLoaded extends TheMealDbState {
  final RandomMeal randomMeal;

  TheMealDbLoaded(this.randomMeal);
}

class TheMealDbEvent {}

class TheMealDbBloc extends Bloc<TheMealDbEvent, TheMealDbState> {
  final ApiTheMealDbRepository _apiTheMealDbRepository = ApiTheMealDbRepository();

  @override
  TheMealDbState get initialState => TheMealDbInitial();

  @override
  Stream<TheMealDbState> mapEventToState(TheMealDbEvent event) async* {
    yield TheMealDbLoading();
    RandomMeal randomMeal = await _apiTheMealDbRepository.fetchRandomMeal();
    if (randomMeal.error != null) {
      yield TheMealDbFailure(randomMeal.error);
      return;
    }
    yield TheMealDbLoaded(randomMeal);
  }

}


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multiple_bloc/api/thecocktaildb/api_the_cocktail_db_repository.dart';
import 'package:flutter_multiple_bloc/model/randomcocktail/random_cocktail.dart';

abstract class TheCocktailDbState {}

class TheCocktailDbInitial extends TheCocktailDbState {}

class TheCocktailDbLoading extends TheCocktailDbState {}

class TheCocktailDbFailure extends TheCocktailDbState {
  final String errorMessage;

  TheCocktailDbFailure(this.errorMessage);
}

class TheCocktailDbLoaded extends TheCocktailDbState {
  final RandomCocktail randomCocktail;

  TheCocktailDbLoaded(this.randomCocktail);
}

class TheCocktailDbEvent {}

class TheCocktailDbBloc extends Bloc<TheCocktailDbEvent, TheCocktailDbState> {
  final ApiTheCocktailDbRepository _apiTheCocktailDbRepository = ApiTheCocktailDbRepository();

  @override
  TheCocktailDbState get initialState => TheCocktailDbInitial();

  @override
  Stream<TheCocktailDbState> mapEventToState(TheCocktailDbEvent event) async* {
    yield TheCocktailDbLoading();
    RandomCocktail randomCocktail = await _apiTheCocktailDbRepository.fetchRandomCocktail();
    if (randomCocktail.error != null) {
      yield TheCocktailDbFailure(randomCocktail.error);
      return;
    }
    yield TheCocktailDbLoaded(randomCocktail);
  }

}
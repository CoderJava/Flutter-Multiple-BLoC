import 'package:json_annotation/json_annotation.dart';
part 'random_cocktail.g.dart';

@JsonSerializable()
class RandomCocktail {
  String strDrink;
  String strDrinkThumb;
  @JsonKey(ignore: true)
  String error;

  RandomCocktail(this.strDrink, this.strDrinkThumb);

  factory RandomCocktail.fromJson(Map<String, dynamic> json) => _$RandomCocktailFromJson(json);

  RandomCocktail.withError(this.error);

  Map<String, dynamic> toJson() => _$RandomCocktailToJson(this);

  @override
  String toString() {
    return 'RandomCocktail{strDrink: $strDrink, strDrinkThumb: $strDrinkThumb}';
  }
}
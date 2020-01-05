import 'package:json_annotation/json_annotation.dart';

part 'random_cocktail.g.dart';

@JsonSerializable()
class RandomCocktail {
  List<ItemCocktail> drinks;
  @JsonKey(ignore: true)
  String error;

  RandomCocktail(this.drinks);

  factory RandomCocktail.fromJson(Map<String, dynamic> json) => _$RandomCocktailFromJson(json);

  RandomCocktail.withError(this.error);

  Map<String, dynamic> toJson() => _$RandomCocktailToJson(this);

  @override
  String toString() {
    return 'RandomCocktail{drinks: $drinks}';
  }
}

@JsonSerializable()
class ItemCocktail {
  String strDrink;
  String strDrinkThumb;

  ItemCocktail(this.strDrink, this.strDrinkThumb);

  factory ItemCocktail.fromJson(Map<String, dynamic> json) => _$ItemCocktailFromJson(json);

  Map<String, dynamic> toJson() => _$ItemCocktailToJson(this);

  @override
  String toString() {
    return 'ItemCocktail{strDrink: $strDrink, strDrinkThumb: $strDrinkThumb}';
  }
}
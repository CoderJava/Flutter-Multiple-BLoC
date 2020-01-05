import 'package:json_annotation/json_annotation.dart';

part 'random_meal.g.dart';

@JsonSerializable()
class RandomMeal {
  List<ItemMeal> meals;
  @JsonKey(ignore: true)
  String error;

  RandomMeal(this.meals);

  factory RandomMeal.fromJson(Map<String, dynamic> json) => _$RandomMealFromJson(json);

  RandomMeal.withError(this.error);

  Map<String, dynamic> toJson() => _$RandomMealToJson(this);

  @override
  String toString() {
    return 'RandomMeal{meals: $meals}';
  }
}

@JsonSerializable()
class ItemMeal {
  String strMeal;
  String strMealThumb;

  ItemMeal(this.strMeal, this.strMealThumb);

  factory ItemMeal.fromJson(Map<String, dynamic> json) => _$ItemMealFromJson(json);

  Map<String, dynamic> toJson() => _$ItemMealToJson(this);

  @override
  String toString() {
    return 'ItemMeal{strMeal: $strMeal, strMealThumb: $strMealThumb}';
  }
}
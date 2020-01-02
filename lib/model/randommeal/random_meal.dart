import 'package:json_annotation/json_annotation.dart';

part 'random_meal.g.dart';

@JsonSerializable()
class RandomMeal {
  String strMeal;
  String strMealThumb;
  @JsonKey(ignore: true)
  String error;

  RandomMeal(this.strMeal, this.strMealThumb);

  factory RandomMeal.fromJson(Map<String, dynamic> json) => _$RandomMealFromJson(json);

  RandomMeal.withError(this.error);

  Map<String, dynamic> toJson() => _$RandomMealToJson(this);

  @override
  String toString() {
    return 'RandomMeal{strMeal: $strMeal, strMealThumb: $strMealThumb}';
  }
}
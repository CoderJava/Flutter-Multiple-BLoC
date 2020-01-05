// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RandomMeal _$RandomMealFromJson(Map<String, dynamic> json) {
  return RandomMeal(
    (json['meals'] as List)
        ?.map((e) =>
            e == null ? null : ItemMeal.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RandomMealToJson(RandomMeal instance) =>
    <String, dynamic>{
      'meals': instance.meals,
    };

ItemMeal _$ItemMealFromJson(Map<String, dynamic> json) {
  return ItemMeal(
    json['strMeal'] as String,
    json['strMealThumb'] as String,
  );
}

Map<String, dynamic> _$ItemMealToJson(ItemMeal instance) => <String, dynamic>{
      'strMeal': instance.strMeal,
      'strMealThumb': instance.strMealThumb,
    };

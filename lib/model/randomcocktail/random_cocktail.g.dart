// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_cocktail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RandomCocktail _$RandomCocktailFromJson(Map<String, dynamic> json) {
  return RandomCocktail(
    (json['drinks'] as List)
        ?.map((e) =>
            e == null ? null : ItemCocktail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RandomCocktailToJson(RandomCocktail instance) =>
    <String, dynamic>{
      'drinks': instance.drinks,
    };

ItemCocktail _$ItemCocktailFromJson(Map<String, dynamic> json) {
  return ItemCocktail(
    json['strDrink'] as String,
    json['strDrinkThumb'] as String,
  );
}

Map<String, dynamic> _$ItemCocktailToJson(ItemCocktail instance) =>
    <String, dynamic>{
      'strDrink': instance.strDrink,
      'strDrinkThumb': instance.strDrinkThumb,
    };

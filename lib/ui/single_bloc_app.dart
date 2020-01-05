import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multiple_bloc/bloc/single_bloc/the_meal_cocktail_db_bloc.dart';
import 'package:flutter_multiple_bloc/model/randomcocktail/random_cocktail.dart';
import 'package:flutter_multiple_bloc/model/randommeal/random_meal.dart';

class SingleBlocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TheMealCocktailDbBloc _theMealCocktailDbBloc = TheMealCocktailDbBloc();

  @override
  void initState() {
    _theMealCocktailDbBloc.add(TheMealCocktailDbEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Single BLoC App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _theMealCocktailDbBloc.add(TheMealCocktailDbEvent());
            },
          )
        ],
      ),
      body: SafeArea(
        child: BlocProvider<TheMealCocktailDbBloc>(
          create: (context) => _theMealCocktailDbBloc,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Random Meal', style: Theme.of(context).textTheme.title),
                WidgetTheMealDb(),
                SizedBox(height: 16.0),
                Text('Random Cocktail', style: Theme.of(context).textTheme.title),
                WidgetTheCocktailDb(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WidgetTheMealDb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TheMealCocktailDbBloc, TheMealCocktailDbState>(
        builder: (context, state) {
          if (state is TheMealCocktailDbLoading) {
            return WidgetCircularLoading();
          } else if (state is TheMealCocktailDbFailure) {
            return Center(
              child: Text('${state.errorMessage}'),
            );
          } else if (state is TheMealCocktailDbLoaded) {
            RandomMeal randomMeal = state.randomMeal;
            ItemMeal itemMeal = randomMeal.meals[0];
            return Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  child: Image.network(
                    itemMeal.strMealThumb,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        0.1,
                        0.6,
                      ],
                      colors: [
                        Colors.black.withOpacity(0.9),
                        Colors.black.withOpacity(0.3),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Text(
                      itemMeal.strMeal,
                      style: Theme.of(context).textTheme.title.merge(TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class WidgetTheCocktailDb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TheMealCocktailDbBloc, TheMealCocktailDbState>(
        builder: (context, state) {
          if (state is TheMealCocktailDbLoading) {
            return WidgetCircularLoading();
          } else if (state is TheMealCocktailDbFailure) {
            return Center(
              child: Text('${state.errorMessage}'),
            );
          } else if (state is TheMealCocktailDbLoaded) {
            RandomCocktail randomCocktail = state.randomCocktail;
            ItemCocktail itemCocktail = randomCocktail.drinks[0];
            return Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  child: Image.network(
                    itemCocktail.strDrinkThumb,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        0.1,
                        0.6,
                      ],
                      colors: [
                        Colors.black.withOpacity(0.9),
                        Colors.black.withOpacity(0.3),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Text(
                      itemCocktail.strDrink,
                      style: Theme.of(context).textTheme.title.merge(TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class WidgetCircularLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS ? CupertinoActivityIndicator() : CircularProgressIndicator(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/presentation/manager/favorites_cubit.dart';
import 'package:recipes_app/presentation/manager/recipes_cubit.dart';
import 'package:recipes_app/presentation/pages/favorite_recipes_screen.dart';
import 'package:recipes_app/presentation/pages/recipe_list_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const RecipeListScreen(),
    const FavoriteRecipesScreen(),
  ];

  @override
  void initState() {
    super.initState();

    context.read<FavoritesCubit>().loadFavorites();
    context.read<RecipesCubit>().loadRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoritesCubit, FavoritesState>(
      listener: (context, state) {
       if(state.favoriteStatusToggled){
         context.read<FavoritesCubit>().loadFavorites();
         context.read<RecipesCubit>().loadRecipes(showLoading: false);
       }
      },
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Recipes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite Recipes',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

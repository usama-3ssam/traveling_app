import 'package:flutter/material.dart';
import 'package:traveling_app/screens/categories_screen.dart';
import 'package:traveling_app/screens/favorites_screen.dart';
import 'package:traveling_app/widegs/app_drawer.dart';
import '../models/trip.dart';

class TabsScreen extends StatefulWidget {
  final List<Trip> favoriteTrips;

  const TabsScreen(this.favoriteTrips, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;

  late List<Map<dynamic, dynamic>> _screens;

  @override
  void initState() {
    _screens = [
      {
        'Screen': const CategoriesScreen(),
        'Title': 'Trip Categories',
      },
      {
        'Screen': FavoritesScreen(widget.favoriteTrips),
        'Title': 'Trip Favorites',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['Title']),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: _screens[_selectedScreenIndex]['Screen'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        selectedItemColor: Colors.amber,
        onTap: _selectScreen,
        backgroundColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}

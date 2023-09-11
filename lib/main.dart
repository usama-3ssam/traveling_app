import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/screens/category_trip_screen.dart';
import 'package:traveling_app/screens/filter_screen.dart';
import 'package:traveling_app/screens/tabs_screen.dart';
import 'package:traveling_app/screens/trip_detail_screen.dart';
import 'models/trip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'summer': false,
    'winter': false,
    'family': false,
  };
  List<Trip> _availableTrips = tripsData;
  final List<Trip> _favoriteTrips = [];

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;
      _availableTrips = tripsData.where((trip) {
        if (_filter['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filter['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filter['family'] == true && trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _manageFavorite(String tripId) {
    final existingIndex = _favoriteTrips.indexWhere(
      (trip) => trip.id == tripId,
    );
    if (existingIndex >= 0) {
      setState(() {
        _favoriteTrips.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteTrips.add(
          tripsData.firstWhere(
            (trip) => trip.id == tripId,
          ),
        );
      });
    }
  }

  bool _isFavorite(String id) {
    return _favoriteTrips.any((trip) => trip.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Traveling app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoriteTrips),
        CategoryTripScreen.screenRout: (ctx) =>
            CategoryTripScreen(_availableTrips),
        TripDetailsScreen.screenRoute: (ctx) =>
            TripDetailsScreen(_manageFavorite, _isFavorite),
        FilterScreen.screenRoute: (ctx) =>
            FilterScreen(_filter, _changeFilters),
      },
    );
  }
}

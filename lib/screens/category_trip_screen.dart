import 'package:flutter/material.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/widegs/trip_item.dart';

class CategoryTripScreen extends StatefulWidget {
  static const screenRout = '/category-trips';
  final List<Trip> availableTrips;

  const CategoryTripScreen(this.availableTrips, {super.key});

  @override
  State<CategoryTripScreen> createState() => _CategoryTripScreenState();
}

class _CategoryTripScreenState extends State<CategoryTripScreen> {
  late String categoryTitle;
  late List<Trip> displayTrips;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routArgument['id'];
    categoryTitle = routArgument['title']!;
    displayTrips = widget.availableTrips.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();

    super.didChangeDependencies();
  }

  // void _removeTrip(String tripId) {
  //   setState(() {
  //     displayTrips.removeWhere((trip) => trip.id == tripId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
            title: displayTrips[index].title,
            id: displayTrips[index].id,
            imgUrl: displayTrips[index].imageUrl,
            duration: displayTrips[index].duration,
            tripType: displayTrips[index].tripType,
            season: displayTrips[index].season,
            // removeItem: _removeTrip,
          );
        },
        itemCount: displayTrips.length,
      ),
    );
  }
}

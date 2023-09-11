import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widegs/trip_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Trip> favoriteTrips;

  const FavoritesScreen(this.favoriteTrips, {super.key});

  @override
  Widget build(BuildContext context) {
    if (favoriteTrips.isEmpty) {
      return const Center(
        child: Text(
          'You don\'t have any favorite trip list',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
            title: favoriteTrips[index].title,
            id: favoriteTrips[index].id,
            imgUrl: favoriteTrips[index].imageUrl,
            duration: favoriteTrips[index].duration,
            tripType: favoriteTrips[index].tripType,
            season: favoriteTrips[index].season,
          );
        },
        itemCount: favoriteTrips.length,
      );
    }
  }
}

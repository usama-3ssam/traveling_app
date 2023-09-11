import 'package:flutter/material.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/screens/trip_detail_screen.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgUrl;
  final int duration;
  final TripType tripType;
  final Season season;

  // final Function removeItem;

  const TripItem({
    super.key,
    required this.id,
    required this.title,
    required this.imgUrl,
    required this.duration,
    required this.tripType,
    required this.season,
    // required this.removeItem,
  });

  String? get seasonText {
    switch (season) {
      case Season.autumn:
        return 'Autumn';
        // break;
      case Season.spring:
        return 'Spring';
        // break;
      case Season.winter:
        return 'Winter';
        // break;
      case Season.summer:
        return 'Summer';
        // break;
      default:
        'UnKnow';
    }
    return null;
  }

  String? get tripTypeText {
    switch (tripType) {
      case TripType.activities:
        return 'Activities';
        // break;
      case TripType.exploration:
        return 'Exploration';
        // break;
      case TripType.recovery:
        return 'Recovery';
        // break;
      case TripType.therapy:
        return 'Therapy';
        // break;
      default:
        'UnKnow';
    }
    return null;
  }

  void selectTrip(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      TripDetailsScreen.screenRoute,
      arguments: id,
    )
        .then((value) {
      if (value != null) {
        // removeItem(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        elevation: .7,
        margin: const EdgeInsets.all(
          10,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(
                      15,
                    ),
                    topRight: Radius.circular(
                      15,
                    ),
                  ),
                  child: Image.network(
                    imgUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(.8),
                      ],
                      stops: const [.5, 1],
                    ),
                  ),
                  height: 200,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        color: Colors.orange,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '$duration Days',
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.wb_sunny,
                        color: Colors.orange,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        seasonText!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.family_restroom,
                        color: Colors.orange,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        tripTypeText!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

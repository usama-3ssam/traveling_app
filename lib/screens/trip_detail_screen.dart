import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';

class TripDetailsScreen extends StatelessWidget {
  static const screenRoute = '/trip-detail';

  final Function manageFavorite;
  final Function isFavorite;

  const TripDetailsScreen(this.manageFavorite, this.isFavorite, {super.key});

  Widget buildSectionTitle(BuildContext context, String titleText) => Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        alignment: Alignment.topLeft,
        child: Text(
          titleText,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            color: Colors.blue,
          ),
        ),
      );

  Widget buildListViewContainer(
    Widget child,
  ) =>
      Container(
        padding: const EdgeInsets.all(
          10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        height: 200,
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedTrip = tripsData.firstWhere((trip) => trip.id == tripId);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          selectedTrip.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildSectionTitle(
              context,
              'Activities',
            ),
            const SizedBox(
              height: 10,
            ),
            buildListViewContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  elevation: .3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 10,
                    ),
                    child: Text(
                      selectedTrip.activities[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                itemCount: selectedTrip.activities.length,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildSectionTitle(
              context,
              'Daily Programme',
            ),
            buildListViewContainer(
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 27,
                          child: Text(
                            '${index + 1} Days',
                          ),
                        ),
                        title: Text(
                          selectedTrip.program[index],
                        ),
                      ),
                    ),
                    const Divider(),
                  ],
                ),
                itemCount: selectedTrip.program.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () => manageFavorite(tripId),
        child: Icon(
          isFavorite(tripId) ? Icons.star : Icons.star_border,
          color: Colors.black,
        ),
      ),
    );
  }
}

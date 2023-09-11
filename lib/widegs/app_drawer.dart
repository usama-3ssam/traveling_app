import 'package:flutter/material.dart';
import 'package:traveling_app/screens/filter_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  Widget buildListTile(
    String title,
    IconData icon,
    onTapLink,
  ) =>
      ListTile(
        onTap: onTapLink,
        leading: Icon(
          icon,
          size: 30,
          color: Colors.blue,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 40,
            ),
            alignment: Alignment.center,
            color: Colors.amber,
            child: const Text(
              'Tourist guide',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(
            'Trips',
            Icons.card_travel,
            () {
              Navigator.of(context).pushReplacementNamed(
                '/',
              );
            },
          ),
          buildListTile(
            'Filtering',
            Icons.filter_list,
            () {
              Navigator.of(context).pushReplacementNamed(
                FilterScreen.screenRoute,
              );
            },
          ),
        ],
      ),
    );
  }
}

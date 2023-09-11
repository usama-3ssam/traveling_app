import 'package:flutter/material.dart';
import 'package:traveling_app/widegs/app_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const screenRoute = '/filters';
  final Function? saveFilters;

  const FilterScreen(this.currentFilters, this.saveFilters, {super.key});

  final Map<String, bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _summer = false;
  var _winter = false;
  var _family = false;

  @override
  void initState() {
    _summer = widget.currentFilters['summer']!;
    _winter = widget.currentFilters['winter']!;
    _family = widget.currentFilters['family']!;
    super.initState();
  }

  Widget buildSwitchList(
    String title,
    String subTitle,
    var currentVal,
    upDateVal,
  ) =>
      SwitchListTile(
        title: Text(
          title,
        ),
        subtitle: Text(
          subTitle,
        ),
        value: currentVal,
        onChanged: upDateVal,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text(
          'Filtering',
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.save,
            ),
            onPressed: () {
              final selectedFilters = {
                'summer': _summer,
                'winter': _winter,
                'family': _family,
              };
              widget.saveFilters!(selectedFilters);
            },
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchList(
                  'Summer Trips',
                  'Show trips in the summer only',
                  _summer,
                  (newVal) {
                    setState(() {
                      _summer = newVal;
                    });
                  },
                ),
                buildSwitchList(
                  'Winter Trips',
                  'Show trips in the winter only',
                  _winter,
                  (newVal) {
                    setState(() {
                      _winter = newVal;
                    });
                  },
                ),
                buildSwitchList(
                  'Family Trips',
                  'Show trips is for family only',
                  _family,
                  (newVal) {
                    setState(() {
                      _family = newVal;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/widgets/destination_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        print("tapped $index");
        setState(() {
          this._selectedIndex = index;
        });
      },
      child: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          shape: BoxShape.circle,
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 120.0),
            child: Text("What would you like to find?",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _icons
                .asMap()
                .entries
                .map((MapEntry e) => _buildIcon(e.key))
                .toList(),
          ),
          SizedBox(
            height: 20.0,
          ),
          DestinationCarousel(),
        ],
      ),
    ));
  }
}

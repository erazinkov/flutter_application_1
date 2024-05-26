import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/all_tickets_page.dart';
import 'package:flutter_application_1/pages/country_set_page.dart';
import 'package:flutter_application_1/pages/widgets/bottom_navigation.dart';
import 'package:flutter_application_1/pages/air_tickets_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  void _onTap(int idx) {
    setState(() {
      _index = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBody: true,
      body: IndexedStack(
        index: _index,
        children: [
          AllTicketsPage(),
          // CountrySetPage(),
          // AirTicketsPage(),
          AirTicketsPage(),
          AirTicketsPage(),
          AirTicketsPage(),
          AirTicketsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        index: _index,
        onIndexTap: _onTap,
      ),
    );
  }
}

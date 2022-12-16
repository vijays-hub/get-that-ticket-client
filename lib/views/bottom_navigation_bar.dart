import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_booking_app/views/home/index.dart';
import 'package:ticket_booking_app/views/profile/index.dart';
import 'package:ticket_booking_app/views/search/index.dart';
import 'package:ticket_booking_app/views/tickets/index.dart';

class BottomNavigationMenu extends StatefulWidget {
  const BottomNavigationMenu({super.key});

  @override
  State<BottomNavigationMenu> createState() => _BottomNavigationMenuState();
}

class _BottomNavigationMenuState extends State<BottomNavigationMenu> {
  int currentView = 0;

  static final List<Widget> _navigableWidgets = <Widget>[
    const Home(),
    const SearchPage(),
    const TicketsCollectionScreen(),
    const Profile(),
  ];

  BottomNavigationBarItem getBottomNavigationBarItem({
    required IconData inactiveIcon,
    required IconData activeIcon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(inactiveIcon),
      activeIcon: Icon(activeIcon),
      label: label,
    );
  }

  void switchViews(int updatedIndex) {
    setState(() {
      currentView = updatedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navigableWidgets[currentView],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          currentIndex: currentView,
          onTap: switchViews,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blueGrey,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: const Color(0xFF526480),
          items: [
            getBottomNavigationBarItem(
              inactiveIcon: FluentSystemIcons.ic_fluent_home_regular,
              activeIcon: FluentSystemIcons.ic_fluent_home_filled,
              label: "Home",
            ),
            getBottomNavigationBarItem(
              inactiveIcon: FluentSystemIcons.ic_fluent_search_regular,
              activeIcon: FluentSystemIcons.ic_fluent_search_filled,
              label: "Search",
            ),
            getBottomNavigationBarItem(
              inactiveIcon: FluentSystemIcons.ic_fluent_ticket_regular,
              activeIcon: FluentSystemIcons.ic_fluent_ticket_filled,
              label: "Tickets",
            ),
            getBottomNavigationBarItem(
              inactiveIcon: FluentSystemIcons.ic_fluent_person_regular,
              activeIcon: FluentSystemIcons.ic_fluent_person_filled,
              label: "Profile",
            ),
          ]),
    );
  }
}

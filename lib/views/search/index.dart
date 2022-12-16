import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/styles.dart';
import 'package:ticket_booking_app/views/search/airline_tickets.dart';
import 'package:ticket_booking_app/views/widgets/toggle_tabs.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int activeIndex = 0;

  void switchTab(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  final List<Widget> tabScreens = <Widget>[
    const AirlineTickets(),
    Container(
      margin: EdgeInsets.only(
        top: generateDynamicHeight(20),
      ),
      child: const Center(
        child: Text("Hotels Page (Brewing soon...)"),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalStyles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: generateDynamicWidth(20),
          vertical: generateDynamicHeight(20),
        ),
        children: [
          Gap(
            generateDynamicHeight(40),
          ),
          Text(
            "Whatcha\nlookin' for? 🧐",
            style: GlobalStyles.heading1Style.copyWith(
              fontSize: generateDynamicWidth(36),
            ),
          ),
          Gap(
            generateDynamicHeight(30),
          ),
          ToggleTabs(
            tabsList: const ["Airline Tickets", "Hotels"],
            activeIndex: activeIndex,
            switchTab: switchTab,
          ),
          Gap(
            generateDynamicHeight(15),
          ),
          tabScreens[activeIndex], // 0 -> Airline Tickets, 1 -> Hotels.
        ],
      ),
    );
  }
}

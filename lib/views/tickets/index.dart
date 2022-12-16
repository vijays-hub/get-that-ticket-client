import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/styles.dart';
import 'package:ticket_booking_app/views/tickets/previous_tickets_collection.dart';
import 'package:ticket_booking_app/views/tickets/upcoming_tickets_collection.dart';
import 'package:ticket_booking_app/views/widgets/dotted_separator.dart';
import 'package:ticket_booking_app/views/widgets/toggle_tabs.dart';

class TicketsCollectionScreen extends StatefulWidget {
  const TicketsCollectionScreen({super.key});

  @override
  State<TicketsCollectionScreen> createState() =>
      _TicketsCollectionScreenState();
}

class _TicketsCollectionScreenState extends State<TicketsCollectionScreen> {
  int activeIndex = 0;

  void switchTab(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  final List<Widget> tabScreens = <Widget>[
    const UpcomingTicketsCollection(),
    const PreviousTicketsCollection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalStyles.bgColor,
      body: ListView(
        children: [
          Gap(
            generateDynamicHeight(40),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: generateDynamicWidth(20),
            ),
            child: Text(
              "Tickets Box",
              style: GlobalStyles.heading1Style.copyWith(
                fontSize: 36,
              ),
            ),
          ),
          Gap(
            generateDynamicHeight(30),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: generateDynamicWidth(20),
            ),
            child: ToggleTabs(
              tabsList: const [
                "Upcoming Tickets",
                "Previous Tickets",
              ],
              activeIndex: activeIndex,
              switchTab: switchTab,
            ),
          ),
          Gap(
            generateDynamicHeight(20),
          ),
          const Center(
            child: Text("○"),
          ),
          Gap(
            generateDynamicHeight(20),
          ),
          tabScreens[activeIndex],
          const Center(
            child: Text("○"),
          ),
          Gap(
            generateDynamicHeight(20),
          ),
        ],
      ),
    );
  }
}

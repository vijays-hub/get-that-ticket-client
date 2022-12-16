import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/styles.dart';
import 'package:ticket_booking_app/views/home/greet.dart';
import 'package:ticket_booking_app/views/home/hotels.dart';
import 'package:ticket_booking_app/views/home/search.dart';
import 'package:ticket_booking_app/views/home/upcoming_flights.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalStyles.bgColor,
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: ListView(
          children: [
            Gap(generateDynamicHeight(40)),
            const Greet(),
            Gap(generateDynamicHeight(20)),
            const Search(),
            Gap(generateDynamicHeight(35)),
            const UpcomingFlights(),
            Gap(generateDynamicHeight(25)),
            const Hotels(),
          ],
        ),
      ),
    );
  }
}

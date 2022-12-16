import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/styles.dart';
import 'package:ticket_booking_app/views/search/flights_search_inputbox.dart';
import 'package:ticket_booking_app/views/search/featured_articles.dart';

class AirlineTickets extends StatefulWidget {
  const AirlineTickets({super.key});

  @override
  State<AirlineTickets> createState() => _AirlineTicketsState();
}

class _AirlineTicketsState extends State<AirlineTickets> {
  String departureSearchText = "";
  String arrivalSearchText = "";

  void handleDepartureTextChange(String searchQuery) =>
      setState(() => departureSearchText = searchQuery);

  void handleArrivalTextChange(String searchQuery) =>
      setState(() => arrivalSearchText = searchQuery);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace, avoid_unnecessary_containers
    return Container(
      child: Column(
        children: [
          SearchInput(
            hintText: "Departure",
            icon: Icons.flight_takeoff_rounded,
            handleOnChange: handleDepartureTextChange,
          ),

          Gap(
            generateDynamicHeight(15),
          ),

          SearchInput(
            hintText: "Arrival",
            icon: Icons.flight_land_rounded,
            handleOnChange: handleArrivalTextChange,
          ),

          Gap(
            generateDynamicHeight(20),
          ),

          // TODO: Make it a reusable widget on demand.
          // ignore: sized_box_for_whitespace
          Container(
            width: AppLayout.getViewportSize(context).width,
            child: ElevatedButton(
              onPressed: () {
                debugPrint(
                    "Search for departure: $departureSearchText and arrival: $arrivalSearchText");
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(
                    vertical: generateDynamicHeight(15),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color(0xD91130CE),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              child: Text(
                "Discover Tickets",
                style: GlobalStyles.textStyle.copyWith(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Gap(
            generateDynamicHeight(30),
          ),
          const FeaturedArticles(),
        ],
      ),
    );
  }
}

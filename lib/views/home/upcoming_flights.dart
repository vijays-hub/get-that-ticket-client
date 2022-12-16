import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/utils/app_info.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/styles.dart';
import 'package:ticket_booking_app/views/widgets/ticket/index.dart';

class UpcomingFlights extends StatelessWidget {
  const UpcomingFlights({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: generateDynamicWidth(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Upcoming Flights",
                style: GlobalStyles.heading2Style,
              ),
              InkWell(
                onTap: () {
                  debugPrint("Pressed the View All Button");
                },
                child: Container(
                  margin: EdgeInsets.only(
                    right: generateDynamicWidth(20),
                  ),
                  child: Text(
                    "View all",
                    style: GlobalStyles.textStyle.copyWith(
                      color: GlobalStyles.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Gap(
            generateDynamicHeight(15),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: ticketList
                  .map(
                    (ticket) => TicketView(
                      maxWidth: false,
                      ticketInfo: ticket,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

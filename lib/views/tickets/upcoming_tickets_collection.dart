import 'package:flutter/material.dart';
import 'package:ticket_booking_app/utils/app_info.dart';
import 'package:ticket_booking_app/views/tickets/ticket_details.dart';

class UpcomingTicketsCollection extends StatelessWidget {
  const UpcomingTicketsCollection({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: The tickets list are to be fetched from Server.
    return Column(
      children: ticketList
          .asMap()
          .entries
          .map(
            (entry) => TicketDetails(
              ticketInfo: entry.value,
              showSeparator: entry.key < ticketList.length - 1,
            ),
          )
          .toList(),
    );
  }
}

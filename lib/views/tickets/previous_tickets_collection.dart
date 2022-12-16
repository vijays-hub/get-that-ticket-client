import 'package:flutter/material.dart';
import 'package:ticket_booking_app/utils/app_info.dart';
import 'package:ticket_booking_app/views/tickets/ticket_details.dart';

class PreviousTicketsCollection extends StatelessWidget {
  const PreviousTicketsCollection({super.key});

  @override
  Widget build(BuildContext context) {
    final previousTicketsList = [
      ticketList[2],
    ];

    // TODO: The tickets list are to be fetched from Server.
    return Column(
      children: previousTicketsList
          .asMap()
          .entries
          .map(
            (entry) => TicketDetails(
              ticketInfo: entry.value,
              showSeparator: entry.key < previousTicketsList.length - 1,
            ),
          )
          .toList(),
    );
  }
}

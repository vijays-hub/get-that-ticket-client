import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/views/widgets/dotted_separator.dart';
import 'package:ticket_booking_app/views/widgets/ticket/index.dart';

// ignore: must_be_immutable
class TicketDetails extends StatelessWidget {
  final Map<String, dynamic> ticketInfo;
  bool? showSeparator = true;

  TicketDetails({
    super.key,
    required this.ticketInfo,
    this.showSeparator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: generateDynamicHeight(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: generateDynamicHeight(20),
            ),
            child: TicketView(
              maxWidth: true,
              ticketInfo: ticketInfo,
              exposeDetails: true,
            ),
          ),
          Gap(generateDynamicHeight(15)),
          // Displaying abstract ticket as well.
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: generateDynamicHeight(20),
            ),
            child: TicketView(
              maxWidth: true,
              ticketInfo: ticketInfo,
            ),
          ),
          Gap(generateDynamicHeight(30)),
          showSeparator == true
              ? DottedSeparator(
                  dotsColor: Colors.black,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/styles.dart';

class TicketDetailLayout extends StatelessWidget {
  final String title;
  final String value;
  final CrossAxisAlignment crossAxisAlignment;

  const TicketDetailLayout({
    super.key,
    required this.title,
    required this.value,
    required this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          value,
          style: GlobalStyles.heading3Style.copyWith(
            color: Colors.black,
          ),
        ),
        Gap(generateDynamicHeight(5)),
        Text(
          title,
          style: GlobalStyles.heading4Style,
        ),
      ],
    );
  }
}

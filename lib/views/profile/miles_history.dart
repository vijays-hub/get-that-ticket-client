import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/utils/app_info.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/styles.dart';
import 'package:ticket_booking_app/views/widgets/dotted_separator.dart';
import 'package:ticket_booking_app/views/widgets/ticket/ticket_detail_layout.dart';

class MilesHistory extends StatelessWidget {
  const MilesHistory({super.key});

  // TODO: Fetch Miles History and store it in state. Or Make it part of user profile and store it in state during load of Home.

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: generateDynamicWidth(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Miles History",
                style: GlobalStyles.textStyle.copyWith(
                  color: GlobalStyles.primaryColor,
                ),
              )
            ],
          ),
          Gap(generateDynamicHeight(5)),
          Column(
            children: milesHistory
                .map(
                  (mileHistory) => Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: generateDynamicHeight(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TicketDetailLayout(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          title: "miles",
                          value: mileHistory["miles"].toString(),
                        ),
                        TicketDetailLayout(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          title: "accumulated from",
                          value: mileHistory["from"],
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

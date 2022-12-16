import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/utils/app_info.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/styles.dart';
import 'package:countup/countup.dart';

class AccumulatedMiles extends StatelessWidget {
  const AccumulatedMiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double accumulatedMiles =
        milesHistory.fold(0, (acc, item) => acc + item["miles"]);

    debugPrint("Miles: $accumulatedMiles");

    return Container(
      margin: EdgeInsets.only(
        top: generateDynamicHeight(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Accumulated Miles",
            style: GlobalStyles.heading2Style,
          ),
          Gap(generateDynamicHeight(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Countup(
                begin: 0,
                end: accumulatedMiles,
                duration: const Duration(seconds: 3),
                // separator: '.',
                textAlign: TextAlign.center,
                style: GlobalStyles.heading1Style.copyWith(
                  color: GlobalStyles.primaryColor,
                  fontSize: 56,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/styles.dart';
import 'package:ticket_booking_app/views/profile/accumulated_miles.dart';
import 'package:ticket_booking_app/views/profile/awards_badge.dart';
import 'package:ticket_booking_app/views/profile/basic_details.dart';
import 'package:ticket_booking_app/views/profile/miles_history.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalStyles.bgColor,
      body: ListView(
        padding: EdgeInsets.all(
          generateDynamicHeight(20),
        ),
        children: [
          Gap(generateDynamicHeight(40)),
          const BasicDetails(),
          Gap(generateDynamicHeight(30)),
          const AwardsBadge(),
          const AccumulatedMiles(),
          Gap(generateDynamicHeight(30)),
          const MilesHistory(),
          Gap(generateDynamicHeight(40)),
          const Center(
            child: Text("○"),
          ),
        ],
      ),
    );
  }
}

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/styles.dart';

class AwardsBadge extends StatefulWidget {
  const AwardsBadge({super.key});

  @override
  State<AwardsBadge> createState() => _AwardsBadgeState();
}

class _AwardsBadgeState extends State<AwardsBadge> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: generateDynamicHeight(90),
          width: double.infinity,
          decoration: BoxDecoration(
            color: GlobalStyles.primaryColor,
            borderRadius: BorderRadius.circular(
              generateDynamicHeight(12),
            ),
          ),
        ),
        Positioned(
          top: -40,
          right: -40,
          child: Container(
            padding: EdgeInsets.all(generateDynamicHeight(30)),
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                width: 18,
                color: const Color(0xFF264CD2),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: generateDynamicHeight(18),
            horizontal: generateDynamicHeight(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                maxRadius: generateDynamicHeight(25),
                backgroundColor: Colors.white,
                child: Icon(
                  FluentSystemIcons.ic_fluent_lightbulb_filament_filled,
                  color: GlobalStyles.primaryColor,
                  size: 30,
                ),
              ),
              Gap(generateDynamicWidth(10)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "You\'ve got a new award 🎁🎉",
                    style: GlobalStyles.heading2Style.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "You have 150 flights in a year ✈︎",
                    style: GlobalStyles.heading3Style.copyWith(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 15,
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

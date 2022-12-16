import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/utils/app_info.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/styles.dart';

class Greet extends StatelessWidget {
  const Greet({super.key});

  @override
  Widget build(BuildContext context) {
    String getGreeting() {
      final int hour = DateTime.now().hour;
      if (hour < 12) return 'Morning';
      if (hour < 17) return 'Afternoon';
      return 'Evening';
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: generateDynamicWidth(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good ${getGreeting()}!",
                    style: GlobalStyles.heading3Style,
                  ),
                  Text(
                    "Vijay S Kumar",
                    style: GlobalStyles.heading1Style,
                  ),
                ],
              ),
              Container(
                width: generateDynamicWidth(50),
                height: generateDynamicHeight(50),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(generateDynamicHeight(10)),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("$assetsPath/spiderman_stock.jpg"),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

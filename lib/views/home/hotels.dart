import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/utils/app_info.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/styles.dart';
import 'package:ticket_booking_app/views/widgets/hotel_view.dart';

class Hotels extends StatelessWidget {
  const Hotels({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: generateDynamicHeight(20),
        bottom: generateDynamicHeight(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hotels",
                style: GlobalStyles.heading2Style,
              ),
              InkWell(
                onTap: () {
                  debugPrint("Pressed the View All Button");
                },
                // ignore: avoid_unnecessary_containers
                child: Container(
                  margin: EdgeInsets.only(
                    right: generateDynamicHeight(20),
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
            generateDynamicHeight(20),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: hotelList
                  .map(
                    (hotel) => HotelView(
                      hotelInfo: hotel,
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

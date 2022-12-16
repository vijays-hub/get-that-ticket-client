import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/styles.dart';
import 'package:ticket_booking_app/views/widgets/dotted_separator.dart';

class DepartureInfo extends StatelessWidget {
  final String date;
  final String time;
  final int terminalNumber;
  bool? exposeDetails = false;

  DepartureInfo({
    super.key,
    required this.date,
    required this.time,
    required this.terminalNumber,
    this.exposeDetails,
  });

  @override
  Widget build(BuildContext context) {
    final shouldExposeDetails = exposeDetails == true;

    final Color exposeTextColorLight =
        shouldExposeDetails ? Colors.grey.shade500 : Colors.white;
    final Color exposeTextColorDark =
        shouldExposeDetails ? Colors.black : Colors.white;

    SizedBox getTicketCurve({
      required BorderRadiusGeometry borderRadiusGeometry,
    }) =>
        SizedBox(
          height: generateDynamicHeight(20),
          width: generateDynamicWidth(10),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: borderRadiusGeometry,
            ),
          ),
        );

    Column getDepartureInfoItem({
      required String title,
      required String value,
      CrossAxisAlignment? crossAxisAlignment,
    }) =>
        Column(
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: [
            Text(
              value,
              style: GlobalStyles.heading3Style.copyWith(
                color: exposeTextColorDark,
              ),
            ),
            Gap(
              generateDynamicHeight(5),
            ),
            Text(
              title,
              style: GlobalStyles.heading4Style.copyWith(
                color: exposeTextColorLight,
              ),
            ),
          ],
        );

    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        children: [
          Container(
            color:
                shouldExposeDetails ? Colors.white : GlobalStyles.orangeColor,
            padding: EdgeInsets.only(
              top: generateDynamicHeight(shouldExposeDetails ? 0 : 5),
            ),
            child: Row(
              children: [
                getTicketCurve(
                  borderRadiusGeometry: BorderRadius.only(
                    topRight: Radius.circular(
                      generateDynamicHeight(10),
                    ),
                    bottomRight: Radius.circular(
                      generateDynamicHeight(10),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(
                      generateDynamicHeight(8),
                    ),
                    child: DottedSeparator(
                      dotsColor: shouldExposeDetails
                          ? Colors.grey.shade300
                          : Colors.white,
                    ),
                  ),
                ),
                getTicketCurve(
                  borderRadiusGeometry: BorderRadius.only(
                    topLeft: Radius.circular(
                      generateDynamicHeight(10),
                    ),
                    bottomLeft: Radius.circular(
                      generateDynamicHeight(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: generateDynamicHeight(10),
              right: generateDynamicHeight(16),
              bottom: generateDynamicHeight(16),
              left: generateDynamicHeight(16),
            ),
            decoration: BoxDecoration(
              color:
                  shouldExposeDetails ? Colors.white : GlobalStyles.orangeColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  generateDynamicHeight(shouldExposeDetails ? 0 : 20),
                ),
                bottomRight: Radius.circular(
                  generateDynamicHeight(shouldExposeDetails ? 0 : 20),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getDepartureInfoItem(
                  title: "Date",
                  value: date,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                getDepartureInfoItem(
                  title: "Departure Time",
                  value: time,
                ),
                getDepartureInfoItem(
                  title: "Terminal",
                  value: terminalNumber.toString(),
                  crossAxisAlignment: CrossAxisAlignment.end,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

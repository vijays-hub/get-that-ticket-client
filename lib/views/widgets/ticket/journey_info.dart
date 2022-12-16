import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/styles.dart';
import 'package:ticket_booking_app/views/widgets/thick_circle.dart';

class JourneyInfo extends StatelessWidget {
  final Map<String, dynamic> from;
  final Map<String, dynamic> to;
  bool? exposeDetails = false;
  final String journeyDuration;

  JourneyInfo({
    super.key,
    required this.from,
    required this.to,
    required this.journeyDuration,
    this.exposeDetails,
  });

  @override
  Widget build(BuildContext context) {
    final Color routeColorDark =
        exposeDetails == true ? Colors.black : Colors.white;
    final Color routeColorLight =
        exposeDetails == true ? Colors.grey.shade500 : Colors.white;

    Text getRouteText({required String route, TextStyle? styles}) => Text(
          route,
          style: styles ??
              GlobalStyles.heading3Style.copyWith(
                color: Colors.white,
              ),
        );

    // Sized Box helps us to restrict the text within the specified dimensions.
    SizedBox getTerminalText({
      required double width,
      required String airportName,
      TextAlign? textAlign,
      TextStyle? textStyles,
    }) =>
        SizedBox(
          width: width,
          child: Text(
            airportName,
            textAlign: textAlign ?? TextAlign.start,
            maxLines: 1,
            overflow: TextOverflow.fade,
            softWrap: false,
            style: textStyles ??
                GlobalStyles.heading4Style.copyWith(
                  color: Colors.white,
                ),
          ),
        );

    return Container(
      padding: EdgeInsets.all(
        generateDynamicHeight(15),
      ),
      decoration: BoxDecoration(
        color: exposeDetails == true ? Colors.white : const Color(0xFF526799),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            generateDynamicHeight(20),
          ),
          topRight: Radius.circular(
            generateDynamicHeight(20),
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              getRouteText(
                route: from['iata_code'],
                styles: GlobalStyles.heading3Style.copyWith(
                  color: routeColorDark,
                ),
              ),
              const Spacer(), // Hint: Can replace Spacer with Expanded(child: Container()) as well.
              ThichCircle(
                exposeDetails: exposeDetails,
              ),
              Expanded(
                child: Stack(
                  children: [
                    SizedBox(
                      height: generateDynamicHeight(24),
                      // LayoutBuilder helps to get dyanamic width based on viewports. It is used here for generating dotted lines.
                      child: LayoutBuilder(builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Flex(
                          // Flex to help us align easily. Can go with Row as well.
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                            (constraints.constrainWidth() /
                                    6) // 6 is some random number that divides the width
                                .floor(),
                            (index) => SizedBox(
                              width:
                                  generateDynamicWidth(3), // The width of dot.
                              height: generateDynamicHeight(
                                  1), // The height of dot.
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: routeColorLight,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    Center(
                      child: Transform.rotate(
                        angle: 1.5, // 1.5 is like 90deg. Read more about this.
                        child: Icon(
                          Icons.local_airport_rounded,
                          color: exposeDetails == true
                              ? const Color(0xFF8ACCF7)
                              : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ThichCircle(
                exposeDetails: exposeDetails,
              ),
              const Spacer(),
              getRouteText(
                  route: to['iata_code'],
                  styles: GlobalStyles.heading3Style.copyWith(
                    color: routeColorDark,
                  )),
            ],
          ),
          Gap(
            generateDynamicHeight(5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getTerminalText(
                airportName: from['airport_name'],
                width: generateDynamicWidth(100),
                textStyles: GlobalStyles.heading4Style.copyWith(
                  color: routeColorLight,
                ),
              ),
              Text(
                journeyDuration,
                style: GlobalStyles.heading4Style.copyWith(
                  color: routeColorDark,
                  fontSize: 18,
                ),
              ),
              getTerminalText(
                width: generateDynamicWidth(100),
                airportName: to['airport_name'],
                textAlign: TextAlign.end,
                textStyles: GlobalStyles.heading4Style.copyWith(
                  color: routeColorLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/utils/app_info.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/styles.dart';

class HotelView extends StatelessWidget {
  final Map<String, dynamic> hotelInfo;
  const HotelView({super.key, required this.hotelInfo});

  @override
  Widget build(BuildContext context) {
    Size viewportDimensions = AppLayout.getViewportSize(context);
    return Container(
      width: viewportDimensions.width *
          0.6, // 60% of the width. TODO: Convert this to dyanmic width if needed by accepting props.
      height: generateDynamicHeight(350),
      margin: EdgeInsets.only(
        right: generateDynamicHeight(10),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: generateDynamicWidth(15),
        vertical: generateDynamicHeight(18),
      ),
      decoration: BoxDecoration(
          color: GlobalStyles.primaryColor,
          borderRadius: BorderRadius.circular(
            generateDynamicHeight(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 20,
              spreadRadius: 5,
            )
          ]),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: boxConstraints.constrainHeight() *
                    0.65, // 65% of the parent height.
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    generateDynamicHeight(12),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      // ignore: unnecessary_brace_in_string_interps
                      "${assetsPath}/${hotelInfo['image']}",
                    ),
                  ),
                ),
              ),
              Gap(
                generateDynamicHeight(10),
              ),
              Text(
                hotelInfo['location'],
                style: GlobalStyles.heading2Style.copyWith(
                  color: GlobalStyles.khakiColor,
                ),
              ),
              Gap(
                generateDynamicHeight(5),
              ),
              Text(
                hotelInfo['destination'],
                style: GlobalStyles.heading3Style.copyWith(
                  color: Colors.white,
                ),
              ),
              Gap(
                generateDynamicHeight(5),
              ),
              Text(
                "\$${hotelInfo['cost']}/night",
                style: GlobalStyles.heading1Style.copyWith(
                  color: GlobalStyles.khakiColor,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

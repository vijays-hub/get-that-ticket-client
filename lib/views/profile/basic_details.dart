import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/utils/app_info.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/styles.dart';

class BasicDetails extends StatelessWidget {
  const BasicDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: generateDynamicHeight(80),
          width: generateDynamicWidth(80),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              generateDynamicHeight(12),
            ),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("$assetsPath/spiderman_stock.jpg"),
            ),
          ),
        ),
        Gap(generateDynamicWidth(15)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Vijay S Kumar",
              style: GlobalStyles.heading2Style,
            ),
            Gap(generateDynamicWidth(2)),
            Text(
              "New York",
              style: GlobalStyles.textStyle,
            ),
            Gap(generateDynamicWidth(8)),
            Container(
              padding: EdgeInsets.only(right: generateDynamicWidth(10)),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF4F3),
                borderRadius: BorderRadius.circular(
                  generateDynamicHeight(100),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(generateDynamicWidth(3)),
                    decoration: const BoxDecoration(
                      color: Color(0xFF526799),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      FluentSystemIcons.ic_fluent_shield_filled,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                  Gap(generateDynamicWidth(5)),
                  const Text(
                    "Premium",
                    style: TextStyle(
                      color: Color(0xFF526799),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        const Spacer(),
        Column(
          children: [
            GestureDetector(
              onTap: () {
                debugPrint("Clicked Edit Profile");
              },
              child: const Icon(
                FluentSystemIcons.ic_fluent_edit_filled,
                color: Color(0xFF526799),
                size: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

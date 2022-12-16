import 'package:flutter/material.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';

class ThichCircle extends StatelessWidget {
  bool? exposeDetails = false;
  ThichCircle({
    super.key,
    this.exposeDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        generateDynamicHeight(3),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          generateDynamicHeight(20),
        ),
        border: Border.all(
          width: generateDynamicWidth(2.5),
          color: exposeDetails == true ? const Color(0xFF8ACCF7) : Colors.white,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';

// TODO: Accept more params if needed.
class DottedSeparator extends StatelessWidget {
  Color dotsColor = Colors.white;

  DottedSeparator({
    super.key,
    required this.dotsColor,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (
        BuildContext buildContext,
        BoxConstraints boxConstraints,
      ) {
        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: List.generate(
            (boxConstraints.constrainWidth() / (10)).floor(),
            (index) => SizedBox(
              width: generateDynamicWidth(5),
              height: generateDynamicHeight(2),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: dotsColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

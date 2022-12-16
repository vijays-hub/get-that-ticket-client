import 'package:flutter/material.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';

class ToggleTabs extends StatelessWidget {
  final List<String> tabsList;
  final int activeIndex;
  final void Function(int) switchTab;

  const ToggleTabs({
    super.key,
    required this.tabsList,
    required this.activeIndex,
    required this.switchTab,
  });

  @override
  Widget build(BuildContext context) {
    final Size viewportSize = AppLayout.getViewportSize(context);

    Container getToggleTab({
      required bool isActive,
      required BorderRadiusGeometry borderRadius,
      required String text,
    }) =>
        Container(
          width: viewportSize.width * 0.45,
          padding: EdgeInsets.symmetric(
            vertical: generateDynamicHeight(10),
          ),
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.transparent,
            borderRadius: borderRadius,
          ),
          child: Center(
            child: Text(
              text,
            ),
          ),
        );

    return FittedBox(
      child: Container(
        padding: EdgeInsets.all(
          generateDynamicHeight(4),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            generateDynamicHeight(50),
          ),
          color: const Color(0xFFF4F6FD),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // Converting `List` to `Map` to access the index.
          children: tabsList
              .asMap()
              .entries
              .map(
                (entry) => InkWell(
                  onTap: () => switchTab(entry.key),
                  child: getToggleTab(
                    isActive: activeIndex == entry.key,
                    borderRadius: entry.key == 0
                        ? BorderRadius.only(
                            topLeft: Radius.circular(
                              generateDynamicHeight(50),
                            ),
                            bottomLeft: Radius.circular(
                              generateDynamicHeight(50),
                            ),
                          )
                        : BorderRadius.only(
                            topRight: Radius.circular(
                              generateDynamicHeight(50),
                            ),
                            bottomRight: Radius.circular(
                              generateDynamicHeight(50),
                            ),
                          ),
                    text: entry.value,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

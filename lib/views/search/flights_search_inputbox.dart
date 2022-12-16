import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/styles.dart';

class SearchInput extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final void Function(String) handleOnChange;
  void Function()? queryFunction;

  SearchInput({
    super.key,
    required this.hintText,
    required this.icon,
    required this.handleOnChange,
    this.queryFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: generateDynamicWidth(10),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            generateDynamicHeight(12),
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFFBFC2DF),
          ),
          Gap(
            generateDynamicWidth(10),
          ),
          Expanded(
            child: TextField(
              onChanged: handleOnChange,
              onEditingComplete: () {
                queryFunction!();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: GlobalStyles.textStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/views/search/flights_search_inputbox.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String searchString = "";

  void handleSearchQueryChange(String searchQuery) =>
      setState(() => searchString = searchQuery);

  void fethTickets() {
    if (searchString == "") return;
    debugPrint("Call API with $searchString");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: generateDynamicHeight(10),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: generateDynamicWidth(20),
      ),
      // ignore: avoid_unnecessary_containers
      child: SearchInput(
        hintText: "Search",
        icon: FluentSystemIcons.ic_fluent_search_regular,
        handleOnChange: handleSearchQueryChange,
        queryFunction: fethTickets,
      ),
    );
  }
}

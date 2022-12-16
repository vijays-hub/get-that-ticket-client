import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_booking_app/utils/styles.dart';
import 'package:ticket_booking_app/views/bottom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ticket Booking App | Vijay S Kumar',
      theme: ThemeData(
        primaryColor: primary,
        textTheme: GoogleFonts.vt323TextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const BottomNavigationMenu(),
    );
  }
}

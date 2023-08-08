import 'package:flutter/material.dart';

class AvailableVenues extends StatefulWidget {
  const AvailableVenues({super.key});

  @override
  State<AvailableVenues> createState() => _AvailableVenuesState();
}

class _AvailableVenuesState extends State<AvailableVenues> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Available venues"),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
    );
  }
}
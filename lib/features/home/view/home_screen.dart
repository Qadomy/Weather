import 'package:flutter/material.dart';
import 'package:weather_warba_bank/features/home/view/widgets/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Warba App"),
        centerTitle: false, // Aligns the title to the start of the AppBar
        automaticallyImplyLeading: false, // Removes the back button
      ),
      body: const HomeScreenBody(),
    );
  }
}

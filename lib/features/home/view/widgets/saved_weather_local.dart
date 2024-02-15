import 'package:flutter/material.dart';

import '../../../../core/animations/scale_transition_animation.dart';

class SavedWeatherLocal extends StatefulWidget {
  final String city;
  final String conditionName;
  final double temp;

  const SavedWeatherLocal({
    super.key,
    required this.city,
    required this.conditionName,
    required this.temp,
  });

  @override
  State<SavedWeatherLocal> createState() => _SavedWeatherLocalState();
}

class _SavedWeatherLocalState extends State<SavedWeatherLocal> {
  @override
  Widget build(BuildContext context) {
    return ScaleTransitionAnimation(
      duration: const Duration(milliseconds: 1500),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade200, Colors.blue],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              widget.city,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              widget.conditionName,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '${widget.temp}°',
                  style: const TextStyle(fontSize: 48, color: Colors.white),
                ),
                // Replace with your own weather icon
                Image.asset(
                  "assets/images/weather.png",
                  // Placeholder icon
                  width: 100,
                  height: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

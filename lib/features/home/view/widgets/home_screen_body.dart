import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_warba_bank/features/home/view/widgets/saved_weather_local.dart';
import 'package:weather_warba_bank/features/home/view/widgets/search_text_field.dart';

import '../../../../core/local/cache_data.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchTextField(),
            const SizedBox(height: 30),
            const Text(' Recent Weather Searches'),
            const SizedBox(height: 10),
            FutureBuilder<Map<String, dynamic>>(
              future: SharedPreferencesService.getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(); // Show a loading indicator while waiting for data
                }
                if (snapshot.hasError) {
                  return Text(
                      'Error: ${snapshot.error}'); // Show an error message if there's an error
                }

                // If data is retrieved successfully and not empty, pass it to SavedWeatherLocal widget
                return snapshot.data!['city'].toString().isEmpty
                    ? const Text("")
                    : SavedWeatherLocal(
                        city: snapshot.data!['city'] ?? '',
                        temp: snapshot.data!['temp'] ?? 0.0,
                        conditionName: snapshot.data!['conditionName'] ?? '',
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}

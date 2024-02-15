import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_warba_bank/features/home/view/widgets/saved_weather_local.dart';
import 'package:weather_warba_bank/features/home/view/widgets/search_text_field.dart';

import '../../../../core/local/cache_data.dart';


class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  _HomeScreenBodyState createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  late Future<Map<String, dynamic>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = SharedPreferencesService.instance.getData(); // Initial load
    // Listen to SharedPreferencesService changes
    SharedPreferencesService.instance.addListener(_updateData);
  }

  @override
  void dispose() {
    // Remove the listener when the widget is disposed to avoid memory leaks
    SharedPreferencesService.instance.removeListener(_updateData);
    super.dispose();
  }

  void _updateData() {
    // Update the future to force the FutureBuilder to rebuild
    setState(() {
      futureData = SharedPreferencesService.instance.getData();
    });
  }

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
            const Text('Recent Weather Searches'),
            const SizedBox(height: 10),
            FutureBuilder<Map<String, dynamic>>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

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


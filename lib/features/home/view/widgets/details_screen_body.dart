import 'package:flutter/material.dart';
import 'package:weather_warba_bank/core/local/cache_data.dart';

import '../../data/models/weather_model.dart';

class DetailsScreenBody extends StatefulWidget {
  const DetailsScreenBody({Key? key, required this.weatherModel})
      : super(key: key);

  final WeatherModel weatherModel;

  @override
  State<DetailsScreenBody> createState() => _DetailsScreenBodyState();
}

class _DetailsScreenBodyState extends State<DetailsScreenBody> {
  @override
  void initState() {
    super.initState();
    saveDataLocal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          }, // Define the action or remove if not needed
        ),
        title: Text(
          widget.weatherModel.location!.name!,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.lightBlueAccent],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 200,
              width: 200,
              child: NetworkImageWidget(
                imageUrl: widget.weatherModel.current!.condition!.icon!,
              ),
            ),
            Text(
              '${widget.weatherModel.current!.tempC}°',
              style: const TextStyle(color: Colors.white, fontSize: 80),
            ),
            Text(
              widget.weatherModel.current!.condition!.text!,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InfoColumn(
                      data: '${widget.weatherModel.current!.windKph} k/h',
                      label: 'Wind',
                      icon: Icons.wind_power),
                  InfoColumn(
                      data: '${widget.weatherModel.current!.windMph} m/h',
                      label: 'Wind',
                      icon: Icons.wind_power),
                  InfoColumn(
                      data: '${widget.weatherModel.current!.humidity}',
                      label: 'Humidity',
                      icon: Icons.opacity),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveDataLocal() async {
    await SharedPreferencesService.saveData(
      city: widget.weatherModel.location!.name!,
      temp: widget.weatherModel.current!.tempC!,
      conditionName: widget.weatherModel.current!.condition!.text!,
      lastUpdate: widget.weatherModel.current!.lastUpdated!,
    );
  }
}

class InfoColumn extends StatelessWidget {
  final String data;
  final String label;
  final IconData icon;

  const InfoColumn({
    Key? key,
    required this.data,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(icon, color: Colors.yellow),
        Text(
          data,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }
}

class NetworkImageWidget extends StatelessWidget {
  final String imageUrl;

  // Constructor for the widget
  const NetworkImageWidget({Key? key, required this.imageUrl})
      : super(key: key);

  // Helper method to process the URL
  String _processImageUrl(String url) {
    // Check if the URL starts with '//' and prepend 'https:' to it
    if (url.startsWith('//')) {
      return 'https:$url';
    }
    // If not, return the URL as it is
    return url;
  }

  @override
  Widget build(BuildContext context) {
    // Process the imageUrl before using it
    final processedImageUrl = _processImageUrl(imageUrl);

    return Image.network(
      processedImageUrl,
      fit: BoxFit.cover,
      // You can adjust this to change how the image fits into the widget area.
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const Center(
          child: Text('Could not load image'),
        );
      },
    );
  }
}

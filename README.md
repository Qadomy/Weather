# weather_warba_bank

# WeatherApp - A Flutter Mobile Application

WeatherApp is a sleek and intuitive mobile application developed using Flutter, designed to provide real-time weather information at your fingertips. Simply search for a city to discover detailed weather conditions including wind speed, temperature in Celsius, weather condition, and humidity. The application embodies the principles of MVVM design pattern and leverages the BLoC state management approach to ensure a responsive and user-friendly experience.


## Features

- **City Search**: Users can search for weather information by city name through an input text field.
- **Weather Details**: Navigate to a detailed screen showing wind speed, temperature (Celsius), weather condition, and humidity.
- **Recent Searches**: View and access recent search history stored locally using Shared Preferences, allowing for quick revisits to previously searched cities.
- **Dual Flavors**: The app includes two flavors - Development and Production - each with distinct icons, facilitating testing and deployment processes.

## Getting Started
# Using:
- Flutter framework
- Dart programming language
- MVVM Architecture
- Bloc state management (cubit)
- Animation
- Weather api
- Dio package
- Solid principles
- Dependency injection
- Unit Test - Mockito

To get started with WeatherApp, ensure you have Flutter installed on your development machine. Clone the repository to your local machine, and you're ready to run the app with the following steps:

1. **Installation**

   Open your terminal and run:

   ```bash
   flutter pub get
   
   Choose the desired flavor to run:
   
   Development:
   flutter run --flavor development -t lib/main_development.dart
   
   Production
   flutter run --flavor production -t lib/main_production.dart



Architecture
WeatherApp is built using the 
- ** MVVM (Model-View-ViewModel) design pattern, aiming for a clean separation of concerns, 
and enhanced maintainability. The app's responsive and scalable architecture is powered by:

- ** BLoC for State Management: Ensures a reactive and efficient state management mechanism.
- ** Dio Package: For network calls to WeatherAPI.com, facilitating seamless API integration.
- ** JSON Serializable & Annotation: Utilized to streamline and reduce boilerplate code associated with JSON serialization.
- ** Shared Preferences: For local storage of recent search data, enhancing user experience with persistent history.

API Integration
WeatherApp fetches weather data from WeatherAPI.com. 
Ensure you have an API key from WeatherAPI.com and include it in your project's 
environment variables or as specified in the app's documentation.


Unit Testing:
This test checks if our app correctly gets weather information for a specific city 
and handles errors when things go wrong. 
We use Mockito to pretend we're talking to a real weather service, 
allowing us to simulate different scenarios without needing an actual internet connection.


 <tr>
    <td>Search View</td>
    <td>Details View</td>
    <td>Error View</td>
  </tr>
  <tr>
    <td><img src="https://github.com/Qadomy/Weather/blob/master/assets/images/screen2.jpg" width=270 height=480 alt=""></td>
    <td><img src="https://github.com/Qadomy/Weather/blob/master/assets/images/screen1.jpg" width=270 height=480 alt=""></td>
    <td><img src="https://github.com/Qadomy/Weather/blob/master/assets/images/screen3.jpg" width=270 height=480 alt=""></td>
  </tr>
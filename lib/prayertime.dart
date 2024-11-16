import 'dart:convert';
import 'package:http/http.dart' as http;


class PrayerTimesService {
  final String baseUrl = 'https://api.aladhan.com/v1/timingsByCity';

  Future<PrayerTimes> fetchPrayerTimes(String city, String country) async {
    final url = Uri.parse('$baseUrl?city=$city&country=$country&method=2');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return PrayerTimes.fromJson(data['data']['timings']);
    } else {
      throw Exception('Failed to load prayer times');
    }
  }
}

class PrayerTimes {
  final String fajr;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  PrayerTimes({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  factory PrayerTimes.fromJson(Map<String, dynamic> json) {
    return PrayerTimes(
      fajr: json['Fajr'],
      dhuhr: json['Dhuhr'],
      asr: json['Asr'],
      maghrib: json['Maghrib'],
      isha: json['Isha'],
    );
  }
}
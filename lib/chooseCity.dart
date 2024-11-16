import 'package:app/TheAppbar.dart';
import 'package:app/prayertime.dart';
import 'package:app/weather.dart';
import 'package:flutter/material.dart';


class chooseCity extends StatelessWidget{


  bool weather_prayer=false;
  chooseCity(bool weather_prayer){
    this.weather_prayer=weather_prayer;
  }

  List<String> cities= [
    'New York','Paris', 'Tokyo', 'Dubai','London','Sydney','Toronto','Rome','Istanbul','Bangkok'];

  Map<String, String> cityCountryMap = {
    'New York': 'United States',
    'Paris': 'France',
    'Tokyo': 'Japan',
    'Dubai': 'United Arab Emirates',
    'London': 'United Kingdom',
    'Sydney': 'Australia',
    'Toronto': 'Canada',
    'Rome': 'Italy',
    'Istanbul': 'Turkey',
    'Bangkok': 'Thailand',
  };


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: TheAppbar.myappbar(context),

      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),

        child: Center(
          child: Column(

            children: <Widget>[

              DropdownButton(

                hint: Text("Select a city"),

                items: cities.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),

              onChanged: (String? newValue) async {

                if(this.weather_prayer){

                  WeatherService weatherTimesService =WeatherService();
                  Weather weather = await weatherTimesService.fetchWeather(newValue!);

                  Alert(newValue, weather.temperature.toString()+" celsius\n"+weather.description, context);

                }

                else{

                  PrayerTimesService prayerTimesService = PrayerTimesService();
                  PrayerTimes prayerTimes = await prayerTimesService.fetchPrayerTimes(newValue!,cityCountryMap[newValue]! );

                  Alert(newValue,"fajir: "+prayerTimes.fajr+" duhur: "+prayerTimes.dhuhr+" aser: "+prayerTimes.asr+"\n"+
                    " majerb: "+prayerTimes.maghrib+" aisha: "+prayerTimes.isha, context);

                }


              },

                ),
            
          ]
          
          ),
        ),
      ),
    );

  }

  void Alert(String tittle, String message,BuildContext context){

      showDialog(
        context: context, 
        builder:(BuildContext builder){

          return SingleChildScrollView( child:  AlertDialog(

            title: Text(tittle),
            content: Text(message),
            actions: <Align>[

              Align( child:  TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text('ok')),
              alignment: Alignment.centerLeft),
            ],

          ));
        }

        );
    }
  
}
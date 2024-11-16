import 'package:app/TheAppbar.dart';
import 'package:app/chooseCity.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    double width=MediaQuery.sizeOf(context).width;

    return Scaffold(

      appBar: TheAppbar.myappbar(context),
      body: SingleChildScrollView(

        child:Center( child:  Column(

    
          children: <SizedBox>[

            SizedBox(height: 30,),

            SizedBox( child:  ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => chooseCity(true)),);
            }, child: Text('weather'),
            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero))),
            width: width),

            SizedBox(height: 50,),

            SizedBox( child:  ElevatedButton(onPressed: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => chooseCity(false)),);
            }, child: Text('prayer time'),
            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero))),
            width: width),





          ],


        ),
      )),
    );
  }



  
}
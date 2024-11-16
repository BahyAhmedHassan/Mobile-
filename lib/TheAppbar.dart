import 'package:flutter/material.dart';

class TheAppbar{

  static String name='';
  static AppBar myappbar(BuildContext context){

    return AppBar(

      backgroundColor: Colors.blueGrey,
      actions: <PopupMenuButton>[
        
        PopupMenuButton<bool>(
          
          itemBuilder: (BuildContext context) { 

          return [
            PopupMenuItem( value: false,child: Text(name),),
            PopupMenuItem( value: false,child: TextButton(child: Text('sign out'),
            onPressed: (){Navigator.pushNamedAndRemoveUntil(context, '/sign_in', (route) => false); },),),
          ];
         },

      icon: Icon(Icons.menu)
        
      )
      ],


    );
  }
}
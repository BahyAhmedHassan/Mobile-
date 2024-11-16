import 'package:flutter/material.dart';

class TakeData extends StatelessWidget{

  late String title;
  late bool secret;
  TextEditingController _controller=TextEditingController();

  TakeData(String title,{bool secret=false}){
    this.title=title;
    this.secret=secret;
  }

  String getdata(){
    return this._controller.text;
  }

  @override
  Widget build(BuildContext context) {

    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: <Widget>[

        Text(this.title,style: TextStyle(fontSize: 20),),
        SizedBox(height: 5,),
        TextField(
          controller: this._controller,
          obscureText: this.secret,
          decoration: InputDecoration(border: OutlineInputBorder()),)
      ],

    );
  }

  
}
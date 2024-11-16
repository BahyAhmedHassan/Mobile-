import 'package:app/Home.dart';
import 'package:app/TakeData.dart';
import 'package:app/TheAppbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: SignIn(),
    routes: {'/home': (context) => Home(),'/sign_in': (context) => SignIn()},
    )
  );
}


class SignIn extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _SignInState();
  }
  
}

class _SignInState extends State<SignIn>{

  TakeData name=TakeData('name'),password=TakeData('password',secret: true,);
  String message='';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 198, 134, 195),

      appBar: AppBar(backgroundColor: Colors.blueGrey, title: Text('Sign In'),centerTitle: true,
      titleTextStyle: TextStyle(color: const Color.fromARGB(255, 195, 165, 163),fontSize: 25,fontWeight:FontWeight.bold ), ),

      body: SingleChildScrollView(

        padding: EdgeInsets.all(15),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          

          children: <Widget>[

            name,
            SizedBox(height: 20,),
            password,
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){

              String password_str=password.getdata(),name_str=name.getdata();

              if(password_str.isEmpty || name_str.isEmpty)
              setState(() {
                message='please enter the full requirments';
              });

              else if(password_str=='1234'){

                TheAppbar.name=name_str;

                Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false); 

              }
              else{
                setState(() {
                  message='wrong password';
                });
              }

              

            }, child: Text('Sign In')),
            SizedBox(height: 20,),
            Center( child:  Text(this.message,style: TextStyle(fontSize: 20),) )


          ],
        ),
      ),
    );
  }
  
}
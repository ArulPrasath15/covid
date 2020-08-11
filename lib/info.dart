import 'package:covid/fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
class Info extends StatefulWidget {
  

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info>{

  String l;
  Map loc={};
 

    
      fetch()async
      { 
                      Fetch instance = loc['location'];
                      await  instance.getFetch();
                      print(instance.active);
                      print(instance.confirmed);
                      print(instance.recovered);
                      print(instance.status);

              if(instance.status=='success')
              {
                      Navigator.pushReplacementNamed(context, '/loading',arguments: {

                    //  'location':instance.location,
                      'active':instance.active,
                      'confirmed':instance.confirmed,
                      'recovered':instance.recovered,
                      'location':instance.loc,
                      'conn':true,
                      



      });
              }
              else{


                 Navigator.pushReplacementNamed(context, '/loading',arguments: {

                    //  'co':instance.location,
                      'conn':false,
                      'location':instance.loc,

                      
                          });

              }
      }

  @override
  Widget build(BuildContext context) 
   {

        loc=  ModalRoute.of(context).settings.arguments;
      
        fetch();
      
     
      // Navigator.pushReplacementNamed(context, '/loading',arguments: {

      //       'location':instance.location,
      //       'active':instance.active,
      //       'confirmed':instance.confirmed,
      //       'recovered':instance.recovered,


      // });



    return Scaffold(


      backgroundColor: Colors.grey[800],





      
        appBar: GradientAppBar(

                title: Text("LOADING",
                          style: TextStyle(
                            fontSize: 25.0, 
                            fontWeight: FontWeight.bold,
                            letterSpacing: 5.0,
                            
                          ),
                  ),
               backgroundColorStart: Colors.blue,
              backgroundColorEnd: Colors.purple,
                elevation: 5.0,
                centerTitle: true,
                ),

        body: SpinKitRing(color: Colors.black),
      
    );
  }
}
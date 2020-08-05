import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:google_fonts/google_fonts.dart';




class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();

}

class _LoadingState extends State<Loading> {

  String act;
  Map data={};
  String time = "Loading";

  @override
  Widget build(BuildContext context) {

  //Navigator.pushNamed(context, '/info');
  data=ModalRoute.of(context).settings.arguments;
  
   setState(() {
     act=data['active'].toString();
   }); 

  if(data['status']=='success')
  {
        print("SUCESSSSSSSSSSS"); 
        print(data['active']); 
     


  }
  else
  {

        print("Retry");




  }
    return(
      Scaffold(


            backgroundColor: Colors.grey[800],

              appBar: GradientAppBar(

                title: Text((data['location'].toUpperCase()).toString(),
                    style:GoogleFonts.openSans(
                   // textStyle: Theme.of(context).textTheme.display1,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
        
                  ),
                  ),
               backgroundColorStart: Colors.redAccent,
              backgroundColorEnd: Colors.blue,
                elevation: 5.0,
                centerTitle: true,
                ),


          body: (data['conn'])?
          
          
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.fromLTRB(30.0, 100.0, 40.0, 10.0),
                child: Container(
                   height: 140.0,
                   width: 350.0,

                  child: Card(
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                   
                    color: Colors.black,
                      elevation: 15.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start  ,
                          children: <Widget>[


                            Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: AvatarGlow(
                                glowColor: Colors.redAccent,
                                endRadius: 30.0,
                                duration: Duration(milliseconds: 1000),
                                repeat: true,
                                showTwoGlows: true,
                                repeatPauseDuration: Duration(milliseconds: 100),
                                child: Material(
                                  elevation: 8.0,
                                  shape: CircleBorder(),
                                  child: CircleAvatar(
                                    backgroundColor:Colors.red,
                                 //   child: Image.asset('assets/covid.jpg',height: 60,),
                                    radius: 10.0,
                                  ),
                                ),
                              ),
                            ),
                          
                            Text("Active : ",
                                 style:GoogleFonts.openSans(
                                      textStyle: TextStyle(color:Colors.redAccent),
                                    // textStyle: Theme.of(context).textTheme.display1,
                                      fontSize: 25,
                                     // fontWeight: FontWeight.w700,
                                      
                          
                                    ),
                                  ),
                            Text(data['active'].toString(),
                              style: TextStyle(
                                  letterSpacing: 0,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,

                                  ),
                            ),


                          ],)  
                    ),
                ),
              ),
               Padding(
                padding: EdgeInsets.fromLTRB(30.0, 10.0, 40.0, 10.0),
                 child: Container(
                 
                   height: 140.0,
                   width: 350.0,
                   child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    
                       color: Colors.black,
                      elevation: 15.0,
                      child: 
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[


                            Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: AvatarGlow(
                                  glowColor: Colors.greenAccent,
                                  endRadius: 30.0,
                                  duration: Duration(milliseconds: 800),
                                  repeat: true,
                                  showTwoGlows: true,
                                  repeatPauseDuration: Duration(milliseconds: 100),
                                  child: Material(
                                    elevation: 8.0,
                                    shape: CircleBorder(),
                                    child: CircleAvatar(
                                      backgroundColor:Colors.greenAccent,
                                   //   child: Image.asset('assets/covid.jpg',height: 60,),
                                      radius: 10.0,
                                    ),
                                  ),
                                ),
                            ),
                                                  
                            Text("Recovered : ",
                                   style:GoogleFonts.openSans(
                                      textStyle: TextStyle(color:Colors.greenAccent),
                                    // textStyle: Theme.of(context).textTheme.display1,
                                      fontSize: 25,
                                     // fontWeight: FontWeight.w700,
                                      
                          
                                    ),
                                  ),
                            Text(data['recovered'].toString(),
                              style: TextStyle(
                                  letterSpacing: 0,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.greenAccent,

                                  ),
                               ),


                          ],)  



                   ),
                 ),
               ),
               Padding(
                padding: EdgeInsets.fromLTRB(30.0, 0.0, 40.0, 10.0),
                 child: Container(
                   height: 140.0,
                     width: 350.0,
                   child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

                     color: Colors.black,
                      elevation: 15.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                          
                            Text("Confirmed : ",
                                   style:GoogleFonts.openSans(
                                      textStyle: TextStyle(color:Colors.redAccent),
                                    // textStyle: Theme.of(context).textTheme.display1,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                      
                          
                                    ),
                                  ),
                            Text(data['confirmed'].toString(),
                              style: TextStyle(
                                  letterSpacing: 0,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent,

                                  ),
                            ),


                          ],)  
                    ),
                 ),
               )

            ],)

            : Padding(
              padding: EdgeInsets.fromLTRB(25, 250, 0, 0),
              child: Text('No Internet Connection',
                                style: TextStyle(color: Colors.red,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing:0,
                                ),
              ),
            ),






      )

    );
  }
}
import 'package:covid/fetch.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class Choose extends StatefulWidget {
  Choose({Key key}) : super(key: key);

  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {

  List<Fetch> location=[

        Fetch(loc:'Chennai'),
        Fetch(loc:'Coimbatore'),
        Fetch(loc:'Namakkal'),
        Fetch(loc:'Erode'),
        Fetch(loc:'Cuddalore'),
        Fetch(loc:'Dharmapuri'),
        Fetch(loc:'Dindigul'),
        Fetch(loc:'Kancheepuram'),
        Fetch(loc:'Kanyakumari'),
        Fetch(loc:'Karur'),
        Fetch(loc:'Madurai'),
        Fetch(loc:'Nagapattinam'),
        Fetch(loc:'Perambalur'),
        Fetch(loc:'Pudukkottai'),
        Fetch(loc:'Ramanathapuram'),
        Fetch(loc:'Salem'),
        Fetch(loc:'Sivaganga'),
        Fetch(loc:'Thanjavur'),
        Fetch(loc:'Nilgiris'),
        Fetch(loc:'Theni'),
        Fetch(loc:'Thiruvallur'),
        Fetch(loc:'Thiruvarur'),

];

 @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[800],

      appBar: GradientAppBar(

        title: Text("COVID-19 Tracker",
                 style:GoogleFonts.openSans(
                //  textStyle: TextStyle(color:Colors.grey),
                // textStyle: Theme.of(context).textTheme.display1,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                 ),
          ),
        backgroundColorStart: Colors.redAccent,
        backgroundColorEnd: Colors.blue,
        elevation: 5.0,
        
        centerTitle: true,
         ),
    
    body: Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: ListView.builder(
             itemCount: location.length,
             itemBuilder: (context,index){
               return Padding(
                 padding: EdgeInsets.fromLTRB(13.0, 5.0, 13.0, 0.0),
                   child: Card(
                    
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                     color: Colors.grey[300],
                    elevation: 5.0,
                    child:ListTile(
                      onLongPress: ()async{
                        
                       
                        Navigator.pushNamed(context,'/info' ,arguments:{
                            'location':location[index],

                        });

                      },
                      onTap: ()async{
                        
                       
                        Navigator.pushNamed(context,'/info' ,arguments:{
                            'location':location[index],
                            

                          });

                        },
                      contentPadding: EdgeInsets.fromLTRB(10, 0.0, 5.0, 0.0),
                      title:Text(location[index].loc,
                                style:GoogleFonts.openSans(
                                    //  textStyle: TextStyle(color:Colors.grey),
                                    // textStyle: Theme.of(context).textTheme.display1,
                                      fontSize: 22,
                                     // fontWeight: FontWeight.,
                                      
                          
                                    ),
                              ),
                      
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/covid.jpg'),
                      ),
                      trailing:Icon(Icons.arrow_right),

                      ),
                 
                 ),
               );

             }

        ),
     ),

    );
  }
}
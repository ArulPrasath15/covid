import 'package:http/http.dart';
import 'dart:convert';

class Fetch{

String loc;
int active;
int confirmed;
int recovered;
String status;

Fetch({this.loc});

Future<void> getFetch() async{
try{


    Response response = await get('https://api.covid19india.org/state_district_wise.json');
    Map data=jsonDecode(response.body);
    print(data);
    status='success';
    print(loc);
    active = data['Tamil Nadu']['districtData'][loc]['active'];
    confirmed = data['Tamil Nadu']['districtData'][loc]['confirmed'];
    recovered = data['Tamil Nadu']['districtData'][loc]['recovered'];
   // print(data);
  

  }
  catch (e){
         
      status='failed'; 
          
        
     }
  }

  

}


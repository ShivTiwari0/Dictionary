import 'package:flutter/material.dart';
import 'package:tri_api/my_homepage.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(size.width*0.01, size.height*0.1, 0, size.height*0.019),
              child:  Text(
                'Welcome  To', 
                style: TextStyle(
                    fontSize: size.width*0.06,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              ),
              
               Padding(
              padding: EdgeInsets.symmetric(
                   horizontal: size.width * 0.1),
              child:  Text(
                'DICTIONARY',
                style: TextStyle(
                    fontSize:size.width*0.13 ,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              ),

            const SizedBox(height: 20,),

          ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) {
           return const MyHomePage();
            
          },));}, child:const Text('Search Now', style: TextStyle(color: Colors.red),))
        ],
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fontapk/connexion.dart';
import 'inscription.dart';





Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
       title: 'apk',
       theme: ThemeData(),
       debugShowCheckedModeBanner: false,  
       home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
                Stack( 
                  alignment: Alignment.center,
                  children: const [     

                    Image(image: AssetImage('assets/image/image5.png'),height: 200.0,width: 200.0,),
                    Image(image: AssetImage('assets/image/testrefait.png'),height: 150.0,width: 150.0,),
               ], ),
              
               SizedBox(height: 150.0,),
               Text('Bienvenu sur la masterclasse',style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)),
               SizedBox(height: 10.0,),
               Text("la meileur platforme d'etude en ligne"),
               Text("inscrit toi ou connect toi"),
               SizedBox(height: 30.0,),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(  
                    onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => const Login()),);},
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.black),
                      padding: EdgeInsets.fromLTRB(50.0, 25.0, 50.0, 25.0)
                    ),
                    child: const Text('Login',style: TextStyle(color: Colors.black)),
                    ),
                  SizedBox(width: 15.0,),
                  OutlinedButton(
                      
                      onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) =>  inscription()),);},
                      style: ElevatedButton.styleFrom(
                       primary: Colors.black,
                       padding: EdgeInsets.fromLTRB(50.0, 25.0, 50.0, 25.0)
                    ),
                    child: const Text('Login ',style: TextStyle(color: Colors.white),),
                    ),
                ],
               )
            ]),
        ),
      ),
    );
  }
}




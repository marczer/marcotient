import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fontapk/service/auth.dart';

import 'acceuil.dart';
import 'inscription.dart';
import 'form.dart';




class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
      TextEditingController controllerloginemail  = TextEditingController();
    TextEditingController controllerloginpassword  = TextEditingController();


    final ButtonStyle style =  ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      fixedSize: Size(200.0, 50),textStyle: const TextStyle(fontSize: 20),
      backgroundColor: Color.fromARGB(255, 5, 53, 92));
    return Scaffold(
      // appBar: AppBar( 
      //      leading: const Icon(Icons.arrow_back),
      //      backgroundColor: Color.fromARGB(255, 7, 62, 107),
      //    ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 30.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:  [
                     SizedBox(height: 10.0,),
                     Row(
                      children: [
                          Image.asset('assets/image/testrefait.png',height: 100.0,width: 100.0,),
                      ],
                     ),
                     SizedBox(height: 5.0,),
                      Text("welcome Back",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)),
                     Center( child: Text('Inscrit et obtiens ton compte sur la platforme de Masterclass',style: TextStyle(),),), 
                     SizedBox(height: 15.0,),
                     formulair(
                      controller: controllerloginemail,
                      txt: "E-Mail",
                      styleIcon: Icons.person,
                    ),
                    SizedBox(height: 10.0,),
                    formulair(
                      controller: controllerloginpassword,
                      txt: "Mot de passe",
                      styleIcon: Icons.security,
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      
                      children: const [
                        SizedBox(width: 150.0,),
                         Text('oublier mon Mot de passe',style: TextStyle(color: Colors.blue,),)
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    OutlinedButton(
                      
                      onPressed: ()  async {
                        
                        },
                      style: ElevatedButton.styleFrom(
                       primary: Colors.black,
                       padding: EdgeInsets.fromLTRB(0, 25.0, 0, 25.0),
                    ),
                    child: const Text('Login ',style: TextStyle(color: Colors.white),),
                    ),
                    SizedBox(height: 30.0,),
                    
                    Center(child: Text("OR"),),  
                    
                    const SizedBox(height: 10.0,),
                    ElevatedButton.icon(
                      
                      onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) =>  inscription()),);},
                      style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    padding: EdgeInsets.fromLTRB(0, 25.0, 0, 25.0),
                    side: BorderSide(color: Colors.black),
                    
                    ),
                    // shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.blue),borderRadius: BorderRadius.all(Radius.circular(15.0)),),
                    label: Text('Lien vers Google',style: TextStyle(color: Colors.black),),
                    icon: Image(image: AssetImage('assets/image/image3.png'),height: 15,width: 15,),
                    ),
                    const SizedBox(height: 15.0,),
                    Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have an account?"),
                                  SizedBox(width: 10.0,),
                                  GestureDetector(
                                    onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => inscription(),)); },
                                    child: Text('Sign up',style: TextStyle(color: Colors.blue),),
                                  )
                                ],
                                // mainAxisAlignment: MainAxisAlignment.center,
                                // children: const [
                                //   Text("Don't have an account?"),
                                //   SizedBox(width: 10.0,),
                                  
                                //   Text('Sign up',style: TextStyle(color: Color.fromARGB(255, 5, 53, 92)),)],
                              )
                    
                    
              ],)),
            
        ),
        
      ),
    );
     // ignore: dead_code
          _handleLog() {
        if(controllerloginemail.text != "" ){
          if(controllerloginpassword.text != ""){
            FirebaseHelper()
               .handleSignIn(controllerloginemail.text, controllerloginpassword.text)
               .then((user) => {
                print(user)
                // Navigator.push(context, MaterialPageRoute(builder: (context) => null ))
               }).catchError((error){print(error);});
          } else {
            print('entrer votre mot de passe');
          }
        } else {
          print('entrer votre E-mail');
        }
      }
  }
}







// void main() {
//   runApp(const Login());
// }


// class Login extends StatelessWidget {
//   const Login({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: Column(
//             children: [
//               Container(
//                 child: Column(
                  
//                   children: const [
                    
//                     Image(image: AssetImage('assets/image/testrefait.png'),height: 200.0,width: 200.0,),
//                     Text("welcome Back",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)),
//                     Text("connecter vous pour pourvoir avoir acces au cours")
//                   ],),
                  
               
//               ),
//               TextFormField(
//                               // ignore: prefer_const_constructors
//                 decoration: InputDecoration(
//                 labelText: 'Confirme mote de passe',
//                 border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
//                 prefix: Image(image: AssetImage('assets/image/testrefait.png'),height: 20.0,width: 20.0,),
//                               ),
//                             ),
//               SizedBox(height: 20.0,),
//               TextFormField(
//                               // ignore: prefer_const_constructors
//                 decoration: InputDecoration(
//                 labelText: 'Confirme mote de passe',
//                 border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
//                 prefix: Image(image: AssetImage('assets/image/testrefait.png'),height: 20.0,width: 20.0,),
//                               ),
//                             ),
//             ],

//           ),
//         ),
//       ),
//     );
//   }
// }
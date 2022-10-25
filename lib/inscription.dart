import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fontapk/service/auth.dart';

import 'main.dart';
import 'form.dart';


class inscription extends StatefulWidget {
  const inscription({super.key});

  @override
  State<inscription> createState() => _inscriptionState();
}

class _inscriptionState extends State<inscription> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  void validation (){
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()){
      print("ok");
    } else {
      print("no");
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controllernom  = TextEditingController();
    TextEditingController controlleremail  = TextEditingController();
    TextEditingController controllerphone  = TextEditingController();
    TextEditingController controllerpassword  = TextEditingController();
    

    final ButtonStyle style =  ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),fixedSize: Size(200.0, 50),textStyle: const TextStyle(fontSize: 20),backgroundColor: Color.fromARGB(255, 5, 53, 92));
    return Scaffold(
      key: _formKey,
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
                     Text('Bienvenu sur la masterclasse',style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)),
                     Center( child: Text('Inscrit et obtiens ton compte sur la platforme de Masterclass',style: TextStyle(),),), 
                     SizedBox(height: 10.0,),
                     formulair(
                      // validator: (value) => value!.isEmpty?"vous n'avez rien ecrit":null,
                      controller: controllernom,
                      txt: "Nom",
                      styleIcon: Icons.person,
                    ),
                    SizedBox(height: 10.0,),
                    formulair(
                      // validator: (value) => value!.isEmpty?"vous n'avez rien ecrit":null,
                      controller: controlleremail,
                      txt: "E-Mail",
                      styleIcon: Icons.mail,
                    ),
                    SizedBox(height: 10.0,),
                    formulair(
                      // validator: (value) => value!.isEmpty?"vous n'avez rien ecrit":null,
                      controller: controllerphone,
                      txt: "Phone",
                      styleIcon: Icons.numbers,
                    ),
                    SizedBox(height: 10.0,),
                    formulair(
                      // validator: (value) => value!.isEmpty?"vous n'avez rien ecrit":null,
                      controller: controllerpassword,
                      txt: "Mot de passe",
                      styleIcon: Icons.security,
                    ),
                    SizedBox(height: 10.0,),
                    OutlinedButton(
                      onPressed: () {

                        // validation();
                        // final nom = controllernom.text;
                        // final email = controlleremail.text;
                        // final phone = controllerphone.text;
                        // final password = controllerpassword.text;
                        // create(nom: nom, email: email, phone: phone, password: password);

                        // Navigator.push(context,MaterialPageRoute(builder: (context) => const inscription()),);
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
                    Container(
                       child: ElevatedButton.icon(
                      
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
                    ),
                    const SizedBox(height: 10.0,),
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
      _handleLog(){
    if(controllernom.text != ""){
      if(controlleremail.text != ""){
        if(controllerphone.text != ""){
          if(controllerpassword.text != ""){
            FirebaseHelper().create(controlleremail.text, controllerpassword.text, controllerphone.text, controllernom.text)
            .then((user) => print(user))..catchError((error){print(error);});
          }
        }
      }
    }
  }
  }

}

// Future create({
//   required String nom,
//   required String email,
//   required String phone,
//   required String password,
//    }) async {

//     final doc = FirebaseFirestore.instance.collection('doczer').doc();
//     final user = User(nom: nom, email: email, phone: phone, password: password , id: doc.id);
//     final json = user.tojson();
//     await doc.set(json);
//    }

// class User {
//   String id, nom , email , phone, password;

//   User (
//     {
//       this.id = '',
//       required this.nom ,
//       required this.email,
//       required this.phone,
//       required this.password,
//     }
//   );
//   Map<String, dynamic> tojson() => 
//   {'id': id, 'nom': nom, 'email': email, 'password': password};
// } 

// class inscription extends StatelessWidget {
  
//   late String email, password;
//   final Key = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     );
//   }
// }
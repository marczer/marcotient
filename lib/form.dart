import 'package:flutter/material.dart';


class formulair extends StatelessWidget {

  String? txt;
  IconData? styleIcon;
  TextEditingController controller = TextEditingController();
  String? Function(String?)? validator;

  formulair({ super.key,
              this.txt,
              this.styleIcon,
              required this.controller,
              this.validator,
              });
   @override
   Widget build(BuildContext context) {
     return TextFormField(
                 validator: validator,
               // ignore: prefer_const_constructors
                 controller: controller,
                 decoration: InputDecoration(
                 labelText: txt,
                 border: const OutlineInputBorder(),
                 prefixIcon: Icon(styleIcon),
               ),
             );
   }
 }
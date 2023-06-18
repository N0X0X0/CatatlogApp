import 'package:flutter/material.dart';
import 'package:sample/utils/routes.dart';
 class loginpage extends StatefulWidget {
   const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
   String name = "";
   bool changebutt = false;

   final _formkey=GlobalKey<FormState>();
   movetohome(BuildContext context) async{
     if(_formkey.currentState!.validate()) {
       setState(() {
         changebutt = true;
       });
       await Future.delayed(Duration(seconds: 1));
       await Navigator.pushNamed(context, MyRoutes.homeroutes);
       setState(() {
         changebutt = false;
       });
     }
   }

   @override
   Widget build(BuildContext context) {
     return Material(
       color: Colors.white,
       child: SingleChildScrollView(
         child: Form(
           key: _formkey,
           child: Column(
             children: [
               Image.asset('assets/images/assimg.png',
                 fit: BoxFit.cover,
               ),
               SizedBox(
                 height: 20.0,
               ),
               Text(
                 "WELCOME $name",
                 style: TextStyle(
                   fontSize: 30,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               SizedBox(
                 height: 20.0,
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
                 child: Column(children: [
                   TextFormField(
                     decoration: InputDecoration(
                       hintText: "Enter username",
                       labelText: "Username",

                       // border: OutlineInputBorder(
                       //   borderRadius: BorderRadius.circular(20)
                       // )
                     ),
                     validator: (value){
                       if(value!.isEmpty){
                         return "username cannot be empty";
                       }
                       return null;
                     },
                     onChanged: (value){
                       name= value;
                       setState(() {

                       });
                     },
                   ),
                   TextFormField(
                     obscureText: true,
                     decoration: InputDecoration(
                       hintText: "Enter password",
                       labelText: "password",
                         // border: OutlineInputBorder(
                         //     borderRadius: BorderRadius.circular(20)
                         // )
                     ),
                     validator: (value){
                       if(value!.isEmpty){
                         return "password cannot be empty";
                       } else if(value.length < 6) {
                         return "password length should be atlest 6";
                       }

                       return null;
                     },
                   ),
                   SizedBox(
                     height: 40.0,
                   ),
                   Material(
                     color: Colors.deepPurple,
                     borderRadius: BorderRadius.circular(changebutt ? 50:8),
                     child: InkWell(
                       onTap: () => movetohome(context),
                       child: AnimatedContainer(
                         duration: Duration(seconds: 1),
                         width: changebutt ? 50 : 150,
                         height: 50,
                         alignment: Alignment.center,
                         child: changebutt
                             ? Icon(Icons.done,
                           color: Colors.white,)
                             : Text (
                             "login",
                             style: TextStyle(
                               color: Colors.white,
                               fontWeight: FontWeight.bold,
                               fontSize: 19,
                             )
                         ),
                         // decoration: BoxDecoration(
                         //   color: Colors.deepPurple,
                           // shape:  changebutt
                           //     ? BoxShape.circle
                           //     : BoxShape.rectangle,

                         ),
                       ),
                     ),

                   // ElevatedButton(
                   //     onPressed: () {
                   //       Navigator.pushNamed(context, MyRoutes.homeroutes);
                   //     },
                   //     child: Text("login"),
                   //   style: TextButton.styleFrom(minimumSize: Size(140, 40)),
                   // )

                 ],
                 ),
               )
             ],
           ),
         ),
       )
     );
   }
}

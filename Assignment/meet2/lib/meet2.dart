// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Home extends StatelessWidget {
//   const Home({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: Scaffold(
//       appBar: AppBar(
//         leading: Icon(Icons.menu),
//         title: Text("Mobile Practicum"),
//         // actions: [
//         //
//         // ],
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [
//               Text('Syafira'),
//               Text('Widiyanti'),
//               TextButton(onPressed: (){}, child: Text("Text Button")),
//               OutlinedButton(onPressed: (){}, child: Text("Outlined Button")),
//               ElevatedButton(onPressed: (){}, child: Text("Elevated Button")),
//               TextField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     hintText: "This is textField"
//                 ),),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Column(
//                     children: [
//                       Icon(Icons.abc),
//                       Icon(Icons.abc),
//                       Icon(Icons.abc),
//                       Icon(Icons.abc),
//                     ],
//                   ),
//                   Icon(Icons.abc),
//                   Icon(Icons.abc),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Icon(Icons.abc),
//                       Icon(Icons.abc),
//                     ],
//                   )
//                 ],
//               ),
//               Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Icon(Icons.phone),
//                         Text("CALL")
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Icon(Icons.phone),
//                         Text("CALL")
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Icon(Icons.phone),
//                         Text("CALL")
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                     hintText: "This is textFormField",
//                     labelText: "1. One",
//                     icon: Icon(Icons.person)
//                 ),
//               ),
//               Image.asset('images/cat_negative.jpeg'),
//               Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTZSVDE0N60fHDIskxMKfO0zysuIH705BMoXhjvloTBg&s')
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }
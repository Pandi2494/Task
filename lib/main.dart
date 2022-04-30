import 'package:flutter/material.dart';
import 'package:task/screen1.dart';
import 'package:task/screen2.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Task()));
}

class Task extends StatelessWidget {
  const Task({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Screen1()),
            );
          },
          color: Colors.blue,
          child: const Text('Screen 1'),
        ),
        const SizedBox(
          height: 20,
        ),
        MaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          color: Colors.blue,
          child: const Text('Screen 2'),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late double _rating;

//   int _ratingBarMode = 1;
//   double _initialRating = 2.0;
//   bool _isVertical = false;

//   IconData? _selectedIcon;

//   @override
//   void initState() {
//     super.initState();
//     // _rating = _initialRating;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Builder(
//         builder: (context) => Scaffold(
//           body: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 const SizedBox(
//                   height: 40.0,
//                 ),
//                 const SizedBox(height: 20.0),
//                 Text(
//                   'Rating: $_rating',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_train_departures/providers/septa_provider.dart';
import 'package:flutter_train_departures/screens/departures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SeptaProvider(),
      child: MaterialApp(
          title: "Train Departures",
          theme: ThemeData(
            accentColor: Colors.deepOrangeAccent,
            brightness: Brightness.dark,
            textTheme: TextTheme(
              body1: GoogleFonts.orbitron(
                textStyle: TextStyle(
                  color: Colors.cyan,
                  fontSize: 18,
                ),
              ),
              body2: GoogleFonts.openSans(
                textStyle: TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontSize: 12,
                ),
              ),
              title: GoogleFonts.orbitron(
                textStyle: TextStyle(
                  color: Colors.cyan,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          home: Departures()),
    );
  }
}

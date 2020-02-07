import 'package:flutter/material.dart';
import 'package:flutter_train_departures/providers/septa_provider.dart';
import 'package:flutter_train_departures/screens/departures.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SeptaProvider(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Departures()),
    );
  }
}

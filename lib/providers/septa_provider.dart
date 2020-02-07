import 'package:flutter/material.dart';
import 'package:flutter_train_departures/blocs/septa_bloc.dart';

class SeptaProvider with ChangeNotifier {
  SeptaBloc _bloc;

  SeptaProvider() {
    _bloc = SeptaBloc();
  }

  SeptaBloc get bloc => _bloc;
}

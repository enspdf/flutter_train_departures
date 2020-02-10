import 'package:flutter_train_departures/models/train.dart';
import 'package:flutter_train_departures/services/septa_service.dart';
import 'package:rxdart/subjects.dart';

class SeptaBloc {
  final _trains = BehaviorSubject<List<Train>>();
  final _station = BehaviorSubject<String>();
  final _count = BehaviorSubject<int>();
  final _directions = BehaviorSubject<List<String>>();
  final _septaService = SeptaService();

  SeptaBloc() {
    loadSettings();

    station.listen((station) async {
      changeTrains(await _septaService.loadStationData(station));
    });
  }

  Stream<List<Train>> get trains => _trains.stream.map((trainList) => trainList
      .where((train) => _directions.value.contains(train.direction))
      .take(_count.value)
      .toList());
  Stream<String> get station => _station.stream;
  Stream<int> get count => _count.stream;
  Stream<List<String>> get directions => _directions.stream;

  Function(List<Train>) get changeTrains => _trains.sink.add;
  Function(String) get changeStation => _station.sink.add;
  Function(int) get changeCount => _count.sink.add;
  Function(List<String>) get changeDirections => _directions.sink.add;

  dispose() {
    _trains.close();
    _station.close();
    _count.close();
    _directions.close();
  }

  void loadSettings() {
    changeCount(10);
    changeDirections(["N", "S"]);
    changeStation("Suburban Station");
  }
}

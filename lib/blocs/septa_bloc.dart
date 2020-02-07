import 'package:flutter_train_departures/models/train.dart';
import 'package:rxdart/subjects.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SeptaBloc {
  final _trains = BehaviorSubject<List<Train>>();

  SeptaBloc() {
    loadStationData("Suburban Station");
  }

  Stream<List<Train>> get trains => _trains.stream;

  Function(List<Train>) get changeTrains => _trains.sink.add;

  dispose() {
    _trains.close();
  }

  void loadStationData(String station) async {
    var response =
        await http.get('http://www3.septa.org/hackathon/Arrivals/$station/10/');

    var json = convert.jsonDecode('{ "Departures" : ' +
        response.body.substring(response.body.indexOf('[')));

    var trains = List<Train>();

    try {
      var north = json["Departures"][0]["Northbound"];
      var south = json["Departures"][0]["Southbound"];

      north.forEach((train) => trains.add(Train.fromJson(train)));
      south.forEach((train) => trains.add(Train.fromJson(train)));
    } catch (error) {
      print(error);
    }

    trains.sort((a, b) => a.departTime.compareTo(b.departTime));

    changeTrains(trains);
  }
}

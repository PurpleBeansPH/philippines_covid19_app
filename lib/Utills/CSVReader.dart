import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class CSVReader extends StatefulWidget {
  @override
  _CSVReaderState createState() => _CSVReaderState();
}

class _CSVReaderState extends State<CSVReader> {
  List<List<dynamic>> data = [];
  var removalTypeMap = Map();
  var regionsMap = Map();
  var citiesMap = Map();
  var citiesFilterByRegionsMap = Map();

  void filterRemovalType() {
    removalTypeMap.clear();
    for(var i = 1; i < data.length; i++) {
      if(!removalTypeMap.containsKey(data[i][7])) {
        removalTypeMap[data[i][7]] = 1;
      } else {
        removalTypeMap[data[i][7]] +=1;
      }
    }
  }

  void filterRegions() {
    regionsMap.clear();
    for(var i = 1; i < data.length; i++) {
      if(!regionsMap.containsKey(data[i][10])) {
        regionsMap[data[i][10]] = 1;
      } else {
        regionsMap[data[i][10]] +=1;
      }
    }
  }

  void filterCities() {
    citiesMap.clear();
    for(var i = 1; i < data.length; i++) {
      if(!citiesMap.containsKey(data[i][11])) {
        citiesMap[data[i][11]] = 1;
      } else {
        citiesMap[data[i][11]] +=1;
      }
    }
  }

  void filterCitiesByRegions() {
    citiesFilterByRegionsMap.clear();
    for(var i = 1; i < data.length; i++) {
      if(data[i][10].toString() == "NCR") {
        if(!citiesFilterByRegionsMap.containsKey(data[i][11])) {
          citiesFilterByRegionsMap[data[i][11]] = 1;
        } else {
          citiesFilterByRegionsMap[data[i][11]] +=1;
        }
      }
    }
  }

  loadAssets() async {
    final mydata = await rootBundle.loadString("assets/CaseInformation.csv");
    List<List<dynamic>> csvTable = CsvToListConverter().convert(mydata);
    data = csvTable;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () async {
          await loadAssets();
          filterRemovalType();
          filterRegions();
          filterCities();
          filterCitiesByRegions();
          print("total cases: " + data.length.toString());
          print(removalTypeMap);
          print(regionsMap);
          print(citiesMap);
          print(citiesFilterByRegionsMap);
        },
      ),
    );
  }
}
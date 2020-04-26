import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class CSVReader {
  List<List<dynamic>> data = [];

  CSVReader() {
    _loadAssets();
  }

  _loadAssets() async {
    final myData = await rootBundle.loadString("assets/CaseInformation.csv");
    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);
    data = csvTable;
  }

  Future getCountTotalRecovered() async{
    var removalTypeMap = Map();
    if(data.isEmpty){
      await new Future.delayed(const Duration(seconds : 5));
    }
    for(var i = 1; i < data.length; i++) {
      if(!removalTypeMap.containsKey(data[i][7])) {
        removalTypeMap[data[i][7]] = 1;
      } else {
        removalTypeMap[data[i][7]] +=1;
      }
    }
    return removalTypeMap["Recovered"];
  }

  Future getCountTotalDied() async{
    var removalTypeMap = Map();
    if(data.isEmpty){
      await new Future.delayed(const Duration(seconds : 5));
    }
    for(var i = 1; i < data.length; i++) {
      if(!removalTypeMap.containsKey(data[i][7])) {
        removalTypeMap[data[i][7]] = 1;
      } else {
        removalTypeMap[data[i][7]] +=1;
      }
    }
    return removalTypeMap["Died"];
  }

  Future getTotalCases() async {
    if(data.isEmpty){
      await new Future.delayed(const Duration(seconds : 5));
    }
    return data.length - 1;
  }

  Future getTotalAdmitted() async {
    if(data.isEmpty){
      await new Future.delayed(const Duration(seconds : 5));
    }
    var admittedMap = Map();
    for(var i = 1; i < data.length; i++) {
      if(!admittedMap.containsKey(data[i][9])) {
        admittedMap[data[i][9]] = 1;
      } else {
        admittedMap[data[i][9]] +=1;
      }
    }
    print(admittedMap);
    return admittedMap["Yes"];
  }

  Future getRegions() async{
    var regionsMap = Map();
    for(var i = 1; i < data.length; i++) {
      if(!regionsMap.containsKey(data[i][10])) {
        regionsMap[data[i][10]] = 1;
      } else {
        regionsMap[data[i][10]] +=1;
      }
    }
    return regionsMap;
  }

  Future getCities() async{
    var citiesMap = Map();
    for(var i = 1; i < data.length; i++) {
      if(!citiesMap.containsKey(data[i][11])) {
        citiesMap[data[i][11]] = 1;
      } else {
        citiesMap[data[i][11]] +=1;
      }
    }
    return citiesMap;
  }

  Future filterCitiesByRegions(String region) async{
    var citiesFilterByRegionsMap = Map();
    for(var i = 1; i < data.length; i++) {
      if(data[i][10].toString() == region) {
        if(!citiesFilterByRegionsMap.containsKey(data[i][11])) {
          citiesFilterByRegionsMap[data[i][11]] = 1;
        } else {
          citiesFilterByRegionsMap[data[i][11]] +=1;
        }
      }
    }
    return citiesFilterByRegionsMap;
  }

}
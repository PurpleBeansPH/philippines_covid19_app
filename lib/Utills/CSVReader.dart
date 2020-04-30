import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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
    return admittedMap["Yes"];
  }

  Future getRegions() async{
    if(data.isEmpty){
      await new Future.delayed(const Duration(seconds : 5));
    }
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
    if(data.isEmpty){
      await new Future.delayed(const Duration(seconds : 5));
    }
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
    if(data.isEmpty){
      await new Future.delayed(const Duration(seconds : 5));
    }
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

  Future getDateOfCases() async{
    if(data.isEmpty){
      await new Future.delayed(const Duration(seconds : 5));
    }
    var dateOfCasesMap = Map();
    for(var i = 1; i < data.length; i++) {
      if(!dateOfCasesMap.containsKey(data[i][4])) {
        dateOfCasesMap[data[i][4]] = 1;
      } else {
        dateOfCasesMap[data[i][4]] +=1;
      }
    }
    var dateList = [];
    List<DateTime> caseDateList = [];
    var format = new DateFormat("dd-MMM-yy");
    dateList = dateOfCasesMap.keys.toList();
    for (int i = 0; i < dateList.length; i++) {
      caseDateList.add(format.parse(dateList[i]));
    }
    caseDateList.sort((a,b) => a.compareTo(b));

    var formatter = new DateFormat('dd-MMM-yyyy');
    List<String> dateSortList = [];
    for (int f = 0; f < dateList.length; f++) {
      dateSortList.add(formatter.format(caseDateList[f]));
    }

    return dateOfCasesMap;
  }

}
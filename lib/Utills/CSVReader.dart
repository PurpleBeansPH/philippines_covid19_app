import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CSVReader {
  List<List<dynamic>> caseInformationData = [];
  List<List<dynamic>> testingAggregatesData = [];

  CSVReader() {
    _loadAssets();
  }

  _loadAssets() async {
    final myCaseInformationData = await rootBundle.loadString("assets/CaseInformation.csv");
    List<List<dynamic>> csvTable1 = CsvToListConverter().convert(myCaseInformationData);
    final myTestingAggregatesData = await rootBundle.loadString("assets/TestingAggregates.csv");
    List<List<dynamic>> csvTable2 = CsvToListConverter().convert(myTestingAggregatesData);
    caseInformationData = csvTable1;
    print(csvTable1);
    testingAggregatesData = csvTable2;
    print(csvTable2);
  }

  Future getCountTotalRecovered() async{
    var removalTypeMap = Map();
    if(caseInformationData.isEmpty){
      await new Future.delayed(const Duration(seconds : 10));
    }
    for(var i = 1; i < caseInformationData.length; i++) {
      if(!removalTypeMap.containsKey(caseInformationData[i][7])) {
        removalTypeMap[caseInformationData[i][7]] = 1;
      } else {
        removalTypeMap[caseInformationData[i][7]] +=1;
      }
    }
    return removalTypeMap["Recovered"];
  }

  Future getCountTotalDied() async{
    var removalTypeMap = Map();
    if(caseInformationData.isEmpty){
      await new Future.delayed(const Duration(seconds : 10));
    }
    for(var i = 1; i < caseInformationData.length; i++) {
      if(!removalTypeMap.containsKey(caseInformationData[i][7])) {
        removalTypeMap[caseInformationData[i][7]] = 1;
      } else {
        removalTypeMap[caseInformationData[i][7]] +=1;
      }
    }
    return removalTypeMap["Died"];
  }

  Future getTotalCases() async {
    if(caseInformationData.isEmpty){
      await new Future.delayed(const Duration(seconds : 10));
    }
    var admittedMap = Map();
    for(var i = 1; i < caseInformationData.length; i++) {
      if(!admittedMap.containsKey(caseInformationData[i][9])) {
        admittedMap[caseInformationData[i][9]] = 1;
      } else {
        admittedMap[caseInformationData[i][9]] +=1;
      }
    }

    return caseInformationData.length - 1;
  }

  Future getTotalAdmitted() async {
    if(caseInformationData.isEmpty){
      await new Future.delayed(const Duration(seconds : 10));
    }
    var admittedMap = Map();
    for(var i = 1; i < caseInformationData.length; i++) {
      if(!admittedMap.containsKey(caseInformationData[i][9])) {
        admittedMap[caseInformationData[i][9]] = 1;
      } else {
        admittedMap[caseInformationData[i][9]] +=1;
      }
    }
    return admittedMap["Yes"];
  }

  Future getRegions() async{
    if(caseInformationData.isEmpty){
      await new Future.delayed(const Duration(seconds : 10));
    }
    var regionsMap = Map();
    for(var i = 1; i < caseInformationData.length; i++) {
      if(!regionsMap.containsKey(caseInformationData[i][10])) {
        regionsMap[caseInformationData[i][10]] = 1;
      } else {
        regionsMap[caseInformationData[i][10]] +=1;
      }
    }
    return regionsMap;
  }

  Future getCities() async{
    if(caseInformationData.isEmpty){
      await new Future.delayed(const Duration(seconds : 10));
    }
    var citiesMap = Map();
    for(var i = 1; i < caseInformationData.length; i++) {
      if(!citiesMap.containsKey(caseInformationData[i][11])) {
        citiesMap[caseInformationData[i][11]] = 1;
      } else {
        citiesMap[caseInformationData[i][11]] +=1;
      }
    }
    return citiesMap;
  }

  Future filterCitiesByRegions(String region) async{
    if(caseInformationData.isEmpty){
      await new Future.delayed(const Duration(seconds : 10));
    }
    var citiesFilterByRegionsMap = Map();
    for(var i = 1; i < caseInformationData.length; i++) {
      if(caseInformationData[i][10].toString() == region) {
        if(!citiesFilterByRegionsMap.containsKey(caseInformationData[i][11])) {
          citiesFilterByRegionsMap[caseInformationData[i][11]] = 1;
        } else {
          citiesFilterByRegionsMap[caseInformationData[i][11]] +=1;
        }
      }
    }
    return citiesFilterByRegionsMap;
  }

  Future getDateOfCases() async{
    if(caseInformationData.isEmpty){
      await new Future.delayed(const Duration(seconds : 10));
    }
    var dateOfCasesMap = Map();
    for(var i = 1; i < caseInformationData.length; i++) {
      if(!dateOfCasesMap.containsKey(caseInformationData[i][4])) {
        dateOfCasesMap[caseInformationData[i][4]] = 1;
      } else {
        dateOfCasesMap[caseInformationData[i][4]] +=1;
      }
    }
    return dateOfCasesMap;
  }
}
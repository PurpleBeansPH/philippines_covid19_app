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

  loadAssets() async {
    final mydata = await rootBundle.loadString("assets/Book1.csv");
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
          print(data);
        },
      ),
      body: Table(
        children: data.map((item) {
          return TableRow(
            children: item.map((row) {
              return Text(row.toString());
            }).toList()
          );
        }).toList(),
      ),
    );
  }
}
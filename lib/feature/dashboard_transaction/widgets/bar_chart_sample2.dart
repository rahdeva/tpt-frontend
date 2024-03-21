// Define data structure for a bar group
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DataItem {
  int x;
  double y1;
  double y2;
  double y3;
  DataItem(
      {required this.x, required this.y1, required this.y2, required this.y3});
}

class BarChart2 extends StatelessWidget {
  BarChart2({Key? key}) : super(key: key);

  // Generate dummy data to feed the chart
  // final List<DataItem> _myData = List.generate(
  //     30,
  //     (index) => DataItem(
  //           x: index,
  //           y1: Random().nextInt(20) + Random().nextDouble(),
  //           y2: Random().nextInt(20) + Random().nextDouble(),
  //           y3: Random().nextInt(20) + Random().nextDouble(),
  //         ));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: BarChart(
          BarChartData(
            borderData: FlBorderData(
              border: const Border(
                top: BorderSide.none,
                right: BorderSide.none,
                left: BorderSide(width: 1),
                bottom: BorderSide(width: 1),
              )
            ),
            groupsSpace: 10,
            barGroups: [
                BarChartGroupData(
                  x: 1, barRods: [
                    BarChartRodData(
                      fromY: 0, 
                      toY: 10, 
                      width: 15, 
                      color: Colors.amber
                    ),
                  ]
                ),
                BarChartGroupData(
                  x: 2, barRods: [
                    BarChartRodData(
                      fromY: 0, 
                      toY: 10, 
                      width: 15, 
                      color: Colors.amber
                    ),
                  ]
                ),
                BarChartGroupData(
                  x: 3, barRods: [
                    BarChartRodData(
                      fromY: 0, 
                      toY: 15, 
                      width: 15, 
                      color: Colors.amber
                    ),
                  ]
                ),
                BarChartGroupData(
                  x: 4, barRods: [
                    BarChartRodData(
                      fromY: 0, 
                      toY: 10, 
                      width: 15, 
                      color: Colors.amber
                    ),
                  ]
                ),
                BarChartGroupData(
                  x: 5, barRods: [
                    BarChartRodData(
                      fromY: 0, 
                      toY: 11, 
                      width: 15, 
                      color: Colors.amber
                    ),
                  ]
                ),
                BarChartGroupData(
                  x: 6, barRods: [
                    BarChartRodData(
                      fromY: 0, 
                      toY: 10, 
                      width: 15, 
                      color: Colors.amber
                    ),
                  ]
                ),
                BarChartGroupData(
                  x: 7, barRods: [
                    BarChartRodData(
                      fromY: 0, 
                      toY: 10, 
                      width: 15, 
                      color: Colors.amber
                    ),
                  ]
                ),
                BarChartGroupData(
                  x: 8, barRods: [
                    BarChartRodData(
                      fromY: 0, 
                      toY: 10, 
                      width: 15, 
                      color: Colors.amber
                    ),
                  ]
                ),
            ]
          )
        ),
      ),
    );
  }
}
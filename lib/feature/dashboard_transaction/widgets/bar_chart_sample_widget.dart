import 'dart:math';


import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tpt_frontend/resources/resources.dart';

class BarChartSample8 extends StatefulWidget {
  BarChartSample8({super.key});

  final Color barBackgroundColor = AppColors.red.withOpacity(0.3);
  final Color barColor = AppColors.red;

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample8> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Penjualan',
                  style: TextStyle(
                    color: widget.barColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Expanded(
              child: BarChart(
                BarChartData(
                  // maxY: 100,
                  // groupsSpace: 10,
                  barTouchData: BarTouchData(
                    enabled: true,
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: getTitles,
                        reservedSize: 38,
                      ),
                    ),
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        reservedSize: 50,
                        showTitles: true,
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    border: const Border(
                      top: BorderSide.none,
                      right: BorderSide.none,
                      left: BorderSide(width: 1),
                      bottom: BorderSide(width: 1),
                    )
                  ),
                  barGroups: List.generate(
                    7,
                    (i) => makeGroupData(
                      i,
                      Random().nextInt(500).toDouble(),
                    ),
                  ),
                  gridData: const FlGridData(show: false),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    List<String> days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    Widget text = Text(
      days[value.toInt()],
      style: style,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }
  
  BarChartGroupData makeGroupData(
    int x,
    double y,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: y,
          color: widget.barColor,
          borderRadius: BorderRadius.zero,
          width: 24,
          borderSide: BorderSide(color: widget.barColor, width: 2.0),
        ),
      ],
    );
  }
}
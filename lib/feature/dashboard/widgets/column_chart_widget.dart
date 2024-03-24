import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tpt_frontend/resources/resources.dart';

class ColumnChartWidget extends StatelessWidget {
  const ColumnChartWidget({
    super.key,
    required this.title, 
    required this.length, 
    required this.label, 
    required this.value,
  });

  final int length;
  final String title;
  final List<String> label;
  final List<int> value;

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
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.primary,
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
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: AppColors.white,
                      tooltipBorder: const BorderSide(color: AppColors.background1)
                    )
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
                    length,
                    (i) => makeGroupData(i, value[i].toDouble()), // Menggunakan data yang telah diberikan
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
      color: AppColors.primary,
      fontWeight: FontWeight.bold,
      fontSize: 14,
      
    );
    // List<String> label = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    Widget text = Text(
      label[value.toInt()],
      style: style,
      maxLines: 3,
      softWrap: true,
    );

    // return SideTitleWidget(
    //   axisSide: meta.axisSide,
    //   child: Container(
    //     width: 20,
    //     child: text
    //   ),
    // );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      angle: 12,
      child:  text,
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
          color: AppColors.primary,
          borderRadius: BorderRadius.zero,
          width: 24,
          borderSide: const BorderSide(
            color: AppColors.primary, 
            width: 2.0
          ),
        ),
      ],
    );
  }
}
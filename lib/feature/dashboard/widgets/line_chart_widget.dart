import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tpt_frontend/resources/resources.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({
    Key? key,
    required this.title,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String title;
  final List<String> label;
  final List<int> value;

  @override
  Widget build(BuildContext context) {
    List<FlSpot> spots = [];

    for (int i = 0; i < label.length; i++) {
      spots.add(FlSpot(i.toDouble(), value[i].toDouble()));
    }

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
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots.map((point) => FlSpot(point.x, point.y)).toList(),
                      isCurved: false,
                      dotData: const FlDotData(
                        show: false,
                      ),
                    ),
                  ],
                  borderData: FlBorderData(
                    border: const Border(bottom: BorderSide(), left: BorderSide())
                  ),
                  gridData: const FlGridData(show: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles:getTitles
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
                  lineTouchData: LineTouchData(
                    enabled: true,
                    touchTooltipData: LineTouchTooltipData(
                      tooltipBgColor: Colors.blue,
                      tooltipRoundedRadius: 20.0,
                      showOnTopOfTheChartBoxArea: true,
                      fitInsideHorizontally: true,
                      tooltipMargin: 0,
                      getTooltipItems: (touchedSpots) {
                        return touchedSpots.map(
                          (LineBarSpot touchedSpot) {
                            const textStyle = TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            );
                            return LineTooltipItem(
                              value[touchedSpot.spotIndex].toStringAsFixed(2),
                              textStyle,
                            );
                          },
                        ).toList();
                      },
                    ),
                    getTouchedSpotIndicator:
                        (LineChartBarData barData, List<int> indicators) {
                      return indicators.map(
                        (int index) {
                          const line = FlLine(
                              color: Colors.grey,
                              strokeWidth: 1,
                              dashArray: [2, 4]);
                          return const TouchedSpotIndicatorData(
                            line,
                            FlDotData(show: false),
                          );
                        },
                      ).toList();
                    },
                    getTouchLineEnd: (_, __) => double.infinity
                  ),
                ),
              ),
            ),
          ]
        )
      )
    );
  }

  // Widget getTitles(double value, TitleMeta meta) {
  // const style = TextStyle(
  //   color: AppColors.primary,
  //   fontWeight: FontWeight.bold,
  //   fontSize: 14,
  // );

  // // Ensure value is within the range of labels
  // int index = value.toInt();
  // if (index >= 0 && index < label.length) {
  //     Widget text = Text(
  //       label[index],
  //       style: style,
  //     );
  //     return SideTitleWidget(
  //       axisSide: meta.axisSide,
  //       child: text,
  //     );
  //   } else {
  //     return Container(); // Return an empty container if the index is out of range
  //   }
  // }

  SideTitles get getTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      int index = value.toInt();
      if (index >= 0 && index < label.length) {
        return Text(label[index]);
      }
      return const Text('');
    },
  );
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:todo_list_with_dismissible/app/pages/todo_list_simple/controller/todo_list_simple_controller.dart';

class ChartSimpleWidget extends StatefulWidget {
  
  final TodoListSimpleController controller;
  
  const ChartSimpleWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<ChartSimpleWidget> createState() => _ChartSimpleWidgetState();
}

class _ChartSimpleWidgetState extends State<ChartSimpleWidget> {

  int touchedGroupIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: const Color(0xff2c4260),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text(
                "Nome do Gráfico",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: 300,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Observer(
                      builder: (context) {

                        if(widget.controller.approvers.isEmpty) {
                          return const Center(
                            child: Text("Não há dados para montar o gráfico"),
                          );
                        }

                        return BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.start,
                            maxY: widget.controller.maxY,
                            groupsSpace: 20,
                            barTouchData: BarTouchData(
                              touchTooltipData: BarTouchTooltipData(
                                tooltipBgColor: Colors.grey,
                                getTooltipItem: (a, b, c, d) => null,
                              ),
                              touchCallback: (FlTouchEvent event, response) {},
                            ),
                            titlesData: FlTitlesData(
                              show: true,
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: bottomTitles,
                                  reservedSize: 45,
                                ),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 35,
                                  interval: 1,
                                  getTitlesWidget: leftTitles,
                                ),
                              ),
                            ),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            barGroups: widget.controller.chartData,
                            gridData: FlGridData(show: false),
                          ),
                        );
                      }
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;

    if(value == 0) {
      text = "0";
    } else if(value % 10 == 0) {
      text = value.toString();
      text = text.substring(0,text.indexOf(".") + 2);
    } else {
      return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 20,
      child: Text(text, style: style),
    );
  }

  //String _getTextLeftLegend(double)

  Widget bottomTitles(double value, TitleMeta meta) {

    final int index;

    if(value == 0) {
      index = 0;
    } else if(value % 2 == 0) {
      index = (value / 2).toInt();
    } else {
      return Container();
    }

    final approver = widget.controller.approvers[index];

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: Tooltip(
        message: "Nome do usuário",
        triggerMode: TooltipTriggerMode.tap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              height: 45,
              width: 45,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              height: 25,
              width: 25,
              child: Center(
                child: Text(
                  _getInitials(approver.name),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }

  String _getInitials(String name) {
    if (name.isEmpty) {
      return "";
    }

    var nomes = name.split(" ");

    if (nomes.length == 1) {
      if (nomes.first.length == 1) {
        return (nomes.first[0]).toUpperCase();
      }

      return (nomes.first[0] + nomes.first[1]).toUpperCase();
    }

    return (nomes[0][0] + nomes[nomes.length - 1][0]).toUpperCase();
  }
}

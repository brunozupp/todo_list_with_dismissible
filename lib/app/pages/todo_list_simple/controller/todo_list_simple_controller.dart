import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_list_with_dismissible/app/models/approver.dart';
part 'todo_list_simple_controller.g.dart';

class TodoListSimpleController = _TodoListSimpleControllerBase with _$TodoListSimpleController;

abstract class _TodoListSimpleControllerBase with Store {
  
  @observable
  var _approvers = <Approver>[].asObservable();

  @computed
  List<Approver> get approvers => _approvers;

  @action
  void addApprover(Approver approver) {
    approvers.add(approver);
  }

  @action
  void removeApprover(Approver approver) {
    approvers.remove(approver);
  }

  @computed
  List<BarChartGroupData> get chartData {

    final barGroups = <BarChartGroupData>[];

    for(var i = 0; i < _approvers.length; i++) {

      final approver = _approvers[i];

      barGroups.add(_makeGroupData(
        i * 2, 
        approver.approved.toDouble(),
        approver.notApproved.toDouble(),
      ));
    }

    return barGroups;
  }

  BarChartGroupData _makeGroupData(int x, double y1, double y2) {

    const Color leftBarColor = Color(0xff53fdd7);
    const Color rightBarColor = Color(0xffff5182);
    const double width = 7;

    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        toY: y1,
        color: leftBarColor,
        width: width,
      ),
      BarChartRodData(
        toY: y2,
        color: rightBarColor,
        width: width,
      ),
    ]);
  }

  @computed
  double get maxY {

    final numsSet = <int>{};

    for (var item in _approvers) {
      numsSet.add(item.approved);
      numsSet.add(item.notApproved);
    }

    final numsList = numsSet.toList();

    numsList.sort((a,b) => b.compareTo(a));

    return (numsList.isEmpty ? 10 : numsList.first).toDouble();
  }
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_simple_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoListSimpleController on _TodoListSimpleControllerBase, Store {
  Computed<List<Approver>>? _$approversComputed;

  @override
  List<Approver> get approvers =>
      (_$approversComputed ??= Computed<List<Approver>>(() => super.approvers,
              name: '_TodoListSimpleControllerBase.approvers'))
          .value;

  late final _$_approversAtom =
      Atom(name: '_TodoListSimpleControllerBase._approvers', context: context);

  @override
  ObservableList<Approver> get _approvers {
    _$_approversAtom.reportRead();
    return super._approvers;
  }

  @override
  set _approvers(ObservableList<Approver> value) {
    _$_approversAtom.reportWrite(value, super._approvers, () {
      super._approvers = value;
    });
  }

  late final _$_TodoListSimpleControllerBaseActionController =
      ActionController(name: '_TodoListSimpleControllerBase', context: context);

  @override
  void addApprover(Approver approver) {
    final _$actionInfo = _$_TodoListSimpleControllerBaseActionController
        .startAction(name: '_TodoListSimpleControllerBase.addApprover');
    try {
      return super.addApprover(approver);
    } finally {
      _$_TodoListSimpleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeApprover(Approver approver) {
    final _$actionInfo = _$_TodoListSimpleControllerBaseActionController
        .startAction(name: '_TodoListSimpleControllerBase.removeApprover');
    try {
      return super.removeApprover(approver);
    } finally {
      _$_TodoListSimpleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
approvers: ${approvers}
    ''';
  }
}

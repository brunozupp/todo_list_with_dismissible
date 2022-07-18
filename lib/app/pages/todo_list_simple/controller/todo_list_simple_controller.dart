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
}
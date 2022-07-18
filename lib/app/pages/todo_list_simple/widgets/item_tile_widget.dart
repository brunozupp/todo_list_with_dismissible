import 'package:flutter/material.dart';

import 'package:todo_list_with_dismissible/app/models/approver.dart';
import 'package:todo_list_with_dismissible/app/pages/todo_list_simple/controller/todo_list_simple_controller.dart';

class ItemTileWidget extends StatelessWidget {

  final Approver approver;
  final TodoListSimpleController controller;

  const ItemTileWidget({
    Key? key,
    required this.approver,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(approver),
      onDismissed: (_) {
        controller.removeApprover(approver);
      },
      confirmDismiss: (_) async {

        final canDelete = await showDialog<bool?>(
          context: context, 
          builder: (_) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Quer deletar?"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          child: Text("VOLTAR"),
                          onPressed: () => Navigator.of(context).pop(false),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          child: Text("DELETAR"),
                          onPressed: () => Navigator.of(context).pop(true),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        );

        return canDelete ?? false;
      },
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red,
        child: Center(
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      child: ListTile(
        title: Text(approver.name),
        subtitle: Row(
          children: [
            Text(
              "Aprovados: ${approver.approved}",
              style: const TextStyle(
                color: Colors.green,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Não Aprovados: ${approver.notApproved}",
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

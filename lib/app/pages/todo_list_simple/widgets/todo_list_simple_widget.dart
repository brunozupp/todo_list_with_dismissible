import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_list_with_dismissible/app/models/approver.dart';

import 'package:todo_list_with_dismissible/app/pages/todo_list_simple/controller/todo_list_simple_controller.dart';
import 'package:todo_list_with_dismissible/app/pages/todo_list_simple/widgets/item_tile_widget.dart';

class TodoListSimpleWidget extends StatefulWidget {
  
  final TodoListSimpleController controller;
  
  const TodoListSimpleWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<TodoListSimpleWidget> createState() => _TodoListSimpleWidgetState();
}

class _TodoListSimpleWidgetState extends State<TodoListSimpleWidget> {
  
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final approvedEC = TextEditingController();
  final notApprovedEC = TextEditingController();

  @override
  void dispose() {
    
    nameEC.dispose();
    approvedEC.dispose();
    notApprovedEC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameEC,
                decoration: const InputDecoration(
                  labelText: "Aprovador",
                ),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Obrigatório";
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: approvedEC,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Aprovados",
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return "Obrigatório";
                        }

                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: notApprovedEC,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Não aprovados",
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return "Obrigatório";
                        }

                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: save, 
            child: const Text("Salvar")
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Observer(
          builder: (context) {
            return Visibility(
              visible: widget.controller.approvers.isNotEmpty,
              replacement: const Text("Não há aprovadores cadastrados"),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.controller.approvers.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (_, index) {
                  final approver = widget.controller.approvers[index];

                  return ItemTileWidget(
                    approver: approver, 
                    controller: widget.controller,
                  );
                }
              ),
            );
          }
        ),
      ],
    );
  }

  void save() {

    final formValid = formKey.currentState?.validate() ?? false;

    if(formValid) {
      
      final approver = Approver(
        name: nameEC.text, 
        approved: int.parse(approvedEC.text), 
        notApproved: int.parse(notApprovedEC.text),
      );

      widget.controller.addApprover(approver);

      cleanFields();
    }
  }

  void cleanFields() {
    nameEC.clear();
    approvedEC.clear();
    notApprovedEC.clear();
  }
}

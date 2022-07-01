import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/models/todo_model.dart';
import 'package:getx_todo_app/screens/home_screen.dart';

import '../controllers/todo_controller.dart';

class TodoScreen extends StatelessWidget {
  bool isEdit = false;
  String? text;
  int? i;
  TodoScreen({
    required this.isEdit,
    this.text,
    this.i,
  });
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final textcontroller = TextEditingController(text: text ?? "");
    TodoController controller = Get.find<TodoController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("TO DO"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              style: const TextStyle(
                fontSize: 20,
              ),
              maxLines: 999,
              focusNode: focusNode,
              controller: textcontroller,
              decoration: const InputDecoration(
                hintText: "Add your task here",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
              ),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  focusNode.unfocus();
                  Get.back();
                },
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: const Text("cancel"),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (textcontroller.text.isNotEmpty) {
                    if (!isEdit) {
                      controller.insertData(
                          TodoModel(done: false, text: textcontroller.text));
                      focusNode.unfocus();
                    } else {
                      var isChangedValue = controller.list[i!];
                      isChangedValue.text = textcontroller.text;
                      controller.list[i!] = isChangedValue;
                      focusNode.unfocus();
                    }

                    Get.back();
                  }
                },
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: const Text("save"),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

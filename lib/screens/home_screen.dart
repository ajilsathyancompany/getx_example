import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/screens/todo_scree.dart';

import '../controllers/todo_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TodoController controller = Get.put(TodoController(), permanent: true);

    return Scaffold(
      appBar: AppBar(title: const Text("Get X Todo App")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(
          TodoScreen(isEdit: false),
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Container(
        // child: GetBuilder<TodoController>(
        //   builder: (controller) {
        //     return ListView.separated(
        //       itemCount:controller.list.length,
        //       itemBuilder: (context, index) => ListTile(
        //         title: Text(controller.list[index].text),
        //       ),
        //       separatorBuilder: (context, index) => Divider(),
        //     );
        //   },
        // ),
        child: Obx(() => ListView.separated(
              itemCount: controller.list.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Get.to(TodoScreen(isEdit: true,text: controller.list[index].text,i: index,));
                },
                trailing: Icon(Icons.chevron_right),
                leading: Checkbox(
                  value: controller.list[index].done as bool,
                  onChanged: (value) {
                    var isChanged = controller.list[index];
                    isChanged.done = value!;
                    controller.list[index] = isChanged;
                  },
                ),
                title: Text(
                  controller.list[index].text!,
                  style: (controller.list[index].done!)
                      ? TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 20,
                          color: Colors.red)
                      : TextStyle(fontSize: 20, color: Colors.greenAccent),
                ),
              ),
              separatorBuilder: (context, index) => Divider(),
            )),
      ),
    );
  }
}

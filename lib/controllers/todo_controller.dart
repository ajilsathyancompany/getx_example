
import 'package:get/get.dart';
import 'package:getx_todo_app/models/todo_model.dart';

class TodoController extends GetxController {
  // ignore: prefer_collection_literals
  RxList list = [].obs ;

  insertData(TodoModel model) {
    list.add(model);
  }

}

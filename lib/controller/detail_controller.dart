import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DetailController extends GetxController {
  var count = 0.obs;

  void decrementByOne() {
    count.value = count.value - 1;
  }

  void incrementByOne() {
    count.value = count.value + 1;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}

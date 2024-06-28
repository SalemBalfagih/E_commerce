import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';

class Homecontroller extends GetxController {
  List items = ["ali", "ahmed", "saaeddda"];
  int selectedIndex = 0;
  RxInt selectedIndexbar = 0.obs;
  void selectItem(int index) {
    selectedIndex = index;
    update();
  }
  // Observable variable to store the selected index

  void onItemSelectedbar(int index) {
    // Update the selected index when an item is selected
    selectedIndexbar.value = index;
  }
}

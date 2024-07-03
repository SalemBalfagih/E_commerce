import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class ProfileController extends GetxController {
  gotogshared(String url) async {
    await Share.share(
      'Hey : $url',
      subject: 'Share Me',
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
  }
}

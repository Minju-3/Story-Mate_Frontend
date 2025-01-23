import 'package:get/get.dart';
import 'package:storymate/views/book_read_page.dart';

class BookIntroController extends GetxController {
  // 뒤로 가기
  void goBack() {
    Get.back();
  }

  // 작품 감상 화면으로 이동
  void toReadPage(String title) {
    Get.to(
      BookReadPage(),
      arguments: {
        'title': title,
      },
    );
  }
}

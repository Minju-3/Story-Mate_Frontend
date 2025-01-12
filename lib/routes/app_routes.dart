// 라우팅 관리

import 'package:get/get.dart';
import 'package:storymate/views/sample_page.dart';

class AppRoutes {
  static const HOME = '/';

  static final routes = [
    GetPage(name: HOME, page: () => SamplePage()),
  ];
}

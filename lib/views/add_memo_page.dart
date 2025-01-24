import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:storymate/components/book_app_bar.dart';
import 'package:storymate/components/theme.dart';
import 'package:storymate/view_models/add_memo_controller.dart';

class AddMemoPage extends StatelessWidget {
  const AddMemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AddMemoController controller = Get.put(AddMemoController());

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: BookAppBar(
        title: '새로운 메모',
        onLeadingTap: () => controller.goBackWithPrompt(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '페이지',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Nanum',
                        fontWeight: FontWeight.w600,
                        height: 1.11,
                        letterSpacing: -0.23,
                      ),
                    ),
                    // 페이지 입력창
                    Container(
                      width: 250,
                      height: 50,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD9D9D9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: controller.pageController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly, // 숫자만 허용
                          ],
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Nanum',
                            fontWeight: FontWeight.w600,
                            height: 1.11,
                            letterSpacing: -0.23,
                          ),
                          decoration: InputDecoration(
                            hintText: '연관 페이지(숫자)',
                            hintStyle: TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                              fontFamily: 'Nanum',
                              fontWeight: FontWeight.w600,
                              height: 1.11,
                              letterSpacing: -0.23,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // 메모 내용 입력창
                Container(
                  height: 400,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: AppTheme.primaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // 스크롤 가능한 TextField
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: SingleChildScrollView(
                            child: TextField(
                              controller: controller.memoController,
                              onChanged: (value) {
                                controller.updateCharacterCount(value.length);
                              },
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Nanum',
                                fontWeight: FontWeight.w600,
                                height: 1.5,
                                letterSpacing: -0.23,
                              ),
                              decoration: InputDecoration(
                                hintText: '자유롭게 메모를 작성해 주세요',
                                hintStyle: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16,
                                  fontFamily: 'Nanum',
                                  fontWeight: FontWeight.w600,
                                  height: 1.11,
                                  letterSpacing: -0.23,
                                ),
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: null, // 무제한 줄 수
                            ),
                          ),
                        ),
                      ),
                      // 글자 수 표시
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(() {
                          return Text(
                            '${controller.characterCount.value}/2000',
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontSize: 12,
                              fontFamily: 'Nanum',
                              fontWeight: FontWeight.w600,
                              height: 1.67,
                              letterSpacing: -0.23,
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => controller.saveMemo(),
            child: Container(
              width: 270,
              height: 60,
              decoration: ShapeDecoration(
                color: const Color(0xFF9B9ECF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              // 메모 저장 버튼
              child: const Center(
                child: Text(
                  '메모 저장하기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Jua',
                    fontWeight: FontWeight.w400,
                    height: 1,
                    letterSpacing: -0.23,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

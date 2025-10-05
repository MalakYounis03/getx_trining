import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_trining/comments/view/comments_screen.dart';
import 'package:getx_trining/posts/view/home_screen.dart';
import 'package:getx_trining/user_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: UserBinding(),
      getPages: [
        GetPage(name: "/", page: () => HomeScreen()),
        GetPage(
          name: "/comments",
          page: () {
            final args = Get.arguments;
            return CommentsScreen(postsModel: args);
          },
        ),
      ],
    );
  }
}

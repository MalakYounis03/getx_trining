import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_trining/comments/view/comments_screen.dart';
import 'package:getx_trining/posts/model/posts_model.dart';
import 'package:getx_trining/user_controller.dart';

class HomeScreen extends GetView<UserController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<PostsModel> userList = controller.userList;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Posts",
          style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 238, 165, 189),
      ),
      body: Obx(
        () => controller.isPostsLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color.fromARGB(255, 233, 119, 157),

                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    child: ListTile(
                      title: Text(
                        userList[index].title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(userList[index].body),
                      onTap: () {
                        Get.to(
                          () => CommentsScreen(postsModel: userList[index]),
                        );
                      },
                    ),
                  );
                },
                itemCount: userList.length,
              ),
      ),
    );
  }
}

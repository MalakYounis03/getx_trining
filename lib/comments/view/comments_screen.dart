import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:getx_trining/user_controller.dart';
import 'package:getx_trining/posts/model/posts_model.dart';

class CommentsScreen extends GetView<UserController> {
  const CommentsScreen({super.key, required this.postsModel});
  final PostsModel postsModel;
  @override
  Widget build(BuildContext context) {
    controller.getComments(postsModel.id);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Post Details",
          style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 238, 165, 189),
      ),
      body: Column(
        children: [
          Card(
            color: const Color.fromARGB(255, 233, 119, 157),
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(
                postsModel.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(postsModel.body),
            ),
          ),
          Divider(color: Colors.pink),

          Expanded(
            child: Obx(
              () => controller.isCommentsLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        final comment = controller.commentsList[index];
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Color.fromARGB(255, 238, 165, 189),
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                comment.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(comment.email),
                              Divider(),
                              Text(comment.body),
                            ],
                          ),
                        );
                      },
                      itemCount: controller.commentsList.length,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

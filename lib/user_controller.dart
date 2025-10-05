import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_trining/comments/model/comments_model.dart';
import 'package:getx_trining/posts/model/posts_model.dart';

class UserController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getUsers();
  }

  var userList = <PostsModel>[].obs;
  var commentsList = <CommentsModel>[].obs;
  var isPostsLoading = true.obs;
  var isCommentsLoading = true.obs;
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      headers: {'Accept': 'application/json'},
    ),
  );
  Future<List<PostsModel>> getUsers() async {
    final response = await dio.get("/posts");

    if (response.statusCode == 200) {
      List data = response.data;
      userList.value = data.map((e) => PostsModel.fromJson(e)).toList();
      isPostsLoading.value = false;
      return userList;
    } else {
      throw Exception('فشل في جلب البيانات: ${response.statusCode}');
    }
  }

  Future<List<CommentsModel>> getComments(int postId) async {
    final response = await dio.get("/comments?postId=$postId");

    if (response.statusCode == 200) {
      List data = response.data;

      commentsList.value = data.map((e) => CommentsModel.fromJson(e)).toList();
      isCommentsLoading.value = false;
      return commentsList;
    } else {
      throw Exception('فشل في جلب البيانات: ${response.statusCode}');
    }
  }
}

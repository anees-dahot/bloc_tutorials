import 'dart:convert';

import 'package:bloc_practice/API%20with%20bloc/features/posts/model/posts_mode.dart';
import 'package:http/http.dart' as http;

class PostsRepos {
  Future<List<PostsModel>> getPosts() async {
    final List<PostsModel> posts = [];
    var res =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(res.body);
    for (int i = 0; i < data.length; i++) {
      PostsModel postsModel = PostsModel.fromMap(data[i]);
      posts.add(postsModel);
    }
    return posts;
  }
}

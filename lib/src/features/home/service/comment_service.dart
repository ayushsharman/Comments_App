import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../constants/api_constants.dart';
import '../model/comment_model.dart';

class CommentService {
  Future<List<Comment>> fetchComments() async {
    final url = Uri.parse(ApiConstants.host + ApiConstants.commentsUrl);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Comment.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }
}

import 'package:flutter/material.dart';
import '../model/comment_model.dart';
import '../service/comment_service.dart';
import '../service/remote_config_service.dart';

class CommentsViewModel extends ChangeNotifier {
  final CommentService _commentService = CommentService();
  final RemoteConfigService _remoteConfigService = RemoteConfigService();

  List<Comment> _comments = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<Comment> get comments => _comments;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  CommentsViewModel() {
    fetchComments();
  }

  Future<void> fetchComments() async {
    _setLoading(true);
    try {
      final fetchedComments = await _commentService.fetchComments();
      final maskEmailSetting =
          await _remoteConfigService.getEmailMaskingSetting();
      for (var comment in fetchedComments) {
        comment.updateMaskedEmail(maskEmail(comment.email, maskEmailSetting));
      }
      _comments = fetchedComments;
      _setErrorMessage('');
    } catch (e) {
      _setErrorMessage('Failed to load comments: $e');
    }
    _setLoading(false);
  }

  String maskEmail(String email, bool mask) {
    if (!mask) return email;
    final parts = email.split('@');
    return parts[0].length > 3
        ? '${parts[0].substring(0, 3)}****@${parts[1]}'
        : '***@${parts[1]}';
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setErrorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }
}

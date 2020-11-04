import 'package:injectable/injectable.dart';
import 'package:mvvm_example/src/models/comment.dart';
import 'package:mvvm_example/src/models/user.dart';
import 'package:mvvm_example/src/services/api_service.dart';
import 'package:mvvm_example/src/services/authetication_service.dart';
import 'package:mvvm_example/src/view_models/shared/base_view_model.dart';
import 'package:rx_command/rx_command.dart';

@singleton
class CommentsViewModel extends BaseViewModel {
  final Api _api;
  final AuthenticationService _authenticationService;

  RxCommand<int, List<Comment>> _getCommentsCommand;
  RxCommand<int, List<Comment>> get getCommentsCommand => this._getCommentsCommand;

  User get user => this._authenticationService.user;

  CommentsViewModel(Api api, AuthenticationService authenticationService)
      : _api = api,
        _authenticationService = authenticationService {
    this._getCommentsCommand = RxCommand.createAsync(this._onGetCommentsCommand);
  }

  Future<List<Comment>> _onGetCommentsCommand(int postId) {
    return this._api.getCommentsForPost(postId);
  }
}

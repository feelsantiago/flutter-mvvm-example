import 'package:injectable/injectable.dart';
import 'package:mvvm_example/src/models/post.dart';
import 'package:mvvm_example/src/models/user.dart';
import 'package:mvvm_example/src/services/api_service.dart';
import 'package:mvvm_example/src/services/authetication_service.dart';
import 'package:mvvm_example/src/view_models/shared/base_view_model.dart';
import 'package:rx_command/rx_command.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class PostsViewModel extends BaseViewModel {
  final Api _api;
  final AuthenticationService _authenticationService;

  RxCommand<void, List<Post>> _getPostsCommand;
  RxCommand<void, List<Post>> get getPostsCommand => this._getPostsCommand;

  List<Post> posts = List();

  User get user => this._authenticationService.user;

  PostsViewModel(Api api, AuthenticationService authenticationService)
      : _api = api,
        _authenticationService = authenticationService {
    this._getPostsCommand = RxCommand.createAsyncNoParam(this._getPosts);
  }

  Future<List<Post>> _getPosts() async {
    this.setStateToBusy();
    posts = await _api.getPostsForUser(this.user.id);
    this.setStateToReady();

    return this.posts;
  }
}

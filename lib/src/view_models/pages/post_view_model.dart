import 'package:injectable/injectable.dart';
import 'package:mvvm_example/src/models/user.dart';
import 'package:mvvm_example/src/services/authetication_service.dart';
import 'package:mvvm_example/src/view_models/shared/base_view_model.dart';

@singleton
class PostViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService;

  User get user => this._authenticationService.user;

  PostViewModel(AuthenticationService authenticationService) : _authenticationService = authenticationService;
}

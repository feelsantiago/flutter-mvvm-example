import 'package:injectable/injectable.dart';
import 'package:mvvm_example/src/services/authetication_service.dart';
import 'package:mvvm_example/src/view_models/shared/base_view_model.dart';
import 'package:rx_command/rx_command.dart';
import 'package:rxdart/subjects.dart';

@singleton
class LoginViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService;

  RxCommand<String, void> _logginCommand;
  RxCommand<String, void> get logginCommand => _logginCommand;

  LoginViewModel(AuthenticationService authenticationService) : _authenticationService = authenticationService {
    this._logginCommand = RxCommand.createAsync(this._onLogin);
  }

  Future<void> _onLogin(String userIdText) async {
    this.setStateToBusy();

    int userId = int.tryParse(userIdText);
    await _authenticationService.login(userId);

    this.setStateToReady();
  }
}

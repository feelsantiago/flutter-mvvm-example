import 'package:flutter/material.dart';
import 'package:mvvm_example/injection.dart';
import 'package:mvvm_example/src/common/route_paths.dart';
import 'package:mvvm_example/src/view_models/pages/login_view_model.dart';
import 'package:mvvm_example/src/views/shared/app_colors.dart';
import 'package:mvvm_example/src/views/shared/base_view.dart';
import 'package:rx_widgets/rx_widgets.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      builder: (context, viewModel) => Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                height: 50.0,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
                child: TextField(
                  decoration: InputDecoration.collapsed(hintText: 'User Id'),
                  controller: _controller,
                ),
              ),
              WidgetSelector(
                buildEvents: viewModel.isBusy,
                onTrue: CircularProgressIndicator(),
                onFalse: FlatButton(
                  color: Colors.white,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    viewModel.logginCommand(_controller.text);
                    viewModel.logginCommand.listen((value) {
                      Navigator.pushNamed(context, RoutePaths.Home);
                    });
                  },
                ),
              ),
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mvvm_example/injection.dart';
import 'package:mvvm_example/src/services/authetication_service.dart';
import 'package:mvvm_example/src/view_models/pages/home_view_model.dart';
import 'package:mvvm_example/src/views/shared/base_view.dart';
import 'package:mvvm_example/src/views/widgets/posts.dart';
import 'package:mvvm_example/src/views/shared/app_colors.dart';
import 'package:mvvm_example/src/views/shared/text_styles.dart';
import 'package:mvvm_example/src/views/shared/ui_helper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        builder: (context, viewModel) => Scaffold(
              backgroundColor: backgroundColor,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  UIHelper.verticalSpaceLarge,
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Welcome ${viewModel.user.name}',
                      style: headerStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text('Here are all your posts', style: subHeaderStyle),
                  ),
                  UIHelper.verticalSpaceSmall,
                  Expanded(
                    child: Posts(),
                  )
                ],
              ),
            ));
  }
}

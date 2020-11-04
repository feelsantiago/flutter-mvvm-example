import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_example/src/models/post.dart';
import 'package:mvvm_example/src/view_models/pages/post_view_model.dart';
import 'package:mvvm_example/src/views/shared/app_colors.dart';
import 'package:mvvm_example/src/views/shared/base_view.dart';
import 'package:mvvm_example/src/views/shared/text_styles.dart';
import 'package:mvvm_example/src/views/shared/ui_helper.dart';
import 'package:mvvm_example/src/views/widgets/comments.dart';

class PostPage extends StatelessWidget {
  final Post post;

  PostPage({this.post});

  @override
  Widget build(BuildContext context) {
    return BaseView<PostViewModel>(
        builder: (context, viewModel) => Scaffold(
              backgroundColor: backgroundColor,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    UIHelper.verticalSpaceLarge,
                    Text(post.title, style: headerStyle),
                    Text(
                      'by ${viewModel.user.name}',
                      style: TextStyle(fontSize: 9.0),
                    ),
                    UIHelper.verticalSpaceMedium,
                    Comments(post.id),
                  ],
                ),
              ),
            ));
  }
}

import 'package:flutter/material.dart';
import 'package:mvvm_example/src/models/comment.dart';
import 'package:mvvm_example/src/view_models/widgets/comments_view_model.dart';
import 'package:mvvm_example/src/views/shared/app_colors.dart';
import 'package:mvvm_example/src/views/shared/base_view.dart';
import 'package:mvvm_example/src/views/shared/ui_helper.dart';
import 'package:rx_widgets/rx_widgets.dart';

class Comments extends StatelessWidget {
  final int postId;
  Comments(this.postId);

  Widget commentItem(Comment comment) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: commentColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            comment.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          UIHelper.verticalSpaceSmall,
          Text(comment.body),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<CommentsViewModel>(
      onInitState: (viewModel) => viewModel.getCommentsCommand(this.postId),
      builder: (context, viewModel) => Expanded(
        /// RxLoader executes different builders based on the
        /// state of the Stream<CommandResult>
        child: RxLoader<List<Comment>>(
          radius: 25.0,
          commandResults: viewModel.getCommentsCommand.results,
          dataBuilder: (context, data) => ListView.builder(itemCount: data.length, itemBuilder: (context, index) => this.commentItem(data[index])),
          placeHolderBuilder: (context) => Center(child: Text("No Data")),
          errorBuilder: (context, ex) => Center(child: Text("Error: ${ex.toString()}")),
        ),
      ),
    );
  }
}

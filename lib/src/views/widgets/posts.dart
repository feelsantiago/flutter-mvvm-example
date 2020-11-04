import 'package:flutter/material.dart';
import 'package:mvvm_example/injection.dart';
import 'package:mvvm_example/src/common/route_paths.dart';
import 'package:mvvm_example/src/models/post.dart';
import 'package:mvvm_example/src/view_models/widgets/posts_view_model.dart';
import 'package:mvvm_example/src/views/shared/base_view.dart';
import 'package:rx_widgets/rx_widgets.dart';

class Posts extends StatelessWidget {
  Widget postItem(BuildContext context, Post post) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        RoutePaths.Post,
        arguments: post,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5.0), boxShadow: [BoxShadow(blurRadius: 3.0, offset: Offset(0.0, 2.0), color: Color.fromARGB(80, 0, 0, 0))]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              post.title,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16.0),
            ),
            Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<PostsViewModel>(
        onInitState: (viewModel) => viewModel.getPostsCommand(),
        builder: (context, viewModel) => Row(children: [
              Expanded(
                /// RxLoader executes different builders based on the
                /// state of the Stream<CommandResult>
                child: RxLoader<List<Post>>(
                  radius: 25.0,
                  commandResults: viewModel.getPostsCommand.results,
                  dataBuilder: (context, data) => ListView.builder(itemCount: viewModel.posts.length, itemBuilder: (context, index) => this.postItem(context, viewModel.posts[index])),
                  placeHolderBuilder: (context) => Center(child: Text("No Data")),
                  errorBuilder: (context, ex) => Center(child: Text("Error: ${ex.toString()}")),
                ),
              ),
            ]));
  }
}

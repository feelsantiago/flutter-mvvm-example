// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'src/services/api_service.dart';
import 'src/services/authetication_service.dart';
import 'src/view_models/widgets/comments_view_model.dart';
import 'src/view_models/pages/home_view_model.dart';
import 'src/view_models/pages/login_view_model.dart';
import 'src/view_models/pages/post_view_model.dart';
import 'src/view_models/widgets/posts_view_model.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);

  // Eager singletons must be registered in the right order
  gh.singleton<Api>(Api());
  gh.singleton<AuthenticationService>(AuthenticationService(get<Api>()));
  gh.singleton<CommentsViewModel>(
      CommentsViewModel(get<Api>(), get<AuthenticationService>()));
  gh.singleton<HomeViewModel>(HomeViewModel(get<AuthenticationService>()));
  gh.singleton<LoginViewModel>(LoginViewModel(get<AuthenticationService>()));
  gh.singleton<PostViewModel>(PostViewModel(get<AuthenticationService>()));
  gh.singleton<PostsViewModel>(
      PostsViewModel(get<Api>(), get<AuthenticationService>()));
  return get;
}

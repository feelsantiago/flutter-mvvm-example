import 'package:flutter/material.dart';
import 'package:mvvm_example/injection.dart';
import 'package:mvvm_example/src/view_models/shared/base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Function(T) onInitState;
  final Widget Function(BuildContext context, T viewModel) builder;

  BaseView({
    Key key,
    this.builder,
    this.onInitState,
  }) : super(key: key);

  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T _viewModel;

  @override
  void initState() {
    this._viewModel = getIt<T>();

    if (widget.onInitState != null) {
      widget.onInitState(this._viewModel);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, this._viewModel);
  }
}

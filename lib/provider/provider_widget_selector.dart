import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Provider封装类
///
/// 方便数据初始化
class ProviderSelectorWidget<T extends ChangeNotifier, S> extends StatefulWidget {
  final ValueWidgetBuilder<S> builder;
  final S Function(BuildContext, T) selector;
  final T model;
  final Widget child;
  final Function(T) onModelReady;

  ProviderSelectorWidget({
    Key key,
    @required this.builder,
    @required this.model,
    this.selector,
    this.child,
    this.onModelReady,
  }) : super(key: key);

  _ProviderSelectorWidgetState<T, S> createState() => _ProviderSelectorWidgetState<T, S>();
}

class _ProviderSelectorWidgetState<T extends ChangeNotifier, S>
    extends State<ProviderSelectorWidget<T, S>> {
  T model;

  @override
  void initState() {
    model = widget.model;
    widget.onModelReady?.call(model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      builder: (context) => model,
      child: Selector<T, S>(
        selector: widget.selector,
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}

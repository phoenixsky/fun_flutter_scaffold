import 'package:flutter/material.dart';
import 'package:fun_flutter_scaffold/config/resource_manager.dart';
import 'package:fun_flutter_scaffold/config/locatizations.dart';
import 'view_state_widget.dart';


/// 页面无数据
class ViewStateEmptyWidget extends StatelessWidget {
  final String message;
  final Widget image;
  final Widget buttonText;
  final VoidCallback onPressed;

  const ViewStateEmptyWidget(
      {Key key,
        this.image,
        this.message,
        this.buttonText,
        @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewStateWidget(
      onPressed: this.onPressed,
      image: image ??
          const Icon(ViewStateIcons.pageEmpty, size: 100, color: Colors.grey),
      title: message ?? FunFlutterScaffoldLocalizations.of(context).viewStateMessageEmpty,
      buttonText: buttonText,
      buttonTextData: FunFlutterScaffoldLocalizations.of(context).viewStateButtonRefresh,
    );
  }
}

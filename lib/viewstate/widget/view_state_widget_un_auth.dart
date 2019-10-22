import 'package:flutter/material.dart';
import 'package:fun_flutter_scaffold/config/resource_manager.dart';
import 'package:fun_flutter_scaffold/config/locatizations.dart';

import 'view_state_widget.dart';

/// 页面未授权
class ViewStateUnAuthWidget extends StatelessWidget {
  final String message;
  final Widget image;
  final Widget buttonText;
  final VoidCallback onPressed;

  const ViewStateUnAuthWidget(
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
          const Icon(ViewStateIcons.pageUnAuth, size: 100, color: Colors.grey),
      title:
          message ?? FunFlutterScaffoldLocalizations.of(context).viewStateMessageUnAuth,
      buttonText: buttonText,
      buttonTextData: FunFlutterScaffoldLocalizations.of(context).viewStateButtonLogin,
    );
  }
}

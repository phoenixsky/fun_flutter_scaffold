import 'package:flutter/material.dart';
import 'package:fun_flutter_scaffold/config/resource_manager.dart';
import '../view_state.dart';
import '../../config/locatizations.dart';
import 'view_state_widget.dart';

/// 显示错误消息
showErrorMessage(context, {ViewStateError viewStateError, String message}) {
  if (viewStateError != null && message != null) {
    if (viewStateError.isNetworkError) {
      message ??= FunFlutterScaffoldLocalizations.of(context).viewStateMessageNetworkError;
    } else {
      message ??= viewStateError.message;
    }
    Future.microtask(() {
      // TODO toast提示
//      showToast(message, context: context);
    });
  }
}

class ViewStateErrorWidget extends StatelessWidget {
  final ViewStateError error;
  final String title;
  final String message;
  final Widget image;
  final Widget buttonText;
  final String buttonTextData;
  final VoidCallback onPressed;

  const ViewStateErrorWidget({
    Key key,
    @required this.error,
    this.image,
    this.title,
    this.message,
    this.buttonText,
    this.buttonTextData,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var defaultImage;
    var defaultTitle;
    var errorMessage = error.message;
    String defaultTextData = FunFlutterScaffoldLocalizations.of(context).viewStateButtonRetry;
    switch (error.errorType) {
      case ErrorType.networkError:
        defaultImage = Transform.translate(
          offset: Offset(-50, 0),
          child: const Icon(ViewStateIcons.pageNetworkError,
              size: 100, color: Colors.grey),
        );
        defaultTitle = FunFlutterScaffoldLocalizations.of(context).viewStateMessageNetworkError;
        errorMessage = ''; // 网络异常移除message提示
        break;
      case ErrorType.defaultError:
        defaultImage =
            const Icon(ViewStateIcons.pageError, size: 100, color: Colors.grey);
        defaultTitle = FunFlutterScaffoldLocalizations.of(context).viewStateMessageError;
        break;
    }

    return ViewStateWidget(
      onPressed: this.onPressed,
      image: image ?? defaultImage,
      title: title ?? defaultTitle,
      message: message ?? errorMessage,
      buttonTextData: buttonTextData ?? defaultTextData,
      buttonText: buttonText,
    );
  }
}

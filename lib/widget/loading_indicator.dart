import 'package:flutter/material.dart';
import 'package:pkcomics/public.dart';
import 'package:pkcomics/widget/FrameAnimationImage.dart';

class LoadingIndicator extends StatefulWidget {
  final PageState pageState;

  final Retry retry;

  LoadingIndicator(this.pageState, {this.retry});

  @override
  LoadingIndicatorState createState() => LoadingIndicatorState();
}

class LoadingIndicatorState extends State<LoadingIndicator> {
  @override
  void initState() {
    super.initState();
  }

  Widget buildStateLayout() {
    Widget widget;
    switch(this.widget.pageState) {
      case PageState.Content:
        widget = Container();
        break;
      case PageState.Loading:
        widget = GestureDetector(
            child: FrameAnimationImage(),
            onTap: () {
              if (this.widget.retry != null) {
                this.widget.retry();
              }
            });
        break;
      case PageState.LoadingNetError:
        widget = GestureDetector(
            onTap: () {
              if (this.widget.retry != null) {
                this.widget.retry();
              }
            },
            child: Container(
              color: AppColor.white,
              child: Text("Check the network",
                  style: TextStyle(
                      color: AppColor.darkGray,
                      fontSize: 16,
                      decoration: TextDecoration.none)),
              width: Screen.width,
              height: Screen.height,
              alignment: Alignment.center,
            ));
        break;
      case PageState.LoadingError:
        widget = GestureDetector(
            onTap: () {
              if (this.widget.retry != null) {
                this.widget.retry();
              }
            },
            child: Container(
              color: AppColor.white,
              child: Text("Load failure, click retry.",
                  style: TextStyle(
                      color: AppColor.darkGray,
                      fontSize: 16,
                      decoration: TextDecoration.none)),
              width: Screen.width,
              height: Screen.height,
              alignment: Alignment.center,
            ));
        break;
      case PageState.Empty:
        widget = GestureDetector(
            onTap: () {
              if (this.widget.retry != null) {
                this.widget.retry();
              }
            },
            child: Container(
              color: AppColor.white,
              child: Text("No data",
                  style: TextStyle(
                      color: AppColor.darkGray,
                      fontSize: 16,
                      decoration: TextDecoration.none)),
              width: Screen.width,
              height: Screen.height,
              alignment: Alignment.center,
            ));
        break;
    }
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return buildStateLayout();
  }
}

enum PageState {
  Content,
  Loading,
  Empty,
  LoadingNetError,
  LoadingError,
}

typedef Retry = void Function();



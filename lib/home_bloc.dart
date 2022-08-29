import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/flutter_bloc_pattern.dart';
import 'package:hoc081098_portfolio/widgets/header.dart';

class HomeBloc implements BaseBloc {
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();

  @override
  void dispose() {}

  void scrollTo(HeaderItem item) {
    if (item.title == 'Home') {
      scrollToHome();
    } else if (item.title == 'About') {
      scrollToAbout();
    }
  }

  void scrollToHome() => _scroll(homeKey.currentContext);

  void scrollToAbout() => _scroll(aboutKey.currentContext);

  void _scroll(BuildContext? context) {
    if (context == null) {
      return;
    }
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    ).ignore();
  }
}

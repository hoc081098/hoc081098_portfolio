import 'package:flutter/material.dart';
import 'package:flutter_provider/flutter_provider.dart';
import 'package:hoc081098_portfolio/home_bloc.dart';
import 'package:hoc081098_portfolio/utils/globals.dart';
import 'package:hoc081098_portfolio/utils/screen_helper.dart';
import 'package:hoc081098_portfolio/widgets/header.dart';
import 'package:hoc081098_portfolio/widgets/home_info.dart';
import 'package:hoc081098_portfolio/widgets/theme_switcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final homeBloc = context.get<HomeBloc>();

    return Scaffold(
      key: Globals.shared.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                final headerItem = headerItems[index];

                return ListTile(
                  onTap: () {
                    final scaffoldState =
                        Globals.shared.scaffoldKey.currentState;
                    if (scaffoldState != null &&
                        scaffoldState.isEndDrawerOpen) {
                      Navigator.of(context).pop();
                      headerItem.onTap();
                      homeBloc.scrollTo(headerItem);
                    }
                  },
                  leading: Icon(
                    headerItem.iconData,
                  ),
                  title: Text(
                    headerItem.title,
                    style: const TextStyle(),
                  ),
                  trailing: headerItem.title == 'Theme'
                      ? const ThemeSwitcher()
                      : null,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10.0,
                );
              },
              itemCount: headerItems.length,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: ScreenHelper.isDesktop(context)
                        ? 100
                        : ScreenHelper.isTablet(context)
                            ? 100
                            : 90,
                  ),
                  HomeInfo(
                    key: homeBloc.homeKey,
                  ),
                  Container(
                    height: 2000,
                    color: Colors.red,
                  )
                ],
              ),
            ),
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Header(),
          ),
        ],
      ),
    );
  }
}

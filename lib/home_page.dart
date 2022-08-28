import 'package:flutter/material.dart';
import 'package:hoc081098_portfolio/utils/globals.dart';
import 'package:hoc081098_portfolio/utils/screen_helper.dart';
import 'package:hoc081098_portfolio/widgets/header.dart';
import 'package:hoc081098_portfolio/widgets/home_info.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
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
                return ListTile(
                  onTap: () {},
                  leading: Icon(
                    headerItems[index].iconData,
                  ),
                  title: Text(
                    headerItems[index].title,
                    style: const TextStyle(),
                  ),
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
      body: _buildPage(),
    );
  }

  Widget _buildPage() {
    return Stack(
      children: [
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
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
                const HomeInfo(),
                Container(
                  height: 2000,
                  color: Colors.red,
                )
              ],
            ),
          ),
        ),
        const Header(),
      ],
    );
  }
}

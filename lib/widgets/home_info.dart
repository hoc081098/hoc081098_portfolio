import 'package:flutter/material.dart';
import 'package:flutter_provider/flutter_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoc081098_portfolio/main.dart';
import 'package:hoc081098_portfolio/utils/consts.dart';
import 'package:hoc081098_portfolio/utils/screen_helper.dart';
import 'package:hoc081098_portfolio/utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeInfo extends StatelessWidget {
  const HomeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .7 : .85);

    return Provider<double>.value(
      height,
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: ScreenHelper(
          tablet: () => const _TabletHomeInfo(),
          mobile: () => throw UnimplementedError(),
          desktop: () => const _DesktopHomeInfo(),
        ),
      ),
    );
  }
}

class _DesktopHomeInfo extends StatelessWidget {
  const _DesktopHomeInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ResponsiveWrapper(
        maxWidth: kDesktopMaxWidth,
        minWidth: kDesktopMaxWidth,
        defaultScale: false,
        child: Row(
          children: [
            const Expanded(
              child: _NameInfo(),
            ),
            Expanded(
              child: SvgPicture.asset(
                'assets/svg/guy.svg',
                semanticsLabel: 'Logo',
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TabletHomeInfo extends StatelessWidget {
  const _TabletHomeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ResponsiveWrapper(
        maxWidth: kTabletMaxWidth,
        minWidth: kTabletMaxWidth,
        defaultScale: false,
        child: Row(
          children: [
            const Expanded(
              child: _NameInfo(),
            ),
            Expanded(
              child: SvgPicture.asset(
                'assets/svg/guy.svg',
                semanticsLabel: 'Logo',
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _NameInfo extends StatelessWidget {
  const _NameInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.get(),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Mobile Application Developer',
                  style: GoogleFonts.josefinSans(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 18.0,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  'Petrus Nguyễn Thái Học'.toUpperCase(),
                  style: GoogleFonts.josefinSans(
                    fontSize: 36.0,
                    fontWeight: FontWeight.w900,
                    height: 1.3,
                    letterSpacing: 2.3,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Full-stack mobile software engineer, ',
                  style: TextStyle(
                    color: kCaptionColor,
                    fontSize: 15.0,
                    height: 1.0,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.location_on,
                      color: kCaptionColor,
                      size: 14,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      'Da Nang, Vietnam',
                      style: TextStyle(
                        color: kCaptionColor,
                        fontSize: 15.0,
                        height: 1.0,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Row(
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        height: 48.0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28.0,
                        ),
                        child: TextButton(
                          onPressed: () => openUrl(linkedInUrl),
                          child: const Text(
                            "Let's Talk",
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/flutter_bloc_pattern.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoc081098_portfolio/main.dart';
import 'package:hoc081098_portfolio/theme_bloc.dart';
import 'package:hoc081098_portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DesignProcess {
  final String title;
  final String imagePath;
  final String subtitle;

  const DesignProcess({
    required this.title,
    required this.imagePath,
    required this.subtitle,
  });
}

class MyJob {
  final String title;
  final IconData iconData;
  final Color color;

  const MyJob({
    required this.title,
    required this.iconData,
    required this.color,
  });
}

final myJobs = [
  MyJob(
    title: 'Mobile App Development',
    iconData: Icons.mobile_friendly,
    color: Colors.green.shade400,
  ),
  MyJob(
    title: 'Github Open Source',
    iconData: Icons.code,
    color: Colors.orange.shade400,
  ),
  MyJob(
    title: 'Technical Blog Writer',
    iconData: Icons.article,
    color: Colors.blue.shade400,
  ),
  MyJob(
    title: 'Backend Development',
    iconData: Icons.code,
    color: Colors.pink.shade400,
  ),
];

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ScreenHelper(
        desktop: () => const _ServicesSection(width: kDesktopMaxWidth),
        mobile: () => _ServicesSection(width: getMobileMaxWidth(context)),
        tablet: () => const _ServicesSection(width: kTabletMaxWidth),
      ),
    );
  }
}

class _ServicesSection extends StatelessWidget {
  final double width;

  const _ServicesSection({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'What I Do?',
            style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.w900,
              height: 1.3,
              fontSize: 35.0,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "I may not be perfect, but I'm surely of some help",
            style: GoogleFonts.josefinSans(
              color: kCaptionColor,
              fontSize: 14.0,
            ),
          ),
          SizedBox(
            height: ScreenHelper.isDesktop(context) ? 140 : 70,
          ),
          RxStreamBuilder<ThemeMode>(
            stream: context.bloc<ThemeBloc>().themeMode$,
            builder: (context, themeMode) {
              return Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  for (final e in myJobs)
                    _MyJobItem(themeMode: themeMode, job: e),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _MyJobItem extends StatelessWidget {
  final ThemeMode themeMode;
  final MyJob job;

  const _MyJobItem({
    super.key,
    required this.themeMode,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: themeMode == ThemeMode.dark
            ? const Color.fromARGB(75, 12, 12, 7)
            : Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: themeMode == ThemeMode.dark
                  ? Colors.grey[900]
                  : Colors.grey[200],
              borderRadius: BorderRadius.circular(80),
            ),
            child: Icon(
              job.iconData,
              color: job.color,
              size: 52,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            job.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.josefinSans(
              color: themeMode == ThemeMode.dark
                  ? Colors.grey[400]
                  : Colors.grey[800],
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          )
        ],
      ),
    );
  }
}

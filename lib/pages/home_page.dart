import 'package:flutter/material.dart';
import 'package:my_portafolio/theme/app_theme.dart';
import 'package:my_portafolio/utils/links.dart';
import 'package:my_portafolio/widgets/common.dart';
import 'package:my_portafolio/widgets/nav_bar.dart';
import 'package:my_portafolio/widgets/sections/about_section.dart';
import 'package:my_portafolio/widgets/sections/contact_section.dart';
import 'package:my_portafolio/widgets/sections/hero_section.dart';
import 'package:my_portafolio/widgets/sections/projects_section.dart';
import 'package:my_portafolio/widgets/sections/skills_section.dart';
import 'package:my_portafolio/widgets/sections/timeline_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scroll = ScrollController();
  final _keys = {for (final s in NavSection.values) s: GlobalKey()};

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  void _goTo(NavSection section) {
    final ctx = _keys[section]!.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
  }

  void _goTop() {
    _scroll.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
  }

  Widget _section(NavSection s, Widget child) =>
      PageSection(key: _keys[s], child: child);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.bg,
      endDrawer: NavDrawer(
        onSelect: (s) {
          Navigator.of(context).pop();
          _goTo(s);
        },
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scroll,
            child: Column(
              children: [
                const SizedBox(height: kNavHeight),
                HeroSection(
                  onProjects: () => _goTo(NavSection.projects),
                  onContact: () => _goTo(NavSection.contact),
                ),
                _section(NavSection.about, const AboutSection()),
                _section(NavSection.projects, const ProjectsSection()),
                _section(NavSection.skills, const SkillsSection()),
                _section(NavSection.timeline, const TimelineSection()),
                _section(NavSection.contact, const ContactSection()),
                const SiteFooter(),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(
              onNavigate: _goTo,
              onLogoTap: _goTop,
              onCvTap: openCv,
              onMenuTap: () => _scaffoldKey.currentState?.openEndDrawer(),
            ),
          ),
        ],
      ),
    );
  }
}

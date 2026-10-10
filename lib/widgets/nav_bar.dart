import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_portafolio/theme/app_theme.dart';
import 'package:my_portafolio/widgets/common.dart';

enum NavSection {
  about('Sobre mí'),
  projects('Proyectos'),
  skills('Habilidades'),
  timeline('Trayectoria'),
  contact('Contacto');

  const NavSection(this.label);
  final String label;
}

const double kNavHeight = 64;

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.onNavigate,
    required this.onLogoTap,
    required this.onCvTap,
    required this.onMenuTap,
  });

  final ValueChanged<NavSection> onNavigate;
  final VoidCallback onLogoTap;
  final VoidCallback onCvTap;
  final VoidCallback onMenuTap;

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.sizeOf(context).width < Breakpoints.mobile;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          height: kNavHeight,
          decoration: BoxDecoration(
            color: AppColors.bg.withValues(alpha: 0.82),
            border: const Border(bottom: BorderSide(color: AppColors.line)),
          ),
          child: ContentWidth(
            child: Row(
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: onLogoTap,
                    child: Semantics(
                      label: 'Ir al inicio',
                      child: Image.asset('assets/logo_lv.png', height: 26),
                    ),
                  ),
                ),
                const Spacer(),
                if (!mobile) ...[
                  for (final s in NavSection.values)
                    _NavLink(label: s.label, onTap: () => onNavigate(s)),
                  const SizedBox(width: 16),
                ],
                AppButton(
                  label: 'Hoja de vida',
                  icon: Icons.file_download_outlined,
                  compact: true,
                  onTap: onCvTap,
                ),
                if (mobile) ...[
                  const SizedBox(width: 4),
                  IconButton(
                    tooltip: 'Menú',
                    onPressed: onMenuTap,
                    icon: const Icon(Icons.menu_rounded, color: AppColors.fg),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  const _NavLink({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          margin: const EdgeInsets.only(left: 4),
          decoration: BoxDecoration(
            color: _hover ? AppColors.surface : AppColors.bg.withValues(alpha: 0),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            widget.label,
            style: AppText.body(
              15,
              color: _hover ? AppColors.fg : AppColors.muted,
              weight: FontWeight.w500,
              height: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}

/// Menú lateral para pantallas pequeñas.
class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key, required this.onSelect});
  final ValueChanged<NavSection> onSelect;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.bg,
      shape: const RoundedRectangleBorder(),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                tooltip: 'Cerrar',
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close_rounded, color: AppColors.fg),
              ),
            ),
            const SizedBox(height: 8),
            for (final s in NavSection.values)
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: Text(
                  s.label,
                  style: AppText.display(22, weight: FontWeight.w600, height: 1.3),
                ),
                onTap: () => onSelect(s),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_portafolio/theme/app_theme.dart';
import 'package:my_portafolio/utils/links.dart';
import 'package:my_portafolio/widgets/common.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final stacked = w < Breakpoints.mobile;

    final left = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('CONTACTO', style: AppText.eyebrow()),
        const SizedBox(height: 10),
        Text(
          '¿Tienes una vacante o un proyecto?',
          style: AppText.display(fluid(w * 0.06, 36, 64)),
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Text(
            'Busco prácticas o mi primer empleo como desarrollador. '
            'Escríbeme por correo o LinkedIn.',
            style: AppText.body(17),
          ),
        ),
        const SizedBox(height: 28),
        const _EmailRow(),
      ],
    );

    final right = Column(
      children: [
        _ContactLink(label: 'LinkedIn', handle: '/in/luis-vega', onTap: () => openUrl(Links.linkedin)),
        const SizedBox(height: 10),
        _ContactLink(label: 'GitHub', handle: '@Luis301311', onTap: () => openUrl(Links.github)),
        const SizedBox(height: 10),
        _ContactLink(label: 'Hoja de vida', handle: 'PDF', onTap: openCv),
      ],
    );

    return stacked
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [left, const SizedBox(height: 40), right],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(flex: 13, child: left),
              const SizedBox(width: 40),
              Expanded(flex: 10, child: right),
            ],
          );
  }
}

class _EmailRow extends StatefulWidget {
  const _EmailRow();

  @override
  State<_EmailRow> createState() => _EmailRowState();
}

class _EmailRowState extends State<_EmailRow> {
  bool _copied = false;

  Future<void> _copy() async {
    await Clipboard.setData(const ClipboardData(text: Links.email));
    if (!mounted) return;
    setState(() => _copied = true);
    await Future<void>.delayed(const Duration(milliseconds: 1600));
    if (mounted) setState(() => _copied = false);
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return Wrap(
      spacing: 12,
      runSpacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: openEmail,
            child: Text(
              Links.email,
              style: AppText.display(
                fluid(w * 0.03, 20, 28),
                weight: FontWeight.w600,
                height: 1.5,
                letterSpacing: -0.2,
              ).copyWith(
                decoration: TextDecoration.underline,
                decorationColor: AppColors.accent,
                decorationThickness: 2,
              ),
            ),
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: _copy,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: AppColors.line),
              ),
              child: Text(
                _copied ? 'Copiado' : 'Copiar',
                style: AppText.mono(12, color: _copied ? AppColors.ok : AppColors.muted),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ContactLink extends StatelessWidget {
  const _ContactLink({required this.label, required this.handle, required this.onTap});
  final String label;
  final String handle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      onTap: onTap,
      accentOnHover: true,
      radius: 12,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Row(
        children: [
          Text(label, style: AppText.body(16, color: AppColors.fg, weight: FontWeight.w600, height: 1.3)),
          const Spacer(),
          Text(handle, style: AppText.mono(12.5, color: AppColors.faint)),
        ],
      ),
    );
  }
}

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppText.mono(13, color: AppColors.faint);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 28),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.line)),
      ),
      child: ContentWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('© ${DateTime.now().year} Luis Vega', style: style),
            Text('Hecho con Flutter', style: style),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_portafolio/theme/app_theme.dart';

/// Centra el contenido con un ancho máximo y márgenes laterales.
class ContentWidth extends StatelessWidget {
  const ContentWidth({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: Breakpoints.maxContent),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: fluid(w * 0.04, 16, 40)),
          child: child,
        ),
      ),
    );
  }
}

/// Bloque de sección con línea superior y espaciado vertical uniforme.
class PageSection extends StatelessWidget {
  const PageSection({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.line)),
      ),
      padding: EdgeInsets.symmetric(vertical: fluid(w * 0.09, 64, 112)),
      child: ContentWidth(child: child),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.eyebrow,
    required this.title,
    this.subtitle,
  });

  final String eyebrow;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final heading = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(eyebrow.toUpperCase(), style: AppText.eyebrow()),
        const SizedBox(height: 10),
        Text(title, style: AppText.display(fluid(w * 0.046, 32, 48))),
      ],
    );
    final sub = subtitle == null
        ? null
        : ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Text(subtitle!, style: AppText.body(16)),
          );

    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: w < Breakpoints.tablet || sub == null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heading,
                if (sub != null) ...[const SizedBox(height: 14), sub],
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: heading),
                const SizedBox(width: 24),
                sub,
              ],
            ),
    );
  }
}

/// Botón principal (ámbar) o secundario (borde).
class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.primary = true,
    this.compact = false,
  });

  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  final bool primary;
  final bool compact;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final fgColor = widget.primary ? AppColors.onAccent : AppColors.fg;
    final Color bgColor = widget.primary
        ? (_hover ? AppColors.accentHover : AppColors.accent)
        : (_hover ? AppColors.surface : AppColors.bg);
    return Semantics(
      button: true,
      label: widget.label,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            transform: Matrix4.translationValues(0, _hover ? -1 : 0, 0),
            padding: widget.compact
                ? const EdgeInsets.symmetric(horizontal: 14, vertical: 9)
                : const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: widget.primary
                    ? bgColor
                    : (_hover ? AppColors.faint : AppColors.line),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.icon != null) ...[
                  Icon(widget.icon, size: 18, color: fgColor),
                  const SizedBox(width: 8),
                ],
                Text(
                  widget.label,
                  style: AppText.body(
                    widget.compact ? 14 : 15,
                    color: fgColor,
                    weight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Tarjeta con borde que se resalta y sube un poco al pasar el mouse.
class HoverCard extends StatefulWidget {
  const HoverCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(22),
    this.onTap,
    this.accentOnHover = false,
    this.radius = 14,
  });

  final Widget child;
  final EdgeInsets padding;
  final VoidCallback? onTap;
  final bool accentOnHover;
  final double radius;

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final hoverBorder =
        widget.accentOnHover ? AppColors.accent : AppColors.lineHover;
    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0, _hover ? -2 : 0, 0),
          padding: widget.padding,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(widget.radius),
            border: Border.all(color: _hover ? hoverBorder : AppColors.line),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

/// Etiqueta de tecnología en fuente monoespaciada.
class TagChip extends StatelessWidget {
  const TagChip(this.label, {super.key, this.background = AppColors.surface2});
  final String label;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.line),
      ),
      child: Text(label, style: AppText.mono(12, color: AppColors.fg)),
    );
  }
}

class TagList extends StatelessWidget {
  const TagList(this.tags, {super.key, this.background = AppColors.surface2});
  final List<String> tags;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: [for (final t in tags) TagChip(t, background: background)],
    );
  }
}

/// Enlace de texto con hover (cambia de color).
class TextLink extends StatefulWidget {
  const TextLink({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.trailingIcon,
    this.style,
    this.hoverColor = AppColors.accent,
  });

  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  final IconData? trailingIcon;
  final TextStyle? style;
  final Color hoverColor;

  @override
  State<TextLink> createState() => _TextLinkState();
}

class _TextLinkState extends State<TextLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final base = widget.style ??
        AppText.body(15, color: AppColors.muted, weight: FontWeight.w500);
    final color = _hover ? widget.hoverColor : base.color;
    return Semantics(
      link: true,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, size: 17, color: color),
                const SizedBox(width: 8),
              ],
              Text(widget.label, style: base.copyWith(color: color)),
              if (widget.trailingIcon != null) ...[
                const SizedBox(width: 6),
                Icon(widget.trailingIcon, size: 15, color: color),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

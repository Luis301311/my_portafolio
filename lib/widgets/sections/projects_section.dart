import 'package:flutter/material.dart';
import 'package:my_portafolio/data/portfolio_data.dart';
import 'package:my_portafolio/theme/app_theme.dart';
import 'package:my_portafolio/utils/links.dart';
import 'package:my_portafolio/widgets/common.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final stacked = MediaQuery.sizeOf(context).width < Breakpoints.tablet;
    final featured = projects.where((p) => p.featured).toList();
    final rest = projects.where((p) => !p.featured).toList();

    final children = <Widget>[
      for (final p in featured) _FeaturedCard(project: p, stacked: stacked),
    ];

    if (stacked) {
      children.addAll([for (final p in rest) _ProjectCard(project: p)]);
    } else {
      // Filas de dos tarjetas con la misma altura.
      for (var i = 0; i < rest.length; i += 2) {
        final second = i + 1 < rest.length ? rest[i + 1] : null;
        children.add(
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: _ProjectCard(project: rest[i], stretch: true)),
                const SizedBox(width: 20),
                Expanded(
                  child: second == null
                      ? const SizedBox.shrink()
                      : _ProjectCard(project: second, stretch: true),
                ),
              ],
            ),
          ),
        );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          eyebrow: 'Proyectos',
          title: 'Lo que he construido',
          subtitle:
              'Proyectos personales, académicos y para clientes, del móvil al servidor.',
        ),
        for (var i = 0; i < children.length; i++) ...[
          if (i > 0) const SizedBox(height: 20),
          children[i],
        ],
      ],
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project, this.stretch = false});
  final Project project;

  /// true cuando la tarjeta debe llenar la altura de su fila.
  final bool stretch;

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: stretch ? MainAxisSize.max : MainAxisSize.min,
        children: [
          _CardTop(project: project),
          const SizedBox(height: 14),
          Text(project.description, style: AppText.body(15.5)),
          const SizedBox(height: 14),
          TagList(project.tags),
          if (stretch) const Spacer(),
          if (project.link != null) ...[
            const SizedBox(height: 14),
            _LinkRow(link: project.link!),
          ],
        ],
      ),
    );
  }
}

class _FeaturedCard extends StatelessWidget {
  const _FeaturedCard({required this.project, required this.stacked});
  final Project project;
  final bool stacked;

  @override
  Widget build(BuildContext context) {
    final main = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CardTop(project: project, titleSize: 28),
        const SizedBox(height: 14),
        Text(project.description, style: AppText.body(15.5)),
        const SizedBox(height: 14),
        TagList(project.tags),
      ],
    );

    return HoverCard(
      padding: EdgeInsets.all(stacked ? 22 : 28),
      child: stacked
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [main, const SizedBox(height: 24), const _ArchDiagram()],
            )
          : Row(
              children: [
                Expanded(flex: 11, child: main),
                const SizedBox(width: 28),
                const Expanded(flex: 10, child: _ArchDiagram()),
              ],
            ),
    );
  }
}

class _CardTop extends StatelessWidget {
  const _CardTop({required this.project, this.titleSize = 22});
  final Project project;
  final double titleSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ProjectTile(project: project),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.title,
                style: AppText.display(titleSize, weight: FontWeight.w700, height: 1.15),
              ),
              const SizedBox(height: 4),
              Wrap(
                spacing: 10,
                runSpacing: 2,
                children: [
                  for (final m in project.meta)
                    Text(m, style: AppText.mono(12.5, color: AppColors.faint)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProjectTile extends StatelessWidget {
  const _ProjectTile({required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    final Widget child;
    final Color color;
    if (project.monogram != null) {
      color = AppColors.accent.withValues(alpha: 0.12);
      child = Text(
        project.monogram!,
        style: AppText.display(22, color: AppColors.accent, height: 1),
      );
    } else if (project.logoCover) {
      color = project.tileColor;
      child = Image.asset(project.logo!, fit: BoxFit.cover, width: 64, height: 64);
    } else {
      color = project.tileColor;
      child = Padding(
        padding: const EdgeInsets.all(8),
        child: Image.asset(project.logo!, fit: BoxFit.contain),
      );
    }

    return Container(
      width: 64,
      height: 64,
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: child,
    );
  }
}

class _LinkRow extends StatelessWidget {
  const _LinkRow({required this.link});
  final ProjectLink link;

  @override
  Widget build(BuildContext context) {
    final url = link.url;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 14),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.line)),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: url == null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.lock_outline_rounded, size: 15, color: AppColors.faint),
                  const SizedBox(width: 6),
                  Text(link.label, style: AppText.body(14, color: AppColors.faint)),
                ],
              )
            : TextLink(
                label: link.label,
                trailingIcon: Icons.north_east_rounded,
                hoverColor: AppColors.accentHover,
                style: AppText.body(14.5, color: AppColors.accent, weight: FontWeight.w600),
                onTap: () => openUrl(url),
              ),
      ),
    );
  }
}

/// Esquema de la arquitectura de OpticaSync en AWS.
class _ArchDiagram extends StatelessWidget {
  const _ArchDiagram();

  @override
  Widget build(BuildContext context) {
    Widget label(String t) =>
        Text(t.toUpperCase(), style: AppText.mono(11, color: AppColors.faint, letterSpacing: 1.3));
    Widget box(String t, {bool accent = false}) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: accent ? AppColors.accent.withValues(alpha: 0.5) : AppColors.line,
            ),
          ),
          child: Text(
            t,
            style: AppText.mono(12.5, color: accent ? AppColors.accent : AppColors.fg),
          ),
        );
    Widget arrow() => Text('→', style: AppText.mono(13, color: AppColors.faint));
    Widget row(List<Widget> c) => Wrap(
          spacing: 8,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: c,
        );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label('Arquitectura en AWS'),
          const SizedBox(height: 10),
          row([box('Usuario'), arrow(), box('Load Balancer', accent: true)]),
          const SizedBox(height: 14),
          label('VPC 10.0.0.0/16 · subredes privadas'),
          const SizedBox(height: 10),
          row([
            box('EC2 · Next.js'),
            arrow(),
            box('EC2 · FastAPI'),
            arrow(),
            box('PostgreSQL 16'),
          ]),
          const SizedBox(height: 10),
          row([box('NAT Gateway'), box('Bastion'), box('Docker Hub')]),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_portafolio/data/portfolio_data.dart';
import 'package:my_portafolio/theme/app_theme.dart';
import 'package:my_portafolio/widgets/common.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final columns = w < 560 ? 1 : (w < Breakpoints.tablet ? 2 : 3);

    // Rejilla separada por líneas de 1px (el fondo del contenedor es la línea).
    final rows = <Widget>[];
    for (var i = 0; i < skillGroups.length; i += columns) {
      final cells = <Widget>[];
      for (var c = 0; c < columns; c++) {
        if (c > 0) cells.add(const SizedBox(width: 1));
        final index = i + c;
        cells.add(
          Expanded(
            child: index < skillGroups.length
                ? _SkillCell(group: skillGroups[index])
                : const ColoredBox(color: AppColors.bg),
          ),
        );
      }
      if (rows.isNotEmpty) rows.add(const SizedBox(height: 1));
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: cells,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(eyebrow: 'Habilidades', title: 'Con qué trabajo'),
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: AppColors.line,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.line),
          ),
          child: Column(children: rows),
        ),
      ],
    );
  }
}

class _SkillCell extends StatelessWidget {
  const _SkillCell({required this.group});
  final SkillGroup group;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bg,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            group.title,
            style: AppText.body(15, color: AppColors.fg, weight: FontWeight.w600, height: 1.3),
          ),
          const SizedBox(height: 14),
          TagList(group.items, background: AppColors.surface),
        ],
      ),
    );
  }
}

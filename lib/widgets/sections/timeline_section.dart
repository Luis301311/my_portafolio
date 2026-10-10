import 'package:flutter/material.dart';
import 'package:my_portafolio/data/portfolio_data.dart';
import 'package:my_portafolio/theme/app_theme.dart';
import 'package:my_portafolio/widgets/common.dart';

class TimelineSection extends StatelessWidget {
  const TimelineSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final stacked = w < Breakpoints.mobile;
    const exp = _Timeline(title: 'Experiencia', entries: experience);
    const edu = _Timeline(title: 'Formación', entries: education);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(eyebrow: 'Trayectoria', title: 'Experiencia y formación'),
        if (stacked) ...[
          exp,
          const SizedBox(height: 48),
          edu,
        ] else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(child: exp),
              SizedBox(width: fluid(w * 0.06, 32, 72)),
              const Expanded(child: edu),
            ],
          ),
      ],
    );
  }
}

class _Timeline extends StatelessWidget {
  const _Timeline({required this.title, required this.entries});
  final String title;
  final List<TimelineEntry> entries;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(), style: AppText.eyebrow(color: AppColors.faint)),
        const SizedBox(height: 20),
        Container(
          decoration: const BoxDecoration(
            border: Border(left: BorderSide(color: AppColors.line)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < entries.length; i++)
                _TimelineItem(entry: entries[i], isLast: i == entries.length - 1),
            ],
          ),
        ),
      ],
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({required this.entry, required this.isLast});
  final TimelineEntry entry;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24, bottom: isLast ? 0 : 28),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Punto sobre la línea vertical
          Positioned(
            left: -29.5,
            top: 4,
            child: Container(
              width: 11,
              height: 11,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: entry.current ? AppColors.accent : AppColors.bg,
                border: Border.all(
                  color: entry.current ? AppColors.accent : AppColors.faint,
                  width: 2,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(entry.when, style: AppText.mono(13, color: AppColors.accent)),
              const SizedBox(height: 4),
              Text(
                entry.title,
                style: AppText.body(17, color: AppColors.fg, weight: FontWeight.w600, height: 1.35),
              ),
              if (entry.place != null)
                Text(
                  entry.place!,
                  style: AppText.body(15, color: AppColors.fg.withValues(alpha: 0.8)),
                ),
              if (entry.description != null) ...[
                const SizedBox(height: 6),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 520),
                  child: Text(entry.description!, style: AppText.body(15)),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

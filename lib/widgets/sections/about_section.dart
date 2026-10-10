import 'package:flutter/material.dart';
import 'package:my_portafolio/data/portfolio_data.dart';
import 'package:my_portafolio/theme/app_theme.dart';
import 'package:my_portafolio/widgets/common.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final stacked = w < Breakpoints.tablet;
    final body = AppText.body(17);
    final strong = AppText.body(17, color: AppColors.fg, weight: FontWeight.w600);

    final text = ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 620),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(style: body, children: [
              const TextSpan(text: 'Me interesa el '),
              TextSpan(text: 'desarrollo móvil y web de punta a punta', style: strong),
              const TextSpan(
                text: ': diseñar la interfaz, modelar la base de datos, exponer '
                    'la API y dejarla funcionando en un servidor. Mi herramienta '
                    'principal es ',
              ),
              TextSpan(text: 'Flutter', style: strong),
              const TextSpan(
                text: ', y en el backend trabajo con Node.js, NestJS y FastAPI.',
              ),
            ]),
          ),
          const SizedBox(height: 16),
          Text(
            'He construido apps para negocios reales, como un menú digital para '
            'restaurantes y un sistema de control de producción para una empresa '
            'de alimentos. También tengo formación técnica del SENA en diseño '
            'multimedia, que me ayuda a cuidar la experiencia de uso.',
            style: body,
          ),
          const SizedBox(height: 16),
          Text(
            'Trabajo bien en equipo con Git y Scrum, aprendo rápido y estoy '
            'mejorando mi inglés (nivel B1).',
            style: body,
          ),
        ],
      ),
    );

    const now = _NowCard();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          eyebrow: 'Sobre mí',
          title: 'Del aula a apps que la gente usa',
        ),
        if (stacked) ...[
          text,
          const SizedBox(height: 32),
          now,
        ] else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 13, child: text),
              SizedBox(width: fluid(w * 0.06, 32, 72)),
              const Expanded(flex: 10, child: now),
            ],
          ),
      ],
    );
  }
}

class _NowCard extends StatelessWidget {
  const _NowCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('EN QUÉ ESTOY AHORA', style: AppText.eyebrow(color: AppColors.faint)),
          for (final item in nowItems) ...[
            const SizedBox(height: 18),
            Text(item.title,
                style: AppText.body(16, color: AppColors.fg, weight: FontWeight.w600, height: 1.4)),
            const SizedBox(height: 2),
            Text(item.description, style: AppText.body(14.5, height: 1.5)),
          ],
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portafolio/theme/app_theme.dart';
import 'package:my_portafolio/utils/links.dart';
import 'package:my_portafolio/widgets/common.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.onProjects,
    required this.onContact,
  });

  final VoidCallback onProjects;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final stacked = w < Breakpoints.tablet;
    final text = _HeroText(onProjects: onProjects, onContact: onContact);

    return Padding(
      padding: EdgeInsets.only(
        top: fluid(w * 0.09, 48, 104),
        bottom: fluid(w * 0.08, 56, 96),
      ),
      child: ContentWidth(
        child: stacked
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: const _Portrait(),
                  ),
                  const SizedBox(height: 40),
                  text,
                ],
              )
            : Row(
                children: [
                  Expanded(flex: 135, child: text),
                  SizedBox(width: fluid(w * 0.06, 32, 80)),
                  const Expanded(
                    flex: 100,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: _Portrait(),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _HeroText extends StatelessWidget {
  const _HeroText({required this.onProjects, required this.onContact});
  final VoidCallback onProjects;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final nameSize = fluid(w * 0.095, 56, 112);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Estado de disponibilidad
        Container(
          padding: const EdgeInsets.fromLTRB(10, 6, 12, 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: AppColors.line),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const PulsingDot(),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  'Disponible para prácticas y primer empleo',
                  style: AppText.mono(13),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        Text.rich(
          TextSpan(
            text: 'Luis\nVega',
            children: [
              TextSpan(
                text: '.',
                style: AppText.display(nameSize, color: AppColors.accent),
              ),
            ],
          ),
          style: AppText.display(
            nameSize,
            height: 0.95,
            letterSpacing: -nameSize * 0.035,
          ),
        ),
        const SizedBox(height: 22),
        Text(
          'Desarrollador Flutter y full stack',
          style: AppText.display(
            fluid(w * 0.024, 20, 26),
            weight: FontWeight.w600,
            height: 1.25,
            letterSpacing: -0.2,
          ),
        ),
        const SizedBox(height: 14),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Text(
            'Construyo apps con Flutter y las llevo hasta producción: APIs con '
            'NestJS y FastAPI, bases de datos y despliegue con Docker en AWS. '
            'Estudiante de décimo semestre de Ingeniería de Sistemas en la '
            'Universidad Popular del Cesar.',
            style: AppText.body(17),
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            AppButton(label: 'Ver proyectos', onTap: onProjects),
            AppButton(label: 'Contactarme', onTap: onContact, primary: false),
          ],
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 20,
          runSpacing: 12,
          children: [
            TextLink(
              label: 'GitHub',
              icon: FontAwesomeIcons.github,
              onTap: () => openUrl(Links.github),
            ),
            TextLink(
              label: 'LinkedIn',
              icon: FontAwesomeIcons.linkedin,
              onTap: () => openUrl(Links.linkedin),
            ),
          ],
        ),
      ],
    );
  }
}

/// Foto con un marco ámbar desplazado detrás.
class _Portrait extends StatelessWidget {
  const _Portrait();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 380),
      child: Padding(
        padding: const EdgeInsets.only(right: 18, bottom: 18),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 18,
              top: 18,
              right: -18,
              bottom: -18,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.accent, width: 2),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: AspectRatio(
                aspectRatio: 720 / 946,
                child: Image.asset(
                  'assets/foto_perfil.jpg',
                  fit: BoxFit.cover,
                  semanticLabel: 'Foto de Luis Vega',
                ),
              ),
            ),
            Positioned(
              left: 16,
              bottom: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.bg.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.location_on_outlined,
                        size: 15, color: AppColors.accent),
                    const SizedBox(width: 8),
                    Text('Valledupar, Colombia',
                        style: AppText.mono(13, color: AppColors.fg)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Punto verde que "late" para indicar disponibilidad.
class PulsingDot extends StatefulWidget {
  const PulsingDot({super.key});

  @override
  State<PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<PulsingDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2400),
  )..repeat();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    return AnimatedBuilder(
      animation: _c,
      builder: (context, _) {
        final t = reduceMotion ? 1.0 : _c.value;
        final p = (t / 0.7).clamp(0.0, 1.0);
        final active = t < 0.7;
        return Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.ok,
            boxShadow: [
              BoxShadow(
                color: AppColors.ok
                    .withValues(alpha: active ? 0.6 * (1 - p) : 0),
                spreadRadius: active ? 8 * p : 0,
              ),
            ],
          ),
        );
      },
    );
  }
}

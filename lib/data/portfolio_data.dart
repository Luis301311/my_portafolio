import 'package:flutter/material.dart';

/// Todo el contenido del portafolio vive aquí: para agregar un proyecto,
/// una habilidad o una experiencia solo se edita este archivo.

class ProjectLink {
  const ProjectLink(this.label, [this.url]);
  final String label;

  /// Si es null se muestra como texto sin enlace (ej. "Sin demo pública").
  final String? url;
}

class Project {
  const Project({
    required this.title,
    required this.meta,
    required this.description,
    required this.tags,
    this.logo,
    this.monogram,
    this.tileColor = const Color(0xFFEFEBE2),
    this.logoCover = false,
    this.link,
    this.repo,
    this.featured = false,
  });

  final String title;
  final List<String> meta;
  final String description;
  final List<String> tags;
  final String? logo;
  final String? monogram;
  final Color tileColor;
  final bool logoCover;
  final ProjectLink? link;

  /// Enlace al código (GitHub). Se muestra junto a [link].
  final ProjectLink? repo;
  final bool featured;
}

const projects = <Project>[
  Project(
    title: 'OpticaSync Pro',
    meta: ['Web · API · Móvil', 'Proyecto en equipo'],
    description:
        'Sistema de gestión para ópticas con web en Next.js, API en FastAPI y '
        'app móvil en Flutter sobre PostgreSQL. Me encargué de llevarlo a '
        'producción en AWS: imágenes Docker, red privada, balanceador de carga '
        'y migración de los datos reales.',
    tags: ['Flutter', 'Next.js', 'FastAPI', 'PostgreSQL', 'Docker', 'AWS'],
    monogram: 'OS',
    featured: true,
  ),
  Project(
    title: 'La Carta',
    meta: ['Web · API', 'SaaS para restaurantes', 'En producción'],
    description:
        'Plataforma multi-restaurante de menú digital y pedidos. Cada negocio '
        'administra su menú, horarios, color de marca y pagos (efectivo o '
        'transferencia Bre-B con comprobante) desde un panel, y gestiona los '
        'pedidos casi en tiempo real con avisos por WhatsApp. Migré el proyecto '
        'de Firebase a una API en NestJS con PostgreSQL, roles con JWT, '
        'migraciones y almacenamiento de imágenes intercambiable (puertos y '
        'adaptadores), desplegada en Render, Neon y Cloudinary.',
    tags: ['Flutter', 'GetX', 'NestJS', 'TypeORM', 'PostgreSQL', 'JWT', 'Cloudinary', 'Render'],
    logo: 'assets/la_carta_icon.png',
    logoCover: true,
    link: ProjectLink('Ver demo en vivo', 'https://lacarta-web.onrender.com/burger_house'),
    repo: ProjectLink('Código', 'https://github.com/Luis301311/la_carta'),
  ),
  Project(
    title: 'ProdTrack',
    meta: ['Android · Web', 'Empresa de alimentos'],
    description:
        'Control de producción para una empresa de alimentos: insumos, procesos, '
        'inventario, personal y reportes, todo desde el celular.',
    tags: ['Flutter', 'Dart'],
    logo: 'assets/iconoProdTrack.png',
    link: ProjectLink('Sin demo pública'),
  ),
  Project(
    title: 'Labs Simulations',
    meta: ['Web', 'Educación'],
    description:
        'Plataforma educativa con laboratorios virtuales de física. Los '
        'estudiantes experimentan con circuitos en serie y en paralelo y siguen '
        'guías de aprendizaje.',
    tags: ['React', 'JavaScript'],
    logo: 'assets/logoLabsSimulations.png',
    link: ProjectLink(
      'Documentación',
      'https://drive.google.com/file/d/1lWjpxWIaOuEsqqxI7fjt3LaOdnOxrM9V/view?usp=sharing',
    ),
  ),
  Project(
    title: 'Inv Management',
    meta: ['Escritorio · Windows'],
    description:
        'Sistema de inventarios: registro de productos, entradas y salidas, '
        'control de existencias y reportes en tiempo real.',
    tags: ['C#'],
    logo: 'assets/invManementLogo.png',
    tileColor: Color(0xFF2F4956),
    link: ProjectLink(
      'Documentación',
      'https://drive.google.com/file/d/16X7xEjTi0UFMptA1DDa6BEbBxxklLT37/view?usp=sharing',
    ),
  ),
];

class SkillGroup {
  const SkillGroup(this.title, this.items);
  final String title;
  final List<String> items;
}

const skillGroups = <SkillGroup>[
  SkillGroup('Móvil', ['Flutter', 'Dart', 'GetX', 'Firebase']),
  SkillGroup('Backend y APIs', ['Node.js', 'NestJS', 'FastAPI', 'C#', 'Python']),
  SkillGroup('Web', ['TypeScript', 'JavaScript', 'React', 'HTML', 'CSS']),
  SkillGroup('Bases de datos', ['MySQL', 'PostgreSQL', 'Oracle', 'Firestore']),
  SkillGroup('Infraestructura', ['Docker', 'AWS', 'Linux', 'Bash', 'Windows Server']),
  SkillGroup('Forma de trabajo', ['Git · GitHub · GitLab', 'Scrum', 'POO', 'MVC', 'Power BI']),
];

class TimelineEntry {
  const TimelineEntry({
    required this.when,
    required this.title,
    this.place,
    this.description,
    this.current = false,
  });
  final String when;
  final String title;
  final String? place;
  final String? description;
  final bool current;
}

const experience = <TimelineEntry>[
  TimelineEntry(
    when: 'Feb 2025 – hoy',
    title: 'Operador de Medios Tecnológicos',
    description:
        'Monitoreo de sistemas de videovigilancia y alarmas, reporte de '
        'incidentes en tiempo real y apoyo en control de accesos con '
        'tecnologías de seguridad.',
    current: true,
  ),
  TimelineEntry(
    when: 'En paralelo',
    title: 'Proyectos independientes',
    description:
        'Apps a medida para pequeños negocios: menú digital para restaurantes '
        'y control de producción para una empresa de alimentos.',
  ),
];

const education = <TimelineEntry>[
  TimelineEntry(
    when: '2021 – hoy',
    title: 'Ingeniería de Sistemas',
    place: 'Universidad Popular del Cesar · décimo semestre',
    current: true,
  ),
  TimelineEntry(when: '2025', title: 'Auxiliar de Sistemas', place: 'UPARSISTEM'),
  TimelineEntry(
    when: '2022',
    title: 'Técnico en Diseño e Integración de Multimedia',
    place: 'SENA',
  ),
];

class NowItem {
  const NowItem(this.title, this.description);
  final String title;
  final String description;
}

const nowItems = <NowItem>[
  NowItem(
    'Proyecto de grado',
    'Plataforma de realidad virtual para visualizar fenómenos electromagnéticos en circuitos.',
  ),
  NowItem(
    'Despliegue en la nube',
    'Arquitectura en AWS con VPC, balanceador de carga y contenedores Docker.',
  ),
  NowItem(
    'Micro frontends',
    'Módulos independientes con Web Components (Lit) que se comunican por eventos.',
  ),
];

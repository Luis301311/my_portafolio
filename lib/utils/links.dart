import 'package:url_launcher/url_launcher.dart';

class Links {
  static const email = 'luisvm301@gmail.com';
  static const github = 'https://github.com/Luis301311';
  static const linkedin = 'https://linkedin.com/in/luis-vega-26836b224';

  /// Archivo dentro de la carpeta web/ (se publica junto al sitio).
  static const cvFile = 'hoja_de_vida_luis_vega.pdf';
}

Future<void> openUrl(String url) async {
  if (url.isEmpty) return;
  await launchUrl(Uri.parse(url), webOnlyWindowName: '_blank');
}

Future<void> openEmail() async {
  await launchUrl(
    Uri(
      scheme: 'mailto',
      path: Links.email,
      query: 'subject=Contacto%20desde%20tu%20portafolio',
    ),
  );
}

/// Abre la hoja de vida en una pestaña nueva.
Future<void> openCv() async {
  await launchUrl(Uri.base.resolve(Links.cvFile), webOnlyWindowName: '_blank');
}

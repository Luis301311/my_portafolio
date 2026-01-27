import 'package:url_launcher/url_launcher.dart';

Future <void> openUrl(String url) async{
  final Uri uri = Uri.parse(url);
  if(!await launchUrl(uri, mode: LaunchMode.externalApplication)){
    throw 'No  se Pudo abri $url'; 
  }
}


Future<void> openEmail() async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: 'Luisvm301@gmail.com',
    query: 'subject=Contacto&body=Hola Luis',
  );

  if (!await launchUrl(emailUri)) {
    throw 'No se pudo abrir el correo';
  }
}
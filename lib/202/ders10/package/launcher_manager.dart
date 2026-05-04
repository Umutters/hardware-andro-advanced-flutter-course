import 'package:url_launcher/url_launcher.dart';

mixin LaunchMixin {
  Future<void> launchUrl_(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> launchSms(Uri smsUri) async {
    if (!await launchUrl(smsUri)) {
      throw Exception('Could not launch SMS');
    }
  }

  Future<void> launchPhone(Uri phoneUri) async {
    if (!await launchUrl(phoneUri)) {
      throw Exception('Could not launch phone');
    }
  }

  Future<void> launchEmail(Uri emailUri) async {
    if (!await launchUrl(emailUri)) {
      throw Exception('Could not launch email');
    }
  }
}

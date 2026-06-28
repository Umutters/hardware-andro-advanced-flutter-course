import 'package:hwa_learn/202/ders11/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);
  Future<void> toShare(Uri path) async {
    await launchUrl(path);
  }
}

class FileDownload extends IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem != null) throw CustomException();
    print("a");
    return true;
  }
}

class SmsDownload implements IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    print("sms");
    return true;
  }

  @override
  Future<void> toShare(Uri path) async {
    await launchUrl(Uri.parse("sms:${path.toString()}"));
  }
}

class FileItem {
  String name;
  FileItem(this.name);
}

import 'package:flutter/material.dart';

class DownloadProvider with ChangeNotifier {
  bool _isDownloading = false;
  double _downloadProgress = 0.0;

  bool get isDownloading => _isDownloading;
  double get downloadProgress => _downloadProgress;

  // Start the download process
  void startDownloading() {
    _isDownloading = true;
    _downloadProgress = 0.0;
    notifyListeners();
  }

  // Update the progress
  void updateProgress(double progress) {
    _downloadProgress = progress;
    notifyListeners();
  }

  // Finish the download process
  void finishDownloading() {
    _isDownloading = false;
    _downloadProgress = 1.0;
    notifyListeners();
  }
}

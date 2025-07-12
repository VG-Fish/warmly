import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';

class AudioRecorderButton extends StatefulWidget {
  const AudioRecorderButton({super.key});

  @override
  State<AudioRecorderButton> createState() => _AudioRecorderButtonState();
}

class _AudioRecorderButtonState extends State<AudioRecorderButton> {
  final _record = AudioRecorder();
  bool _isRecording = false;

  Future<String> _getFilePath() async {
    final dir = await getApplicationDocumentsDirectory();
    return '${dir.path}/recording_${DateTime.now().millisecondsSinceEpoch}.m4a';
  }

  Future<void> _toggleRecording() async {
    final hasPermission = await _record.hasPermission();
    print("Microphone permission: $hasPermission");

    if (hasPermission) {
      if (_isRecording) {
        final path = await _record.stop();
        print("Stopped recording");
        print("Saved path: $path");

        setState(() => _isRecording = false);
      } else {
        final path = await _getFilePath();

        try {
          await _record.start(RecordConfig(), path: path);
          print("Started recording at: $path");

          setState(() => _isRecording = true);
        } catch (e) {
          print("Error starting recording: $e");
        }
      }
    } else {
      print("No microphone permissions.");
    }
  }

  @override
  void dispose() {
    _record.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(_isRecording ? Icons.stop : Icons.mic),
      color: _isRecording ? Colors.red : Colors.black,
      iconSize: 40,
      onPressed: _toggleRecording,
    );
  }
}

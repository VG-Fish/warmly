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
    if (await _record.hasPermission()) {
      if (_isRecording) {
        final path = await _record.stop();
        setState(() => _isRecording = false);
        print('Recording saved to: $path');
      } else {
        final path = await _getFilePath();
        await _record.start(RecordConfig(), path: path);
        setState(() => _isRecording = true);
      }
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

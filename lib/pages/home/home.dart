import 'package:flutter/material.dart';

import 'package:warmly/pages/home/components/audio_recorder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Icon(Icons.chat, color: Colors.orange),
              SizedBox(width: 8),
              Transform.translate(
                offset: Offset(-1, -3),
                child: Text("Warmly", style: TextStyle(fontSize: 25)),
              ),
            ],
          ),
        ),
        actions: [AudioRecorderButton()],
      ),
    );
  }
}

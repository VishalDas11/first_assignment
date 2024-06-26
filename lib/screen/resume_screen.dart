import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/services.dart'; // For copying text to clipboard

class ResumeScreen extends StatelessWidget {
  final TextEditingController resumeController = TextEditingController(); // To manage text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resume Screen')),
      body: SingleChildScrollView( // Allow scrolling for long resumes
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: resumeController,
              maxLines: null, // Allow for multi-line input
              decoration: const InputDecoration(
                hintText: 'Enter your resume content here...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Clipboard.setData(ClipboardData.text!(resumeController.text));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Resume copied to clipboard!')),
                );
              },
              child: const Text('Copy Resume'),
            ),
          ],
        ),
      ),
    );
  }
}

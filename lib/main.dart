import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Form',
      debugShowCheckedModeBanner: false,
      home: const MiniFormPage(),
    );
  }
}

class MiniFormPage extends StatefulWidget {
  const MiniFormPage({super.key});

  @override
  State<MiniFormPage> createState() => _MiniFormPageState();
}

class _MiniFormPageState extends State<MiniFormPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mini Form')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Full Name Field
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),

                  // Message Field
                  TextFormField(
                    controller: messageController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Message',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Submit Button
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Form is valid (no preview logic)
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Form submitted')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

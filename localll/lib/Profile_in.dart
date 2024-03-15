import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localllllll/main_screen.dart';
import 'package:localllllll/profile.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final picker = ImagePicker();
  File? image;

  Future<void> _picker() async {
    var interImage = await picker.pickImage(source: ImageSource.gallery);
    image = File(interImage!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profile(),
                  ));
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                _picker();
              },
              child: const CircleAvatar(
                radius: 60,
                child: Icon(Icons.person),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                prefixIcon: const Icon(
                  Icons.person,
                  size: 30,
                ),
                label: const Text("Name"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  prefixIcon: const Icon(
                    Icons.mail,
                    size: 30,
                  ),
                  label: const Text("Email")),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              maxLength: 8,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                prefixIcon: const Icon(
                  Icons.password,
                  size: 30,
                ),
                label: const Text("Password"),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton(
                style: TextButton.styleFrom(
                  fixedSize: const Size(140, 70),
                  backgroundColor: Colors.cyan[100],
                ),
                onPressed: () {
                  _nameController.clear();
                  _emailController.clear();
                  _passwordController.clear();
                },
                child: const Text('Save changes')),
          ],
        ),
      ),
    );
  }
}

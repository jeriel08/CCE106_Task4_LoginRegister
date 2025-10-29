import 'package:flutter/material.dart';
import 'package:login_register/pages/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _civilStatusController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();

  void _register() {
    if (_fullNameController.text.isEmpty ||
        _usernameController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty ||
        _genderController.text.isEmpty ||
        _civilStatusController.text.isEmpty ||
        _birthdateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );

      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Passwords do not match')));

      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sanao Activity 2',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _fullNameController,
              decoration: _inputDecoration('Full Name', Icons.person),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _usernameController,
              decoration: _inputDecoration('Username', Icons.account_circle),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _passwordController,
              decoration: _inputDecoration('Password', Icons.lock),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _confirmPasswordController,
              decoration: _inputDecoration('Confirm Password', Icons.lock),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _genderController,
              decoration: _inputDecoration('Gender', Icons.wc),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _civilStatusController,
              decoration: _inputDecoration('Civil Status', Icons.group),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _birthdateController,
              decoration: _inputDecoration('Birthdate', Icons.cake),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime(2025),
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                );

                if (pickedDate != null) {
                  setState(() {
                    _birthdateController.text =
                        "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                  });
                }
              },
            ),
            const SizedBox(height: 35),

            ElevatedButton(
              onPressed: _register,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
              ),
              child: const Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

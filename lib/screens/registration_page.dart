import 'package:block_folio/models/user_model.dart';
import 'package:block_folio/view_models/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  UserEntity user = UserEntity();

  Widget build(BuildContext context) {
    final loginVM = Provider.of<LoginViewModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
        elevation: 2,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                    onChanged: (value) {
                      user.name = value;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    onChanged: loginVM.setPassword,
                    obscureText: true,
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    onChanged: (value) {
                      user.email = value;
                      loginVM.setEmail(value);
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone Number',
                    ),
                    onChanged: (value) {
                      user.phoneNumber = value;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  FilledButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Register"),
                        SizedBox(width: 8.0),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                    onPressed: () {
                      loginVM.register(context, user);
                    },
                  ),
                ],
              ),
            ),
          ),
          if (loginVM.isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}

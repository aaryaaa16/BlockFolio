import 'package:block_folio/view_models/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginVM = Provider.of<LoginViewModel>(context);

    Widget loginUI() => Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16.0),
                    Text("Welcome to",
                        style: Theme.of(context).textTheme.titleMedium),
                    Text("BlockFolio",
                        style: Theme.of(context).textTheme.displayMedium),
                    const SizedBox(height: 24.0),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Username',
                              ),
                              onChanged: loginVM.setEmail,
                            ),
                            SizedBox(height: 16.0),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                              ),
                              obscureText: true,
                              onChanged: loginVM.setPassword,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () async {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: const Text('Sign Up'),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: FilledButton(
                              onPressed: () async {
                                await loginVM.login(context);
                              },
                              child: const Text('Login'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Forgot Password?"),
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
        );

    Widget profileUI() => SingleChildScrollView(
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 144,
                      ),
                      Text(
                        loginVM.currentUser?.name ?? "No Name",
                        style: Theme.of(context).textTheme.displaySmall,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 8.0),
                child: Divider(),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                      ),
                      const SizedBox(width: 16.0),
                      Text(
                        loginVM.currentUser?.phoneNumber ?? "No Phone Number",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.email,
                      ),
                      const SizedBox(width: 16.0),
                      Text(
                        loginVM.currentUser?.email ?? "No Email",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 2,
        actions: [
          if (loginVM.currentUser != null)
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await loginVM.logOut(context);
              },
            ),
        ],
      ),
      body: loginVM.currentUser == null ? loginUI() : profileUI(),
    );
  }
}

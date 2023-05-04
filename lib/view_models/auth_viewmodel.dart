import 'package:block_folio/models/user_model.dart';
import 'package:block_folio/services/firebase_manager.dart';
import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  String _email = '';
  String _password = '';

  String get username => _email;
  String get password => _password;

  bool isLoading = false;
  String? errorDescription;

  UserEntity? currentUser;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final auth = FirebaseManager.auth;
    try {
      final userCredentials = await auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      if (userCredentials.user != null) {
        String uid = userCredentials.user!.uid;
        final ref = FirebaseManager.firestore
            .collection('users')
            .doc(uid)
            .withConverter(
              fromFirestore: UserEntity.fromFirestore,
              toFirestore: (UserEntity user, _) => user.toFirestore(),
            );
        final userDocSnap = await ref.get();
        final userEntity = userDocSnap.data();

        if (userEntity == null) {
          throw Exception("User data not found");
        } else {
          currentUser = userEntity;
        }
      } else {
        throw Exception("User is null");
      }
    } catch (e) {
      errorDescription = e.toString();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.errorContainer,
            title: Text("Error"),
            content: Text(errorDescription ?? "Unknown error"),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> logOut(BuildContext context) async {
    final auth = FirebaseManager.auth;

    try {
      await auth.signOut();
      currentUser = null;
      notifyListeners();
    } catch (e) {
      errorDescription = e.toString();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.errorContainer,
            title: Text("Error"),
            content: Text(errorDescription ?? "Unknown error"),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> register(BuildContext context, UserEntity user) async {
    final auth = FirebaseManager.auth;
    isLoading = true;
    notifyListeners();

    try {
      final userCredentials = await auth.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      if (userCredentials.user != null) {
        String uid = userCredentials.user!.uid;
        currentUser = user;
        Navigator.of(context).pop();
        isLoading = false;
        notifyListeners();
        final userDocRef = FirebaseManager.firestore
            .collection('users')
            .withConverter(
              fromFirestore: UserEntity.fromFirestore,
              toFirestore: (UserEntity user, _) => user.toFirestore(),
            )
            .doc(uid);
        await userDocRef.set(user);
      } else {
        throw Exception("User is null");
      }
    } catch (e) {
      errorDescription = e.toString();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.errorContainer,
            title: Text("Error"),
            content: Text(errorDescription ?? "Unknown error"),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }
}

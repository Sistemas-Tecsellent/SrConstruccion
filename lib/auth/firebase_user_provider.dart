import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SrConstruccionFirebaseUser {
  SrConstruccionFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

SrConstruccionFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SrConstruccionFirebaseUser> srConstruccionFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<SrConstruccionFirebaseUser>(
            (user) => currentUser = SrConstruccionFirebaseUser(user));

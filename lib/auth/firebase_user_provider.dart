import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SrConstruccionActiveFirebaseUser {
  SrConstruccionActiveFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

SrConstruccionActiveFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SrConstruccionActiveFirebaseUser>
    srConstruccionActiveFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<SrConstruccionActiveFirebaseUser>(
            (user) => currentUser = SrConstruccionActiveFirebaseUser(user));

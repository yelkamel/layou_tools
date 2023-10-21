part of layou_tools;

class Auth {
  static String get uid => FirebaseAuth.instance.currentUser!.uid;
  static String get email => FirebaseAuth.instance.currentUser!.email!;
  static String get displayName =>
      FirebaseAuth.instance.currentUser!.displayName!;
  static bool get isUserConnected => FirebaseAuth.instance.currentUser != null;

  static Stream<bool> isUserConnectedStream() => FirebaseAuth.instance
      .authStateChanges()
      .map<bool>((event) => event != null);

  static Stream<User?> get userAuthStream =>
      FirebaseAuth.instance.authStateChanges();

  static bool get isAnonymous => FirebaseAuth.instance.currentUser!.isAnonymous;

  static Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> setPersistence() async {
    try {
      await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> logInWithEmailPassword(String email, String pwd) async {
    try {
      final UserCredential res =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pwd,
      );
      return res.user != null;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> registerWithEmailPassword(
      String email, String pwd) async {
    try {
      final res = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pwd,
      );
      return res.user != null;
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> updateDisplayName(String name) async {
    if (FirebaseAuth.instance.currentUser != null) {
      try {
        await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      } catch (e) {
        rethrow;
      }
    }
  }

  static Future<void> updateEmail(String email) async {
    if (FirebaseAuth.instance.currentUser != null) {
      try {
        await FirebaseAuth.instance.currentUser!.updateEmail(email);
      } catch (e) {
        rethrow;
      }
    }
  }

  static Future<void> loginUserAnonymously() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      try {
        await FirebaseAuth.instance.signInAnonymously();
      } catch (e) {
        rethrow;
      }
    }
  }

  static Future<void> signInWithCredential(AuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> upgradeAnonymWithEmailPassword(
    String email,
    String password,
  ) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return false;

    try {
      final credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      await FirebaseAuth.instance.currentUser!.linkWithCredential(
        credential,
      );
      return true;
    } catch (e) {
      rethrow;
    }
  }
}

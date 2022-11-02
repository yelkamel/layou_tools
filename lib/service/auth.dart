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

  static Future<void> signOut() => FirebaseAuth.instance.signOut();

  static Future<void> setPersistence() =>
      FirebaseAuth.instance.setPersistence(Persistence.LOCAL);

  static Future<bool> logInWithEmailPassword(String email, String pwd) async {
    try {
      final UserCredential res =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pwd,
      );
      return res.user != null;
    } catch (e) {
      String msg = e.toString();

      if (msg.contains("user-not-found")) {
        msg = "Cet email est incorrect:\n$email";
      } else if (msg.contains("wrong-password")) {
        msg = "Le mot de passe est incorrect.";
      } else if (msg.contains("network-request-failed")) {
        msg =
            "Erreur de connexion avec le serveur.\nÊtes-vous connecté à internet?";
      } else if (msg.contains("too-many-requests")) {
        msg = "Trop de tentatives refusées. Réessayez plus tard.";
      }
      throw msg;
    }
  }

  static Future<bool> registerWithEmailPassword(
      String email, String pwd) async {
    try {
      final UserCredential res =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pwd,
      );
      return res.user != null;
    } catch (e) {
      String msg = e.toString();
      if (msg.contains("email-already-in-use")) {
        msg = "L'email utilisé est déjà associé à un compte.";
      } else if (msg.contains("network-request-failed")) {
        msg =
            "Erreur de connexion avec le serveur.\nÊtes-vous connecté à internet?";
      }
      throw msg;
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
      FirebaseAuth.instance.currentUser!.updateDisplayName(name);
    }
  }

  static Future<void> updateEmail(String email) async {
    if (FirebaseAuth.instance.currentUser != null) {
      FirebaseAuth.instance.currentUser!.updateEmail(email);
    }
  }
}

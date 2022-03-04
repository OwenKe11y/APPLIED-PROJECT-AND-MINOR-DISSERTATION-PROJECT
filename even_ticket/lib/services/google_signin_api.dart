import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() {
    // Return null to prevent further exceptions if googleSignInAccount is null

    return _googleSignIn.signIn().catchError((onError) => print(onError));
  }

  // Return null to prevent further exceptions if googleSignInAccount is null

  static Future logout() => _googleSignIn.disconnect();
}

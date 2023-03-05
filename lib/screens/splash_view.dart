import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_first_app/screens/welcome_user.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late FirebaseAuth _auth;

  bool isUserSignedIn = false;
  bool isUserSignedInFacebook = false;

  @override
  void initState() {
    super.initState();

    initApp();
  }

  void initApp() async {
    FirebaseApp defaultApp = await Firebase.initializeApp();
    _auth = FirebaseAuth.instanceFor(app: defaultApp);
    checkIfUserIsSignedIn();
  }

  void checkIfUserIsSignedIn() async {
    var userSignedIn = await _googleSignIn.isSignedIn();
    AccessToken? accessToken = await FacebookAuth.instance.accessToken;

    setState(() {
      isUserSignedIn = userSignedIn;
      if (accessToken != null) {
        isUserSignedInFacebook = true;
      } else {
        isUserSignedInFacebook = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 35, right: 35, top: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset(
                  'assets/images/all4mypet_logo.png',
                  width: 250,
                  height: 250,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: OutlinedButton.icon(
                  icon: const FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xff3f68ec),
                    minimumSize: const Size(double.infinity, 50),
                    shape: (RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
                  ),
                  onPressed: () {
                    onGoogleSignIn(context);
                  },
                  label: Text(
                    isUserSignedIn
                        ? 'Continuar con Google'
                        : 'Acceder con Google',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: OutlinedButton.icon(
                  icon: const FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xff384e9f),
                    minimumSize: const Size(double.infinity, 50),
                    shape: (RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
                  ),
                  onPressed: () {
                    signInWithFacebook(context);
                  },
                  label: Text(
                    isUserSignedInFacebook
                        ? 'Continuar con Facebook'
                        : 'Acceder con Facebook',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: OutlinedButton.icon(
                  icon: const FaIcon(
                    FontAwesomeIcons.envelope,
                    color: Colors.grey,
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xff65686e),
                    backgroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: (RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
                    side: const BorderSide(
                      width: 2,
                      color: Color(0xff65686e),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  label: const Text(
                    'Registrarse con e-mail',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  FacebookAuth.instance.logOut();
                  _googleSignIn.signOut();
                  setState(() {
                    isUserSignedIn = false;
                    isUserSignedInFacebook = false;
                  });
                },
                child: const Text(
                  'Entrar como invitado',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffe73f6a)),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Entrar como vendedor',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff81a761)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("¿Ya tienes una cuenta?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffe73f6a)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<User?> _handleSignIn() async {
    User? user;
    bool userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      isUserSignedIn = userSignedIn;
    });

    if (isUserSignedIn) {
      user = _auth.currentUser;
    } else {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      user = (await _auth.signInWithCredential(credential)).user;
      userSignedIn = await _googleSignIn.isSignedIn();
      setState(() {
        isUserSignedIn = userSignedIn;
      });
    }

    return user;
  }

  void onGoogleSignIn(BuildContext context) async {
    User? user = await _handleSignIn();
    // ignore: use_build_context_synchronously
    var userSignedIn = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => WelcomeUserWidgetGoogle(user!, _googleSignIn)),
    );

    setState(() {
      isUserSignedIn = userSignedIn == null ? true : false;
    });
  }

  Future<User?> _handleSignInFacebook() async {
    User? user;
    final AccessToken? accessToken = await FacebookAuth.instance.accessToken;

    setState(() {
      if (accessToken != null) {
        isUserSignedInFacebook = true;
      } else {
        isUserSignedInFacebook = false;
      }
    });

    if (isUserSignedInFacebook) {
      final userData = await FacebookAuth.instance.getUserData();
      final AuthCredential credential = FacebookAuthProvider.credential(
        accessToken!.token,
      );
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      user = userCredential.user;
    } else {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.status == LoginStatus.success) {
        final AccessToken accessToken = loginResult.accessToken!;
        final userData = await FacebookAuth.instance.getUserData();

        final AuthCredential credential = FacebookAuthProvider.credential(
          accessToken.token,
        );

        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        user = userCredential.user;
      }
    }
    return user;
  }

  void signInWithFacebook(BuildContext context) async {
    User? user = await _handleSignInFacebook();
    // ignore: use_build_context_synchronously
    var userSignedIn = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WelcomeUserWidgetFacebook(user!)),
    );

    setState(() {
      isUserSignedInFacebook = userSignedIn == null ? true : false;
    });
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/pages/widgets.dart';
import 'package:my_first_app/screens/welcome_user.dart';

Future<void> registerWithPassword(
    BuildContext context, fullName, email, password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((UserCredential userCredential) async => {
              await userCredential.user?.updateDisplayName(fullName),
              await userCredential.user
                  ?.updatePhotoURL('https://i.stack.imgur.com/l60Hf.png'),
              alertToView(
                  context,
                  'Registrado',
                  'Se ha registrado correctamente. Inicia sesión para continuar.',
                  '/login')
              // Navigator.pushReplacementNamed(context, '/login')
            });
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      alert(context, 'Contraseña débil',
          'La contraseña debe contener caracteres, números y símbolos con un mínimo de 6 caracteres.');
    } else if (e.code == 'email-already-in-use') {
      alert(context, 'Cuenta ya existente',
          'Ya existe una cuenta registrada para este correo electrónico.');
    }
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
}

Future<void> logInWithPassword(BuildContext context, email, password) async {
  try {
    late User? user;
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((UserCredential userCredential) => {
              user = userCredential.user,
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WelcomeUserWidgetEmail(user!)))
            });
  } on FirebaseAuthException {
    alert(context, 'Datos no válidos',
        'Parte de su información no es correcta. Inténtelo de nuevo.');
  }
}

Future<void> sendPasswordResetEmail(BuildContext context, email) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then(
        (value) => alertToViewWithParams(
            context,
            'Enlace de recuperación enviado',
            'Se ha enviado un enlace de recuperación de contraseña a su correo electrónico.',
            '/verify_code',
            email));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      alert(context, 'Cuenta no existente',
          'No existe una cuenta registrada para este correo electrónico.');
    } else if (e.code == 'invalid-email') {
      alert(context, 'Correo no válido',
          'Ingresa una dirección de correo electrónico válida.');
    }
  }
}

Future<void> verifyCode(
    BuildContext context, String enlace, String email) async {
  List<String> splitCode = enlace.split("&");
  splitCode = splitCode[1].split("=");
  String code = splitCode[1];
  try {
    await FirebaseAuth.instance.verifyPasswordResetCode(code).then((value) => {
          if (value == email.toLowerCase())
            {
              alertToViewWithParams(
                  context,
                  'Código verificado.',
                  'Se ha verificado correctamente el código del enlace de recuperación. Ahora podrás recuperar tu contraseña.',
                  '/reset_pass',
                  code)
            },
        });
  } on FirebaseAuthException catch (e) {
    if (e.code == 'invalid-action-code') {
      alert(context, 'Código no válido',
          'Ingrese el enlace de recuperación correctamente.');
    }
  }
}

Future<void> resetPassword(
    BuildContext context, String code, String newPassword) async {
  try {
    await FirebaseAuth.instance
        .confirmPasswordReset(code: code, newPassword: newPassword)
        .then((value) => alertToView(context, 'Contraseña actualizada',
            'Se ha actualizado correctamente su contraseña', '/login'));
  } on FirebaseAuthException catch (e) {
    // ignore: avoid_print
    print(e.code);
  }
}

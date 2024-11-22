import 'package:aula_flutter_full08/components/my_button.dart';
import 'package:aula_flutter_full08/components/my_input.dart';
import 'package:aula_flutter_full08/pages/home.dart';
import 'package:aula_flutter_full08/services/auth_service.dart';
import 'package:aula_flutter_full08/util.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = '';
  String _password = '';

  Future<void> signIn() async {
    // final logged = authServices.login(_username, _password);
    final isLogged = await authService.login(_username, _password);

    if (isLogged == null) {
      Util.alert(context, ('erro no login'));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Acesso')),
      body: Column(
        children: [
          MyInput(
            label: 'login',
            obscureText: false,
            onChanged: (value) => _username = value,
          ),
          MyInput(
            label: 'password',
            obscureText: true,
            onChanged: (value) => _password = value,
          ),
          MyButton(
            text: 'Entrar',
            onPress: signIn,
          ),
        ],
      ),
    );
  }
}

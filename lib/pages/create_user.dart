import 'package:aula_flutter_full08/components/my_input.dart';
import 'package:aula_flutter_full08/models/user.dart';
import 'package:aula_flutter_full08/pages/login.dart';
import 'package:aula_flutter_full08/services/user_service.dart';
import 'package:aula_flutter_full08/util.dart';
import 'package:flutter/material.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  String _name = '';
  String _username = '';
  String _password = '';
  String _confirmPassword = '';

  void save() {
    if (_name.trim() == '') {
      Util.alert(context, 'Nome é obrigatorio');
      return;
    }
    if (_username.trim() == '') {
      Util.alert(context, 'Login é obrigatorio');
      return;
    }
    if (_password.trim() == '') {
      Util.alert(context, 'Senha é obrigatorio');
      return;
    }
    if (_password.trim() != _confirmPassword.trim()) {
      Util.alert(context, 'Senhas nao conferem');
      return;
    }

    final User user = User(null, _name, _username, _password);

    userService.create(user).then((isSaved) {
      if (isSaved) {
        Util.alert(context, 'Usuário criado com sucesso');
        Navigator.pop(context);
      } else {
        Util.alert(context, 'Usuário já existe');
      }
    }).catchError((error) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Usuário')),
      body: Column(children: [
        MyInput(
          label: 'nome',
          onChanged: (String value) => _name = value,
          obscureText: false,
        ),
        MyInput(
          label: 'login',
          onChanged: (String value) => _username = value,
          obscureText: false,
        ),
        MyInput(
          label: 'senha',
          onChanged: (String value) => _password = value,
          obscureText: true,
        ),
        MyInput(
          label: 'confirmar senha',
          onChanged: (String value) => _confirmPassword = value,
          obscureText: true,
        )
      ]),
    );
  }
}

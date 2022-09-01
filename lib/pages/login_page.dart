import 'package:flutter/material.dart';
import 'package:projeto01/components/login/custom_login_button_component.dart';
import 'package:projeto01/controllers/login_controller.dart';
import 'package:projeto01/widgets/custom_text_field_widget.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = LoginController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people,
              size: MediaQuery.of(context).size.height * 0.3,
            ),
            CustomTextFieldWidget(
              onChanged: _controller.setLogin,
              label: 'Login',
            ),
            CustomTextFieldWidget(
              isSecret: true,
              onChanged: _controller.setPassword,
              label: 'Senha',
            ),
            const SizedBox(height: 15),
            CustomLoginButtonComponent(
              loginController: _controller,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import '../controllers/login_controller.dart';
import 'register_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginController(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: const Text('login'),
        ),
        body:  
        const SingleChildScrollView(
        child: LoginBody()
        )
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/green_glimpse_logo.png'),
          TextField(
            onChanged: (value) =>
                context.read<LoginController>().updateUsername(value),
            decoration: const InputDecoration(labelText: 'e-mail'),
          ),
          const SizedBox(height: 16.0),
          TextField(
            onChanged: (value) =>
                context.read<LoginController>().updatePassword(value),
            obscureText: true,
            decoration: const InputDecoration(labelText: 'password'),
          ),
          const SizedBox(height: 20),
          IntrinsicWidth(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(140, 40)),
                  onPressed: () => context.read<LoginController>().loginUser(),
                  child: const Text('login',
                      style: TextStyle(
                        letterSpacing: 0.2,
                        fontSize: 16,
                      )),
                ),
                const SizedBox(height: 6),
                const Text("not registered yet?", textAlign: TextAlign.center),
                const SizedBox(height: 1),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(140, 40)),
                  onPressed: () {
                    // Navigate to RegisterView
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const RegisterView()),
                    );
                  },
                  child: const Text('register',
                      style: TextStyle(
                        letterSpacing: 0.2,
                        fontSize: 16,
                      )),
                ),
                const SizedBox(height: 200),
                const Text("powered by greenglimpse",
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.grey)),
              ])),
        ],
      ),
    );
  }
}

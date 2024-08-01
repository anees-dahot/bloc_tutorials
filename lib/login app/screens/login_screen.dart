import 'package:bloc_practice/login%20app/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: name,
                decoration: const InputDecoration(
                  hintText: 'User name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: password,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            BlocConsumer(
              bloc: _loginBloc,
              listenWhen: (current, previos) => current is LoginActionState,
              buildWhen: (current, previos) => current is !LoginActionState,
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(LoginFunctionEvent(
                          email: name.text, password: password.text));
                    },
                    child: const Text('Login'),
                  ),
                );
              },
              listener: (context, state) {
                if (state is LoadingState) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(const SnackBar(content: Text('Submitting...')));
                } else if (state is ErrorState) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text(state.error)));
                } else if (state is SuccessState) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(const SnackBar(content: Text('Success')));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
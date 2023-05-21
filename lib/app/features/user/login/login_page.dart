import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../../utils/app_button.dart';
import '../../utils/app_textformfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailTEC = TextEditingController();
  final _passwordTEC = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailTEC.dispose();
    _passwordTEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constrainsts) {
          return Center(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constrainsts.maxHeight,
                  maxWidth: 400,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Informações para acesso no AgendaRep',
                            // style: context.textTheme.titleLarge?.copyWith(
                            //   fontWeight: FontWeight.bold,
                            //   // color: context.theme.primaryColorDark,
                            // ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppTextFormField(
                            label: 'Informe o e-mail cadastrado',
                            controller: _emailTEC,
                            validator: Validatorless.multiple([
                              Validatorless.required('email obrigatório.'),
                              Validatorless.email('Email inválido.'),
                            ]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppTextFormField(
                            label: 'Informe a senha cadastrada',
                            controller: _passwordTEC,
                            obscureText: true,
                            validator: Validatorless.multiple(
                              [
                                Validatorless.required('Senha obrigatória.'),
                                Validatorless.min(6, 'Minimo de 6 caracteres.'),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppButton(
                            label: 'Solicitar acesso',
                            onPressed: () {
                              // final formValid =
                              //     _formKey.currentState?.validate() ??
                              //         false;
                              // if (formValid) {
                              //   context.read<LoginBloc>().add(
                              //         LoginEventLoginSubmitted(
                              //           email: _emailTEC.text,
                              //           password: _passwordTEC.text,
                              //         ),
                              //       );
                              // }
                            },
                            // width: context.size.width,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Esqueceu sua senha ?'),
                              TextButton(
                                onPressed: () {
                                  // if (_emailTEC.text.isNotEmpty) {
                                  //   context.read<LoginBloc>().add(
                                  //         LoginEventRequestPasswordReset(
                                  //           email: _emailTEC.text,
                                  //         ),
                                  //       );
                                  //   ScaffoldMessenger.of(context)
                                  //     ..hideCurrentSnackBar()
                                  //     ..showSnackBar(const SnackBar(
                                  //         content: Text(
                                  //             'Enviamos instruções para seu email.')));
                                  // } else {
                                  //   ScaffoldMessenger.of(context)
                                  //     ..hideCurrentSnackBar()
                                  //     ..showSnackBar(const SnackBar(
                                  //         content: Text('Informe um email')));
                                  // }
                                },
                                child: const Text(
                                  'Criar uma nova.',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Não possui uma conta ?'),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed('/register/email');
                                },
                                child: const Text(
                                  'CADASTRE-SE.',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

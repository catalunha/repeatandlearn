import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repeatandlearn/app/core/authentication/riverpod/auth_prov.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../core/models/user_model.dart';
import '../../../utils/app_textformfield.dart';

class UserProfileEditPage extends ConsumerStatefulWidget {
  const UserProfileEditPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<UserProfileEditPage> createState() =>
      _UserProfileEditPageState();
}

class _UserProfileEditPageState extends ConsumerState<UserProfileEditPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameTec = TextEditingController();
  UserModel? user;
  @override
  void initState() {
    super.initState();
    user = ref.read(authChNotProvider).user;
    _nameTec.text = user?.userProfile?.name ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar seu perfil'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.cloud_upload),
        onPressed: () async {
          final formValid = _formKey.currentState?.validate() ?? false;
          if (formValid) {
            // context.read<UserProfileEditBloc>().add(
            //       UserProfileEditEventFormSubmitted(
            //         name: _nameTec.text,
            //         cpf: _cpfTec.text,
            //         phone: _phoneTec.text,
            //       ),
            //     );
          }
        },
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'email: ${user?.userProfile?.email ?? "Oops. Isto é um erro."}',
                    ),
                    const SizedBox(height: 5),
                    AppTextFormField(
                      label: '* Seu nome',
                      controller: _nameTec,
                      validator:
                          Validatorless.required('Nome completo é obrigatório'),
                    ),
                    const SizedBox(height: 70),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Future<bool> saveProfile() async {
  //   final formValid = _formKey.currentState?.validate() ?? false;
  //   if (formValid) {
  //     await widget._userProfileController.append(
  //       nickname: _nicknameTec.text,
  //       name: _nameTec.text,
  //       phone: _phoneTec.text,
  //       cpf: _cpfTec.text,
  //       cpf: _cpfTec.text,
  //     );
  //     return true;
  //   }
  //   return false;
  // }
}

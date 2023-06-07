import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/authentication/riverpod/auth_prov.dart';
import '../utils/app_mixin_loader.dart';
import '../utils/app_mixin_messages.dart';
import 'comp/home_popmenu.dart';
import 'comp/level_card.dart';
import 'controller/providers.dart';

class HomePage extends ConsumerWidget with Loader, Messages {
  HomePage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authChNotProvider);
    final levelList = ref.watch(levelListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Olá ${auth.user?.userProfile?.name ?? auth.user?.email}',
        ),
        actions: const [
          HomePopMenu(),
        ],
      ),
      body: levelList.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return LevelCard(
                model: data[index],
              );
            },
          );
        },
        error: (error, stackTrace) {
          //log('Erro em TaskPage build');
          //log('$error');
          //log('$stackTrace');
          return const Center(
            child: Text('Erro'),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

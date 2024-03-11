import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodworks/work/work_controller.dart';

import 'widgets/person_card_widget.dart';

final controller = ChangeNotifierProvider((ref) => WorkController());

class WorkView extends ConsumerStatefulWidget {
  WorkView({super.key});

  @override
  ConsumerState<WorkView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<WorkView> {
  @override
  void initState() {
    ref.read(controller).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(controller);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Person List"),
        ),
        body: watch.isLoading == true
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: watch.users.length,
                    separatorBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Divider(
                          indent: 20,
                          endIndent: 20,
                        ),
                      );
                    },
                    itemBuilder: (context, index) {
                      return personCard(context, watch, index);
                    }),
              )
            : const CircularProgressIndicator());
  }
}

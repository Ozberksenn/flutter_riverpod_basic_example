import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodworks/work/work_controller.dart';

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
          title: Text("asdasd"),
        ),
        body: watch.isLoading == true
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: watch.users.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      color: Colors.amber,
                      child: ListTile(
                        title: Text(
                          watch.users[index]!.firstName.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  );
                })
            : const CircularProgressIndicator());
  }
}

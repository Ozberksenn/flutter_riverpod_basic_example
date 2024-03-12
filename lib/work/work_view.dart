import 'package:flutter/cupertino.dart';
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

class _HomeViewState extends ConsumerState<WorkView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    ref.read(controller).getData();
    ref.read(controller).tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(controller);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Person List"),
        ),
        body: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: TabBar(
                controller: watch.tabController,
                onTap: (value) {
                  watch.tabIndexChange(value);
                },
                tabs: <Widget>[
                  Tab(
                    icon: Row(
                      children: [
                        const Row(
                          children: [
                            Icon(CupertinoIcons.person_add_solid),
                            Text('Katılımcılar')
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(watch.users.length.toString()),
                        )
                      ],
                    ),
                  ),
                  Tab(
                    icon: Row(
                      children: [
                        const Row(
                          children: [
                            Icon(CupertinoIcons.person_2_alt),
                            Text('Kayıtlı Olanlar')
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(watch.savedList.length.toString()),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            watch.isLoading == true
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: watch.tabIndex == 0
                        ? ListView.separated(
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
                              return personCard(context,
                                  firstName: watch.users[index]?.firstName,
                                  lastName: watch.users[index]?.lastName,
                                  email: watch.users[index]?.email,
                                  image: watch.users[index]?.avatar, onTap: () {
                                watch.savedPersons(watch.users[index]!);
                              });
                            })
                        : ListView.separated(
                            shrinkWrap: true,
                            itemCount: watch.savedList.length,
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
                              return personCard(context,
                                  firstName: watch.savedList[index]?.firstName,
                                  lastName: watch.savedList[index]?.lastName,
                                  email: watch.savedList[index]?.email,
                                  image: watch.savedList[index]?.avatar);
                            }),
                  )
                : const CircularProgressIndicator()
          ],
        ));
  }
}

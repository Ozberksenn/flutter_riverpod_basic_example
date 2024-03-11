import 'package:flutter/material.dart';
import 'package:riverpodworks/work/work_controller.dart';

Widget personCard(BuildContext context, WorkController watch, int index) {
  return Card(
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: watch.users[index]!.avatar != null
              ? BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image:
                          NetworkImage(watch.users[index]!.avatar.toString())))
              : null,
        ),
        title: Row(
          children: [
            Text(
              watch.users[index]!.firstName.toString(),
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              ' ${watch.users[index]!.lastName}',
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
        subtitle: Text(
          watch.users[index]!.email.toString(),
          style: const TextStyle(color: Colors.black),
        ),
      ),
    ),
  );
}

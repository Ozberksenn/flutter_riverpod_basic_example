import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget personCard(context,
    {String? image,
    String? firstName,
    String? lastName,
    String? email,
    Function? onTap}) {
  return Card(
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: image != null
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: NetworkImage(image)))
                : null,
          ),
          title: Row(
            children: [
              Text(
                firstName ?? '', // watch.users[index]!.firstName.toString(),
                style: const TextStyle(color: Colors.black),
              ),
              Text(
                lastName ?? '', // ' ${watch.users[index]!.lastName}',
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
          subtitle: Text(
            email ?? '', // watch.users[index]!.email.toString(),
            style: const TextStyle(color: Colors.black),
          ),
          trailing: IconButton(
            onPressed: () => onTap!(),
            // onPressed: () => watch.savedPersons(watch.users[index]!),
            icon: const Icon(CupertinoIcons.add),
          )),
    ),
  );
}

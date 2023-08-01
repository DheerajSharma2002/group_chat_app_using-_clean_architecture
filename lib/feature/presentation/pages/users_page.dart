import 'package:chat_clean_arch/feature/domain/entities/user_entities.dart';
import 'package:flutter/material.dart';

import '../widgets/single_item_user_widget.dart';

class UsersPage extends StatelessWidget {
  final List<UserEntity> users;
  const UsersPage({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return SingleItemUserWidget(
                    profileUser: users[index],
                    onTap: () {},
                  );
                }),
          )
        ],
      ),
    );
  }
}

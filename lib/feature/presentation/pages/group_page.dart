import 'package:chat_clean_arch/constant/const.dart';
import 'package:flutter/material.dart';

import '../widgets/single_item_group_widget.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, PageConst.createNewGroupPage);
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return SingleItemGroupWidget(
                      onTap: () {
                        Navigator.pushNamed(context, PageConst.singleChatPage);
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:chat_clean_arch/feature/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';

import '../widgets/container_button_widget.dart';
import '../widgets/textfield_email_container_widget.dart';

class CreateNewGroupPage extends StatefulWidget {
  const CreateNewGroupPage({super.key});

  @override
  State<CreateNewGroupPage> createState() => _CreateNewGroupPageState();
}

final TextEditingController _groupNameController = TextEditingController();

class _CreateNewGroupPageState extends State<CreateNewGroupPage> {
  @override
  void dispose() {
    _groupNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Group"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 62,
              width: 62,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(62),
              ),
              child: const Text(""),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Add Group image",
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            TextEmailContainerWidget(
              controller: _groupNameController,
              hintText: "name",
              prefixIcon: Icons.person,
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1.50,
              indent: 120,
              endIndent: 120,
            ),
            const SizedBox(
              height: 10,
            ),
            const ContainerButtonWidget(
              title: "Create New group",
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'By clicking Create New Group, you agree to the ',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: colorC1C1C1,
                  ),
                ),
                Text(
                  'Privacy Policy',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:chat_clean_arch/feature/presentation/widgets/container_button_widget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/textfield_email_container_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _statusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
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
            "Remove profile photo",
            style: TextStyle(
                color: Colors.green, fontWeight: FontWeight.w500, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          TextEmailContainerWidget(
            controller: _nameController,
            hintText: "name",
            prefixIcon: Icons.person,
          ),
          const SizedBox(
            height: 10,
          ),
          const TextEmailContainerWidget(
            hintText: "email",
            prefixIcon: Icons.email,
          ),
          const SizedBox(
            height: 10,
          ),
          TextEmailContainerWidget(
            controller: _statusController,
            hintText: "Status",
            prefixIcon: Icons.rounded_corner_outlined,
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 1.50,
          ),
          const SizedBox(height: 10,),
          const ContainerButtonWidget(
            title: "Update Profile",
          ),
        ],
      ),
    );
  }
}

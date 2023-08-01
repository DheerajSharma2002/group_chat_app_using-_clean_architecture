import 'package:chat_clean_arch/feature/domain/entities/user_entities.dart';
import 'package:chat_clean_arch/feature/presentation/cubit/user/cubit/user_cubit.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/container_button_widget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/textfield_email_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  final UserEntity currentUser;
  const ProfilePage({
    super.key,
    required this.currentUser,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.value = TextEditingValue(text: widget.currentUser.name);
    _statusController.value = TextEditingValue(text: widget.currentUser.status);
  }

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
          const SizedBox(
            height: 10,
          ),
          ContainerButtonWidget(
            onTap: _updatUserProfile,
            title: "Update Profile",
          ),
        ],
      ),
    );
  }

  void _updatUserProfile() {
    BlocProvider.of<UserCubit>(context).updateUser(
        user: UserEntity(
      uid: widget.currentUser.uid,
      name: _nameController.text,
      status: _statusController.text,
    ));
  }
}

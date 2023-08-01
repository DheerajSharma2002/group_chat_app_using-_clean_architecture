import 'package:chat_clean_arch/feature/domain/entities/user_entities.dart';
import 'package:flutter/material.dart';

class SingleItemUserWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final UserEntity profileUser;
  

  const SingleItemUserWidget({super.key, required this.profileUser ,this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(""),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                       Text(
                        "$profileUser.name",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Status",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black.withOpacity(.7),
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Divider(
                          thickness: 1.50,
                          color: Colors.black.withOpacity(.3),
                        ),
                      ),
                    ],
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

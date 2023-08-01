import 'package:chat_clean_arch/constant/const.dart';
import 'package:chat_clean_arch/feature/data/remote_data_sources/models/user_models.dart';
import 'package:chat_clean_arch/feature/domain/entities/user_entities.dart';
import 'package:chat_clean_arch/feature/presentation/cubit/auth/cubit/auth_cubit.dart';
import 'package:chat_clean_arch/feature/presentation/cubit/user/cubit/user_cubit.dart';
import 'package:chat_clean_arch/feature/presentation/pages/group_page.dart';
import 'package:chat_clean_arch/feature/presentation/pages/profile_page.dart';
import 'package:chat_clean_arch/feature/presentation/pages/users_page.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/custom_toolbar_widget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/textfield_email_container_widget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  final String uid;
  const HomePage({super.key, required this.uid});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  PageController pageViewController = PageController(initialPage: 0);
  bool isSearch = false;

  int _toolBarPageIndex = 0;

  final List<String> _popupMenuList = ["Logout", "Settings"];

  @override
  void dispose() {
    pageViewController.dispose();
    searchController.dispose();
    super.dispose();
  }

  Widget _buildSearchWidget() {
    return Container(
        margin: const EdgeInsets.only(top: 25),
        height: 40,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.3),
            blurRadius: 2,
            spreadRadius: 1,
            offset: const Offset(0, 0.50),
          ),
        ]),
        child: TextEmailContainerWidget(
          prefixIcon: Icons.arrow_back,
          hintText: "Search",
          keyboardType: TextInputType.text,
          controller: searchController,
          borderRadius: 0.0,
          color: Colors.white,
          iconClickEvent: () {
            setState(() {
              isSearch = !isSearch;
            });
          },
        ));
  }

  Widget emptyContainer() {
    return const SizedBox(
      height: 0,
      width: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: isSearch == true ? Colors.transparent : primaryColor,
        title: isSearch == true ? emptyContainer() : Text("$AppConst.appName"),
        flexibleSpace:
            isSearch == true ? _buildSearchWidget() : emptyContainer(),
        actions: isSearch == true
            ? []
            : [
                InkWell(
                    onTap: () {
                      setState(() {
                        isSearch = !isSearch;
                      });
                    },
                    child: const Icon(Icons.search)),
                PopupMenuButton(
                    onSelected: (value) {
                      if (value == "Logout") {
                        BlocProvider.of<AuthCubit>(context).loggedOut();
                      }
                    },
                    itemBuilder: (_) => _popupMenuList.map((menuItem) {
                          return PopupMenuItem(
                            child: Text("$menuItem"),
                            value: menuItem,
                          );
                        }).toList()),
              ],
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, userState) {
          if (userState is UserLoaded) {
            final currentUser=userState.users.firstWhere((element) => element.uid == widget.uid, orElse: () => UserModel(), );
            final users = userState.users.where((element) => element.uid != widget.uid).toList();

            return Column(
              children: [
                isSearch == true
                    ? emptyContainer()
                    : CustomToolBarWidget(
                        pageIndex: _toolBarPageIndex,
                        toolbarIndexController: (int index) {
                          print("Current Page index $index");
                          setState(() {
                            _toolBarPageIndex = index;
                          });
                          pageViewController.jumpToPage(index);
                        },
                      ),
                Expanded(
                  child: PageView.builder(
                      controller: pageViewController,
                      onPageChanged: (index) {
                        setState(() {
                          _toolBarPageIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return _switchPage(users: users, currentUser: currentUser);
                      }),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _switchPage(
      {required List<UserEntity> users, required UserEntity currentUser}) {
    switch (_toolBarPageIndex) {
      case 0:
        return const GroupPage();
      case 1:
        return UsersPage(users: users,);
      case 2:
        return ProfilePage(currentUser: currentUser);
      default:
        return Container();
    }
  }
}

import 'package:chat_clean_arch/constant/const.dart';
import 'package:chat_clean_arch/feature/presentation/pages/group_page.dart';
import 'package:chat_clean_arch/feature/presentation/pages/profile_page.dart';
import 'package:chat_clean_arch/feature/presentation/pages/users_page.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/custom_toolbar_widget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/textfield_email_container_widget.dart';
import 'package:chat_clean_arch/feature/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  PageController pageViewController = PageController(initialPage: 0);
  bool isSearch = false;

  int _toolBarPageIndex = 0;

  final List<String> _popupMenuList = ["Logout", "Settings"];

  List<Widget> get pages => [const GroupPage(), const UsersPage(), const ProfilePage()];

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
                    itemBuilder: (_) => _popupMenuList.map((menuItem) {
                          return PopupMenuItem(child: Text("$menuItem"));
                        }).toList())
              ],
      ),
      body: Column(
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
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return pages[index];
                }),
          ),
          
        ],
      ),
    );
  }
}

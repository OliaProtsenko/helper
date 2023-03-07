import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helper/common/widgets/post_card.dart';
import 'package:helper/features/home_screen/support_requests_widget.dart';

import 'bloc/home_screen_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late HomeScreenBloc bloc;

  final Map<HomeTab, Widget> _tabs = {
    HomeTab.requests: const SupportRequestsWidget(),
    HomeTab.chat:const Scaffold(),

  };

  void _onItemTapped(int index) {
    switch (HomeTab.values[index]) {
      case HomeTab.requests:
        bloc.onHomeClicked();
        break;
      case HomeTab.chat:
        bloc.onChatClicked();
        break;
    }
  }
  @override
  void initState() {
    super.initState();
    bloc = HomeScreenBlocImpl();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return StreamBuilder<HomeTab>(
        stream: bloc.state,
        builder: (context, snapshot) {
          final data = snapshot.data;
          return Scaffold(
      body:(data == null) ?
      const CircularProgressIndicator():
      Stack(children: [
        Offstage(
            offstage: data != HomeTab.requests,
            child: Center(
              child: _tabs[HomeTab.requests],
            )),
        if (data != HomeTab.requests)
          Center(
            child: _tabs[data],
          )
      ]),
      bottomNavigationBar:  BottomNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: Theme.of(context).tabBarTheme.labelColor,
        items: _buildTabBarItem(context),
        currentIndex: data==null?0:data.index ,
        onTap: _onItemTapped,
      ),
    );});
  }
  List<BottomNavigationBarItem> _buildTabBarItem(BuildContext context) {
    final tabBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        label: 'Requests',
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.chat,
        ),
        label: 'Chat',
      ),
    ];
    return tabBarItems;
  }
}



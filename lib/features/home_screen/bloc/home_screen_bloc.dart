import 'package:rxdart/rxdart.dart';

enum HomeTab{
  requests,
  chat
}

abstract class HomeScreenBloc{
  Stream<HomeTab> get state;

  void onHomeClicked();

  void onChatClicked();

}

class HomeScreenBlocImpl extends HomeScreenBloc{

  final _stateController = BehaviorSubject<HomeTab>.seeded(HomeTab.requests);

  @override
  Stream<HomeTab> get state=>_stateController.stream;

  @override
  void onHomeClicked()=>_stateController.add(HomeTab.requests);

  @override
  void onChatClicked()=>_stateController.add(HomeTab.chat);

}
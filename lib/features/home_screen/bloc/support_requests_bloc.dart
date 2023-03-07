import 'package:helper/features/authorization/model/user_data_model.dart';
import 'package:helper/features/home_screen/model/support_request_data_model.dart';
import 'package:rxdart/rxdart.dart';

enum RequestsSegment {
  all,
  createdByMe,
  saved,
}

class SupportRequestsState {
  SupportRequestsState({required this.segment, required this.requests});

  final RequestsSegment segment;
  final List<SupportRequestDataModel> requests;
}

abstract class SupportRequestsBloc {
  Stream<SupportRequestsState> get state;

  void selectSegment(RequestsSegment segment);
}

class SupportRequestsBlocImpl extends SupportRequestsBloc {
  final _stateController = BehaviorSubject<SupportRequestsState>.seeded(
      SupportRequestsState(segment: RequestsSegment.all, requests: [ SupportRequestDataModel(
        creator: const User(
          fullName: 'Anna ',
          email: '',
        ),
        category: RequestCategory.medicine,
        createdAt: DateTime(2022, 12, 12),
        title: 'Title',
        description: ' ',
        city: 'Vinnitsa',
      ),
        SupportRequestDataModel(
          creator: const User(
            fullName: 'Petro',
            email: '',
          ),
          category: RequestCategory.clothes,
          createdAt: DateTime(2022, 10, 17),
          title: 'Title',
          description: ' ',
          city: 'Rivne',
        ),]));

  @override
  Stream<SupportRequestsState> get state => _stateController.stream;

  @override
  void selectSegment(RequestsSegment segment) {
    switch (segment) {
      case RequestsSegment.all:
        final requests = [
          SupportRequestDataModel(
            creator: const User(
              fullName: 'Anna ',
              email: '',
            ),
            category: RequestCategory.medicine,
            createdAt: DateTime(2022, 12, 12),
            title: 'Title',
            description: ' ',
            city: 'Vinnitsa',
          ),
          SupportRequestDataModel(
            creator: const User(
              fullName: 'Petro',
              email: '',
            ),
            category: RequestCategory.medicine,
            createdAt: DateTime(2022, 10, 17),
            title: 'Title',
            description: ' ',
            city: 'Rivne',
          ),
        ];
        _stateController
            .add(SupportRequestsState(segment: segment, requests: requests));
        break;
      case RequestsSegment.createdByMe:
      case RequestsSegment.saved:
        _stateController.add(
          SupportRequestsState(segment: segment, requests: []),
        );
    }
  }
}

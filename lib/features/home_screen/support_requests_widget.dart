import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helper/common/widgets/post_card.dart';
import 'package:helper/features/authorization/dimensions.dart';

import 'bloc/support_requests_bloc.dart';

class SupportRequestsWidget extends StatefulWidget {
  const SupportRequestsWidget({Key? key}) : super(key: key);

  @override
  State<SupportRequestsWidget> createState() => _SupportRequestsWidgetState();
}

class _SupportRequestsWidgetState extends State<SupportRequestsWidget> {
  late SupportRequestsBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = SupportRequestsBlocImpl();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: StreamBuilder<SupportRequestsState>(
          stream: bloc.state,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            final state = snapshot.data!;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.space16,
                    vertical: Dimensions.space12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 130,
                        color: theme.colorScheme.primary.withOpacity(0.6),
                      ),
                      Ink(
                        width: 40,
                        height: 40,
                        decoration: ShapeDecoration(
                          color: theme.colorScheme.secondary,
                          shape: const ContinuousRectangleBorder(),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.person_outlined),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.space16,
                    vertical: Dimensions.space12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Support requests',
                        style: theme.textTheme.headline3,
                      ),
                      Row(children: [
                        Ink(
                          width: 40,
                          height: 40,
                          decoration: ShapeDecoration(
                            color: theme.colorScheme.secondary,
                            shape: const ContinuousRectangleBorder(),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.filter_alt),
                            color: Colors.white,
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(
                          width: Dimensions.space8,
                        ),
                        Ink(
                          width: 40,
                          height: 40,
                          decoration: ShapeDecoration(
                            color: theme.colorScheme.secondary,
                            shape: const ContinuousRectangleBorder(),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.add_outlined),
                            color: Colors.white,
                            onPressed: () {},
                          ),
                        ),
                      ])
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Dimensions.space8,
                    horizontal: Dimensions.space16,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: CupertinoSlidingSegmentedControl<RequestsSegment>(
                      groupValue: state.segment,
                      onValueChanged: (value) {
                        if (value != null) {
                          bloc.selectSegment(value);
                        }
                      },
                      children: const {
                        RequestsSegment.all: Text(
                          'All',
                          style: TextStyle(
                            color: Color(0xFF686672),
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            letterSpacing: -0.4,
                          ),
                        ),
                        RequestsSegment.createdByMe: Text(
                          'Created by me',
                          style: TextStyle(
                            color: Color(0xFF686672),
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            letterSpacing: -0.4,
                          ),
                        ),
                        RequestsSegment.saved: Text(
                          'Saved',
                          style: TextStyle(
                            color: Color(0xFF686672),
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            letterSpacing: -0.4,
                          ),
                        ),
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: state.requests.length,
                      padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.space16,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.only(
                              bottom: Dimensions.space8,
                            ),
                            child: PostCard(
                              requestDataModel: state.requests[index],
                            ));
                      }),
                ),
                // ListView(),
              ],
            );
          }),
    );
  }
}

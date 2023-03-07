import 'package:flutter/material.dart';
import 'package:helper/features/authorization/dimensions.dart';
import 'package:helper/features/home_screen/model/support_request_data_model.dart';

import 'primary_button.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.requestDataModel,
  }) : super(key: key);
  final SupportRequestDataModel requestDataModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: theme.colorScheme.secondary,
            width: 1.4,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: Dimensions.space8,
            right: Dimensions.space8,
            bottom: Dimensions.space8,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: Dimensions.space8,
                    ),
                    child: Row(children: [
                      Text(
                        requestDataModel.title,
                        style: theme.textTheme.headline4,
                      ),
                      const SizedBox(
                        width: Dimensions.space8,
                      ),
                      const Icon(
                        Icons.crop_square,
                      ),
                    ]),
                  ),
                  Text(
                    requestDataModel.createdAt.toString().substring(0,10),
                    style: const TextStyle(
                      color: Color(0xFFBBBDC8),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      letterSpacing: -0.4,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: Dimensions.space4,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Icon(
                  Icons.crop_square,
                ),
                Text(
                  requestDataModel.category.getTitle(),
                  style: const TextStyle(
                    color: Color(0xFF878999),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: -0.4,
                  ),
                ),
              ]),
              const SizedBox(
                height: Dimensions.space4,
              ),
              const Text(
                'Vorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate'
                ' libero et velit interdum, ac aliquet odio mattis. Class aptent taciti '
                'sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. '
                '(short description)',
                style: TextStyle(
                  color: Color(0xFF878999),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  letterSpacing: -0.4,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: Dimensions.space8),
                child: Divider(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/image/image_icon.png',
                        height:Dimensions.space32,
                        //  width: double.infinity,
                      ),
                      Text(
                        requestDataModel.creator.fullName,
                        style: const TextStyle(
                          color: Color(0xFF686672),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          letterSpacing: -0.4,
                        ),
                      )
                    ],
                  ),
                  Row(children: [
                    const Icon(
                      Icons.location_on,
                    ),
                    Text(
                      requestDataModel.city,
                      style: const TextStyle(
                        color: Color(0xFF686672),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        letterSpacing: -0.4,
                      ),
                    ),
                  ]),
                ],
              ),
              const SizedBox(height: Dimensions.space12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: PrimaryButton(
                      title: 'Send a message',
                      color: theme.colorScheme.primary,
                      onTap: () {},
                      width: double.infinity,
                      height: 42,
                    ),
                  ),
                  const SizedBox(width: Dimensions.space8,),
                  Ink(
                    width: 40,
                    height: 40,
                    decoration: ShapeDecoration(
                      color: theme.colorScheme.secondary,
                      shape: const ContinuousRectangleBorder(),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.favorite,
                      ),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

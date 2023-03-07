import 'package:helper/features/authorization/model/user_data_model.dart';

class SupportRequestDataModel{
  SupportRequestDataModel({
    required this.creator,
    required this.category,
    required this.createdAt,
    required this.title,
    required this.description,
    required this.city,
});
  final User creator;
  final DateTime createdAt;
  final RequestCategory category;
  final String title;
  final String description;
  final String city;


}
enum RequestCategory{
  medicine,
  clothes,

}
extension RequestcategoryExt on RequestCategory{

  String getTitle(){
    switch(this)
    {
      case RequestCategory.medicine:
        return 'Medicine';
      case RequestCategory.clothes:
        return 'Clothes';
    }
  }
}
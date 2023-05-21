import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../core/models/user_profile_model.dart';

class UserProfileEntity {
  static const String className = 'UserProfile';
  // Nome do campo local =  no Database
  static const String id = 'objectId';
  static const String email = 'email';
  static const String name = 'name';
  static const String isActive = 'isActive';

  UserProfileModel fromParse(ParseObject parseObject) {
    UserProfileModel profileModel = UserProfileModel(
      id: parseObject.objectId!,
      email: parseObject.get(UserProfileEntity.email),
      name: parseObject.get(UserProfileEntity.name),
      isActive: parseObject.get(UserProfileEntity.isActive),
    );
    return profileModel;
  }

  Future<ParseObject> toParse(UserProfileModel profileModel) async {
    final profileParseObject = ParseObject(UserProfileEntity.className);
    profileParseObject.objectId = profileModel.id;
    if (profileModel.name != null) {
      profileParseObject.set(UserProfileEntity.name, profileModel.name);
    }

    profileParseObject.set(UserProfileEntity.isActive, profileModel.isActive);
    return profileParseObject;
  }
}

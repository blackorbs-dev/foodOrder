import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'user_details_widget.dart' show UserDetailsWidget;
import 'package:flutter/material.dart';

class UserDetailsModel extends FlutterFlowModel<UserDetailsWidget> {
  ///  Local state fields for this page.

  UserDetailsStruct? userDetails;
  void updateUserDetailsStruct(Function(UserDetailsStruct) updateFn) {
    updateFn(userDetails ??= UserDetailsStruct());
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'order_summary_widget.dart' show OrderSummaryWidget;
import 'package:flutter/material.dart';

class OrderSummaryModel extends FlutterFlowModel<OrderSummaryWidget> {
  ///  Local state fields for this page.

  bool loading = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (PlaceOrder)] action in Button widget.
  ApiCallResponse? cartResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

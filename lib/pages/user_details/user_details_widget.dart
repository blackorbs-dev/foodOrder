import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'user_details_model.dart';
export 'user_details_model.dart';

class UserDetailsWidget extends StatefulWidget {
  const UserDetailsWidget({super.key});

  static String routeName = 'UserDetails';
  static String routePath = '/userDetails';

  @override
  State<UserDetailsWidget> createState() => _UserDetailsWidgetState();
}

class _UserDetailsWidgetState extends State<UserDetailsWidget> {
  late UserDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserDetailsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).info,
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.safePop();
            },
            child: Icon(
              FFIcons.karrowBack,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 16.0,
            ),
          ),
          title: Text(
            'Enter your details',
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.poppins(
                    fontWeight:
                        FlutterFlowTheme.of(context).titleLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).titleLarge.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 6.0),
                  child: Text(
                    'Gender',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 52.0,
                  child: custom_widgets.CustomDropdown(
                    width: double.infinity,
                    height: 52.0,
                    hint: 'Choose your gender',
                    options: Gender.values,
                    onChanged: (value) async {
                      _model.updateUserDetailsStruct(
                        (e) => e..gender = value,
                      );
                      FFAppState().totalCalories =
                          functions.getTotalCaloroes(_model.userDetails!);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 6.0),
                  child: Text(
                    'Weight',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 52.0,
                  child: custom_widgets.TextInputField(
                    width: double.infinity,
                    height: 52.0,
                    hintText: 'Enter your weight',
                    trailingText: 'Kg',
                    onChanged: (value) async {
                      _model.updateUserDetailsStruct(
                        (e) => e..weight = double.parse(value),
                      );
                      FFAppState().totalCalories =
                          functions.getTotalCaloroes(_model.userDetails!);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 6.0),
                  child: Text(
                    'Height',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 52.0,
                  child: custom_widgets.TextInputField(
                    width: double.infinity,
                    height: 52.0,
                    hintText: 'Enter your height',
                    trailingText: 'Cm',
                    onChanged: (value) async {
                      _model.updateUserDetailsStruct(
                        (e) => e..height = double.parse(value),
                      );
                      safeSetState(() {});
                      FFAppState().totalCalories =
                          functions.getTotalCaloroes(_model.userDetails!);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 6.0),
                  child: Text(
                    'Age',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 52.0,
                  child: custom_widgets.TextInputField(
                    width: double.infinity,
                    height: 52.0,
                    hintText: 'Enter your age',
                    trailingText: '',
                    onChanged: (value) async {
                      _model.updateUserDetailsStruct(
                        (e) => e..age = double.parse(value),
                      );
                      safeSetState(() {});
                      FFAppState().totalCalories =
                          functions.getTotalCaloroes(_model.userDetails!);
                    },
                  ),
                ),
                Spacer(),
                FFButtonWidget(
                  onPressed: !functions
                          .isUserDetailsComplete(_model.userDetails)
                      ? null
                      : () async {
                          context.pushNamed(
                            CreateOrderWidget.routeName,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 500),
                              ),
                            },
                          );
                        },
                  text: 'Next',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle:
                        FlutterFlowTheme.of(context).titleMedium.override(
                              font: GoogleFonts.poppins(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).info,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontStyle,
                            ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(12.0),
                    disabledColor: FlutterFlowTheme.of(context).tertiary,
                    disabledTextColor: FlutterFlowTheme.of(context).accent1,
                  ),
                ),
              ]
                  .addToStart(SizedBox(height: 10.0))
                  .addToEnd(SizedBox(height: 28.0)),
            ),
          ),
        ),
      ),
    );
  }
}

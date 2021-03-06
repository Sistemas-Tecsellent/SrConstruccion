import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ToggleLikeBrandWidget extends StatefulWidget {
  const ToggleLikeBrandWidget({
    Key key,
    this.brandId,
  }) : super(key: key);

  final String brandId;

  @override
  _ToggleLikeBrandWidgetState createState() => _ToggleLikeBrandWidgetState();
}

class _ToggleLikeBrandWidgetState extends State<ToggleLikeBrandWidget> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: loggedIn ?? true,
      child: StreamBuilder<List<UsersRecord>>(
        stream: queryUsersRecord(
          queryBuilder: (usersRecord) =>
              usersRecord.where('uid', isEqualTo: currentUserUid),
          singleRecord: true,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: SpinKitFadingCircle(
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 50,
                ),
              ),
            );
          }
          List<UsersRecord> toggleIconUsersRecordList = snapshot.data;
          final toggleIconUsersRecord = toggleIconUsersRecordList.isNotEmpty
              ? toggleIconUsersRecordList.first
              : null;
          return ToggleIcon(
            onPressed: () async {
              final likedBrandsElement = widget.brandId;
              final likedBrandsUpdate = toggleIconUsersRecord.likedBrands
                      .toList()
                      .contains(likedBrandsElement)
                  ? FieldValue.arrayRemove([likedBrandsElement])
                  : FieldValue.arrayUnion([likedBrandsElement]);
              final usersUpdateData = {
                'liked_brands': likedBrandsUpdate,
              };
              await toggleIconUsersRecord.reference.update(usersUpdateData);
            },
            value: toggleIconUsersRecord.likedBrands
                .toList()
                .contains(widget.brandId),
            onIcon: Icon(
              Icons.favorite_sharp,
              color: FlutterFlowTheme.of(context).primaryColor,
              size: 25,
            ),
            offIcon: Icon(
              Icons.favorite_border,
              color: FlutterFlowTheme.of(context).primaryColor,
              size: 25,
            ),
          );
        },
      ),
    );
  }
}

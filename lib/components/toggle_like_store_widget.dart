import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ToggleLikeStoreWidget extends StatefulWidget {
  const ToggleLikeStoreWidget({
    Key key,
    this.storeId,
  }) : super(key: key);

  final String storeId;

  @override
  _ToggleLikeStoreWidgetState createState() => _ToggleLikeStoreWidgetState();
}

class _ToggleLikeStoreWidgetState extends State<ToggleLikeStoreWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      alignment: AlignmentDirectional(0, 0),
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
              final likedStoresElement = widget.storeId;
              final likedStoresUpdate = toggleIconUsersRecord.likedStores
                      .toList()
                      .contains(likedStoresElement)
                  ? FieldValue.arrayRemove([likedStoresElement])
                  : FieldValue.arrayUnion([likedStoresElement]);
              final usersUpdateData = {
                'liked_stores': likedStoresUpdate,
              };
              await toggleIconUsersRecord.reference.update(usersUpdateData);
            },
            value: toggleIconUsersRecord.likedStores
                .toList()
                .contains(widget.storeId),
            onIcon: Icon(
              Icons.favorite_sharp,
              color: Color(0xFF050505),
              size: 15,
            ),
            offIcon: Icon(
              Icons.favorite_border,
              color: Color(0xFF050505),
              size: 15,
            ),
          );
        },
      ),
    );
  }
}

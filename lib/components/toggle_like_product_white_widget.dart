import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ToggleLikeProductWhiteWidget extends StatefulWidget {
  const ToggleLikeProductWhiteWidget({
    Key key,
    this.productId,
  }) : super(key: key);

  final String productId;

  @override
  _ToggleLikeProductWhiteWidgetState createState() =>
      _ToggleLikeProductWhiteWidgetState();
}

class _ToggleLikeProductWhiteWidgetState
    extends State<ToggleLikeProductWhiteWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
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
            final likedProductsElement = widget.productId;
            final likedProductsUpdate = toggleIconUsersRecord.likedProducts
                    .toList()
                    .contains(likedProductsElement)
                ? FieldValue.arrayRemove([likedProductsElement])
                : FieldValue.arrayUnion([likedProductsElement]);
            final usersUpdateData = {
              'liked_products': likedProductsUpdate,
            };
            await toggleIconUsersRecord.reference.update(usersUpdateData);
          },
          value: toggleIconUsersRecord.likedProducts
              .toList()
              .contains(widget.productId),
          onIcon: Icon(
            Icons.favorite_sharp,
            color: FlutterFlowTheme.of(context).secondaryBackground,
            size: 25,
          ),
          offIcon: Icon(
            Icons.favorite_border,
            color: FlutterFlowTheme.of(context).secondaryBackground,
            size: 25,
          ),
        );
      },
    );
  }
}

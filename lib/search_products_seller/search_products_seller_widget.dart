import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchProductsSellerWidget extends StatefulWidget {
  const SearchProductsSellerWidget({Key key}) : super(key: key);

  @override
  _SearchProductsSellerWidgetState createState() =>
      _SearchProductsSellerWidgetState();
}

class _SearchProductsSellerWidgetState
    extends State<SearchProductsSellerWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0x00FFFFFF),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Buscar',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontSize: 18,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 40,
                      constraints: BoxConstraints(
                        maxWidth: 400,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextFormField(
                        controller: textController,
                        onChanged: (_) => EasyDebounce.debounce(
                          'textController',
                          Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Buscar por código',
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(10, 15, 0, 0),
                          suffixIcon: textController.text.isNotEmpty
                              ? InkWell(
                                  onTap: () => setState(
                                    () => textController?.clear(),
                                  ),
                                  child: Icon(
                                    Icons.clear,
                                    color: Color(0xFFDCDCDC),
                                    size: 22,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Montserrat',
                              fontSize: 13,
                            ),
                        maxLines: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 5),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 4,
                        borderWidth: 1,
                        buttonSize: 35,
                        fillColor: Color(0xFF1EEBBD),
                        icon: Icon(
                          Icons.search,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          size: 15,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder<List<ProductsRecord>>(
                  future: ProductsRecord.search(
                    term: textController.text,
                    maxResults: 10,
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
                    List<ProductsRecord> listViewProductsRecordList =
                        snapshot.data;
                    // Customize what your widget looks like with no search results.
                    if (snapshot.data.isEmpty) {
                      return Container(
                        height: 100,
                        child: Center(
                          child: Text('No results.'),
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewProductsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewProductsRecord =
                            listViewProductsRecordList[listViewIndex];
                        return Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                          child: InkWell(
                            onTap: () async {
                              context.pushNamed(
                                'ProductPage',
                                params: {
                                  'productId': serializeParam(
                                      listViewProductsRecord.id,
                                      ParamType.String),
                                }.withoutNulls,
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      listViewProductsRecord.mainImage,
                                      'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                    ),
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: AutoSizeText(
                                        listViewProductsRecord.title
                                            .maybeHandleOverflow(maxChars: 10),
                                        maxLines: 3,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              fontSize: 13,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0x00EEEEEE),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: AutoSizeText(
                                        listViewProductsRecord.code
                                            .maybeHandleOverflow(maxChars: 10),
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFFABABAB),
                                              fontSize: 13,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

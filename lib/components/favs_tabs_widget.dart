import '../components/home_product_destacados_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class FavsTabsWidget extends StatefulWidget {
  const FavsTabsWidget({Key key}) : super(key: key);

  @override
  _FavsTabsWidgetState createState() => _FavsTabsWidgetState();
}

class _FavsTabsWidgetState extends State<FavsTabsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    height: 340,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: DefaultTabController(
                        length: 3,
                        initialIndex: 0,
                        child: Column(
                          children: [
                            TabBar(
                              labelColor: Colors.black,
                              unselectedLabelColor: Color(0xFF8B8B8B),
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodyText1,
                              indicatorColor:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              tabs: [
                                Tab(
                                  text: 'Favoritos\nde la Semana',
                                ),
                                Tab(
                                  text: 'Más\nVendidos',
                                ),
                                Tab(
                                  text: 'Ofertas',
                                ),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 0, 0),
                                    child: HomeProductDestacadosWidget(
                                      orderBy: 'likes',
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 0, 0),
                                    child: HomeProductDestacadosWidget(
                                      orderBy: 'sales',
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 0, 0),
                                    child: HomeProductDestacadosWidget(
                                      orderBy: 'sales',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../controllers/post_controller.dart';
import '../models/post_model.dart';
import '../utils/color_utils.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({Key? key, required this.title}) : super(key: key);

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<PostDetailPage> createState() => PostDetailPageState();
}

class PostDetailPageState extends State<PostDetailPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: Colors.black,
  automaticallyImplyLeading: false,
  leading: FlutterFlowIconButton(
    borderColor: Colors.transparent,
    borderRadius: 30,
    borderWidth: 1,
    buttonSize: 40,
    icon: Icon(
      Icons.arrow_back_rounded,
      color: Colors.white,
      size: 30,
    ),
    onPressed: () {
      print('IconButton pressed ...');
    },
  ),
  title: Align(
    alignment: AlignmentDirectional(-1.2, 0),
    child: Text(
      'Community',
      style: FlutterFlowTheme.of(context).title2.override(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 22,
          ),
    ),
  ),
  actions: [],
  centerTitle: false,
  elevation: 2,
);
  }
}

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[]
              comment() )
        )
      )
    );
  }

  comment() {
  }

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text('Community'),
        centerTitle: false,
        leading: const IconButton(icon: Icon(Icons.menu), onPressed: null),
        actions: [
          IconButton(icon: const Icon(Icons.image), onPressed: null),
          const IconButton(icon: Icon(Icons.search), onPressed: null),
        ],
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
      body: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
        Container(
          width: 40,
          height: 40,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image(
            image: AssetImage('assets/imgs/profile.jpeg'),
          ),
        )
      ])));
  Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
      child: Row(mainAxisSize: MainAxisSize.max, children: [
        Icon(
          Icons.favorite_border,
          color: Color(0xFF57636C),
          size: 24,
        ),
      ]));
  Padding(
      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
      child: Text(
        '3',
      ));
  Padding(
      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
      child: Text(
        'likes',
      ));
  Padding(
    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
    child: Icon(
      Icons.mode_comment_outlined,
      color: Color(0xFF57636C),
      size: 24,
    ),
  );
  Padding(
    padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
    child: Text('8'),
  );
  Padding(
    padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
    child: Text('Comments'),
  );
  Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
      child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.75,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          )))
                ])
          ]));
  child:
  Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
      child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Anonymous',
            Text(
                  'That game was insane bro',
                  ),
            )])
          );
  Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12, 4, 0, 0),
      child: Text(
        '12 min ago',
      ));
}

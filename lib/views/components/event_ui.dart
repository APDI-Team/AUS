import 'package:aus/utils/color_utils.dart';
import 'package:flutter/material.dart';
import '../../controllers/event_controller.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/svg.dart';

//determine image of category button, default is seminar
String categoryButtonImage(String eventCategory) {
  if (eventCategory == "Webinar") {
    return 'assets/imgs/button-webinar.svg';
  } else if (eventCategory == "Workshop") {
    return 'assets/imgs/button-workshop.svg';
  } else if (eventCategory == "Party") {
    return 'assets/imgs/button-party.svg';
  } else if (eventCategory == "Competition") {
    return 'assets/imgs/button-competition.svg';
  }
  return 'assets/imgs/button-seminar.svg';
}

//default color is blue
String buttonColor(String eventCategory) {
  if (eventCategory == "Webinar") {
    return "#578a5a"; //green
  } else if (eventCategory == "Competition") {
    return "#864ac0"; //purple
  } else if (eventCategory == "Workshop") {
    return "#dfb064"; //yellow
  } else if (eventCategory == "Party") {
    return "#249998"; //blue
  }
  return "b05033"; //orange
}

//determine thumbnail image of events, default image is seminar
String eventImage(String eventCategory) {
  if (eventCategory == "Webinar") {
    return 'assets/imgs/thumbnail-webinar.png';
  } else if (eventCategory == "Workshop") {
    return 'assets/imgs/thumbnail-workshop.png';
  } else if (eventCategory == "Party") {
    return 'assets/imgs/thumbnail-party.png';
  } else if (eventCategory == "Competition") {
    return 'assets/imgs/thumbnail-competition.png';
  }
  return 'assets/imgs/thumbnail-seminar.png';
}

String capitalize(String value) {
  var result = value[0].toUpperCase();
  bool cap = true;
  for (int i = 1; i < value.length; i++) {
    if (value[i - 1] == " " && cap == true) {
      result = result + value[i].toUpperCase();
    } else {
      result = result + value[i];
      cap = false;
    }
  }
  return result;
}

//event photo
Widget eventPhoto(BuildContext context, EventController controller) {
  return Container(
    width: 168,
    height: 112,
    decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(eventImage(controller.event.category)),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(5)),
  );

  //     SizedBox(
  //   width: 168,
  //   height: 112,
  //   child: SvgPicture.asset(
  //     eventImage(controller.event.category),
  //   ),
  // );
}

//category button
Widget categoryButton(BuildContext context, EventController controller) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
    child: SizedBox(
        child:
            SvgPicture.asset(categoryButtonImage(controller.event.category))),
  );
}

//event title
Widget eventTitle(BuildContext context, EventController controller) {
  return Container(
    width: 168,
    child: Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
      child: Text(
        capitalize(controller.event.title),
        // controller.event.title,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontFamily: 'Outfit',
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600),
      ),
    ),
  );
}

//event date
Widget eventDate(BuildContext context, EventController controller) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
    child: Text(
      DateFormat('dd.MM.yyyy').format(controller.event.eventTime),
      style: Theme.of(context).textTheme.bodyText2?.copyWith(
            fontFamily: 'Outfit',
            color: hexStringToColor("#AAAAAA"),
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
    ),
  );
}

//event hashtag
Widget eventHashTag(BuildContext context, EventController controller) {
  return Container(
    width: 168,
    child: Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
      child: Text(
        "#${controller.event.tag.join(' #')}",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontFamily: 'Outfit',
              color: hexStringToColor("#AAAAAA"),
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
      ),
    ),
  );
}

Widget contentUI(BuildContext context, EventController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      categoryButton(context, controller),
      eventTitle(context, controller),
      eventDate(context, controller),
      eventHashTag(context, controller),
    ],
  );
}

Widget eventUI(BuildContext context, EventController controller,
    {Function? setState}) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
    child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'event_detail',
            arguments: {'event': controller.event});
      },
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            eventPhoto(context, controller),
            contentUI(context, controller),
          ],
        ),
      ),
    ),
  );
}

Widget savedEventUI(BuildContext context, EventController controller,
    {Function? setState, bool first = false}) {
  double topPad = first ? 16 : 0;
  return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, topPad, 16, 0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'event_detail',
              arguments: {'event': controller.event});
        },
        child: Column(
          children: [
            Row(
              children: [
                eventPhoto(context, controller),
                const SizedBox(width: 12),
                Expanded(child: contentUI(context, controller)),
              ],
            ),
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                child: Divider()),
          ],
        ),
      ));
}

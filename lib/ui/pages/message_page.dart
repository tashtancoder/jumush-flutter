
import 'package:flutter/material.dart';
import 'package:jumush/constants/strings/texts.dart';
import 'package:jumush/ui/pages/message_detail_page.dart';
import '/constants/styles/text_styles.dart' as style;
import '/ui/components/buttons.dart' as button;
import '/constants/styles/search_bars.dart' as searchbar;
import '/generated/l10n.dart';


class MessagePage extends StatefulWidget {
  MessagePage({Key? key}) : super(key: key);

  static const String page_id = 'message_page';

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<int> text = [1, 2, 3, 4, 5, 6, 7];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppbar(),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        S.of(context).chat,
        style: style.headText(),
      ),
      automaticallyImplyLeading: false,
    );
  }

  Widget _buildBody(context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            searchbar.searchbar(S.of(context).search_person),
            const SizedBox(
              height: 20,
            ),

            for (var i in text)
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => MessageDetailPage()));
                },
                child: slidersContent(),
              ),
          ],
        ),
      ),
    );
  }
}

Widget chatProfile(img) {
  return Padding(
    padding: EdgeInsets.only(right: 5),
    child: Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: SizedBox.fromSize(
          size: Size.fromRadius(30),
          child: FittedBox(
            child: Image(image: AssetImage(img)),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}

Widget slidersContent() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/user5.jpg'),
              radius: 25,
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    testName2,
                    style: style.simpleBoldText(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                  ),
                ),
                SizedBox(
                  height: 1.0,
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    testMsg,
                    style: style.simpleText(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          '10:30',
          style: style.simpleText(),
        ),
      ],
    ),
  );
}

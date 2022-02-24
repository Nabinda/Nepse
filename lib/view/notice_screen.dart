import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepse/bloc/notice/bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/notices/notice_model.dart';

class NoticeScreen extends StatefulWidget {
  static const String routeName = "/notice_screen";
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  void getData() {
    BlocProvider.of<NoticeBloc>(context).add(const FetchNotice());
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  openWebSite(String url) async {
    print(url);
    //TODO:: URL Not opening
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notice"),
      ),
      body: BlocBuilder<NoticeBloc, NoticeState>(builder: (context, state) {
        if (state is NoticeLoaded) {
          List<NoticeModel> data = state.notice.noticeList;
          return noticeData(context, data);
        } else if (state is NoticeError) {
          return const Text("Error");
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }

  Widget noticeData(BuildContext context, List<NoticeModel> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: ListTile(
                  leading: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Text(data[index].author)),
                  title: Text(
                    data[index].noticeHeading,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    data[index].noticeBody,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      openWebSite(
                          'https://www.nepalstock.com.np/api/nots/news/notice/fetchFiles/' +
                              data[index].filePath);
                    },
                    icon: const Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 2.0,
                color: Colors.grey,
              )
            ],
          );
        });
  }
}

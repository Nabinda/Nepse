import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepse/bloc/top_traders/bloc.dart';
import 'package:nepse/model/top_traders/top_traders_model.dart';

class TopTraders extends StatefulWidget {
  final String topTraders;
  const TopTraders({Key? key, required this.topTraders}) : super(key: key);

  @override
  _TopTradersState createState() => _TopTradersState();
}

class _TopTradersState extends State<TopTraders> {
  int pageNumber = 1;
  int totalItemsCount = 182;
  List<InkWell> _page = <InkWell>[];
  void resetPage() {
    _page = <InkWell>[];
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TopTradersBloc>(context)
        .add(FetchTopTraders(pageNumber: pageNumber));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<TopTradersBloc, TopTradersState>(
          builder: (context, state) {
        if (state is TopTradersLoaded) {
          List<TopTradersModel> data = state.topTradersList.topTradersList;
          return tradersData(context, data);
        } else if (state is TopTradersError) {
          return const Text("Error");
        } else {
          return const CircularProgressIndicator();
        }
      }),
    );
  }

  Widget tradersData(BuildContext context, List<TopTradersModel> data) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          dataHeader("Symbol"),
          dataHeader("LTP"),
          dataHeader("Pt. Change"),
          dataHeader("% Change"),
        ],
      ),
      const Divider(
        thickness: 1.5,
        color: Colors.blueGrey,
      ),
      LayoutBuilder(builder: (BuildContext context, BoxConstraints constraint) {
        return SizedBox(
          height: 1120,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        dataText(data[index].symbol),
                        dataText(data[index].ltp.toString()),
                        dataText(data[index].pointChange.toString()),
                        dataText(data[index].percentageChange.toString()),
                      ],
                    ),
                    const Divider(
                      thickness: 0.5,
                      color: Colors.blueGrey,
                    ),
                  ],
                );
              }),
        );
      }),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
              onTap: () {
                pageNumber--;
                resetPage();
                BlocProvider.of<TopTradersBloc>(context)
                    .add(FetchTopTraders(pageNumber: pageNumber));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.15,
                padding: const EdgeInsets.all(8.0),
                child:
                    const FittedBox(fit: BoxFit.contain, child: Text("<<Prev")),
              )),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: pagingNumber()),
          InkWell(
              onTap: () {
                pageNumber++;
                resetPage();
                BlocProvider.of<TopTradersBloc>(context)
                    .add(FetchTopTraders(pageNumber: pageNumber));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.15,
                padding: const EdgeInsets.all(8.0),
                child:
                    const FittedBox(fit: BoxFit.contain, child: Text("Next>>")),
              )),
        ],
      )
    ]);
  }

  Widget dataText(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      height: 30,
      width: MediaQuery.of(context).size.width * 0.22,
      child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            text,
            textAlign: TextAlign.center,
          )),
    );
  }

  Widget dataHeader(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      height: 30,
      width: MediaQuery.of(context).size.width * 0.22,
      child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w700),
          )),
    );
  }

  Widget pagingNumber() {
    int totalPageCount = (totalItemsCount ~/ 20) + 1;
    List<int> toDisplayPageNumbersAtFirst = <int>[1];
    List<int> toDisplayPageNumbersAtMid = <int>[];
    List<int> toDisplayPageNumbersAtLast = <int>[totalPageCount];
    if (pageNumber == 1 || pageNumber == 2) {
      toDisplayPageNumbersAtFirst.add(2);
      toDisplayPageNumbersAtFirst.add(3);
    } else if (pageNumber == totalPageCount ||
        pageNumber == totalPageCount - 1) {
      toDisplayPageNumbersAtLast.add(totalPageCount - 2);
      toDisplayPageNumbersAtLast.add(totalPageCount - 1);
    } else {
      toDisplayPageNumbersAtMid.add(pageNumber - 1);
      toDisplayPageNumbersAtMid.add(pageNumber);
      toDisplayPageNumbersAtMid.add(pageNumber + 1);
    }
    toDisplayPageNumbersAtFirst.sort();
    toDisplayPageNumbersAtMid.sort();
    toDisplayPageNumbersAtLast.sort();
    return pagingFunction(toDisplayPageNumbersAtFirst,
        toDisplayPageNumbersAtMid, toDisplayPageNumbersAtLast);
  }

  Widget pagingFunction(List<int> first, List<int> mid, List<int> last) {
    for (int pageNo in first) {
      _page.add(InkWell(
          onTap: () {
            if (pageNumber != pageNo) {
              pageNumber = pageNo;
              resetPage();
              BlocProvider.of<TopTradersBloc>(context)
                  .add(FetchTopTraders(pageNumber: pageNo));
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  pageNo.toString(),
                  style: TextStyle(
                      color: pageNo == pageNumber ? Colors.blue : Colors.black),
                )),
          )));
    }
    _page.add(const InkWell(
        child: Padding(
      padding: EdgeInsets.all(5.0),
      child: FittedBox(fit: BoxFit.contain, child: Text("...")),
    )));
    for (int pageNo in mid) {
      _page.add(InkWell(
          onTap: () {
            if (pageNumber != pageNo) {
              pageNumber = pageNo;
              resetPage();
              BlocProvider.of<TopTradersBloc>(context)
                  .add(FetchTopTraders(pageNumber: pageNo));
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  pageNo.toString(),
                  style: TextStyle(
                      color: pageNo == pageNumber ? Colors.blue : Colors.black),
                )),
          )));
    }
    if (mid.isNotEmpty) {
      _page.add(const InkWell(
          child: Padding(
        padding: EdgeInsets.all(5.0),
        child: FittedBox(fit: BoxFit.contain, child: Text("...")),
      )));
    }
    for (int pageNo in last) {
      _page.add(InkWell(
          onTap: () {
            if (pageNumber != pageNo) {
              pageNumber = pageNo;
              resetPage();
              BlocProvider.of<TopTradersBloc>(context)
                  .add(FetchTopTraders(pageNumber: pageNo));
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  pageNo.toString(),
                  style: TextStyle(
                      color: pageNo == pageNumber ? Colors.blue : Colors.black),
                )),
          )));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: _page,
    );
  }
}

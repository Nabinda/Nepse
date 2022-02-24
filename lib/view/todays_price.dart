import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepse/bloc/todays_price/bloc.dart';
import 'package:nepse/model/todays_price/todays_price_model.dart';

class TodaysPriceScreen extends StatefulWidget {
  static const String routeName = "/today's_price_screen";
  const TodaysPriceScreen({Key? key}) : super(key: key);

  @override
  State<TodaysPriceScreen> createState() => _TodaysPriceScreenState();
}

class _TodaysPriceScreenState extends State<TodaysPriceScreen> {
  int pageNumber = 1;
  int totalItemsCount = 182;
  List<InkWell> _page = <InkWell>[];
  void getData({int indexingPage = 1}) {
    BlocProvider.of<TodaysPriceBloc>(context)
        .add(FetchTodaysPrice(pageNumber: indexingPage));
  }
  void resetPage() {
    _page = <InkWell>[];
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's Price"),
      ),
      body: BlocBuilder<TodaysPriceBloc, TodaysPriceState>(
          builder: (context, state) {
        if (state is TodaysPriceLoaded) {
          List<TodaysPriceModel> data = state.todaysPrice.todaysPriceList;
          return priceData(context, data);
        } else if (state is TodaysPriceError) {
          return const Text("Error");
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }

  Widget priceData(BuildContext context, List<TodaysPriceModel> data) {
    resetPage();
    return InteractiveViewer(
      constrained: false,
      scaleEnabled: true,
      alignPanAxis: true,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                dataHeader(context, 'Symbol'),
                dataHeader(context, 'Open Price(Rs.)'),
                dataHeader(context, 'High Price(Rs.)'),
                dataHeader(context, 'Low Price(Rs.)'),
                dataHeader(context, 'Total Traded Quantity'),
                dataHeader(context, 'Total Traded Value'),
                dataHeader(context, 'Total Trades'),
                dataHeader(context, 'LTP'),
                dataHeader(context, 'Previous Day Close Price(Rs)'),
                dataHeader(context, 'Average Traded Price(Rs)'),
                dataHeader(context, '52 Week High(Rs)'),
                dataHeader(context, '52 Week Low(Rs)'),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.258 * 12,
              color: Colors.blueGrey,
              height: 1.5,
            ),
            tableContent(context, data),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap: () {
                        pageNumber--;
                        resetPage();
                        getData(indexingPage: pageNumber);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.17,
                        padding: const EdgeInsets.all(8.0),
                        child: const FittedBox(
                            fit: BoxFit.contain, child: Text("<<Prev")),
                      )),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: pagingNumber()),
                  InkWell(
                      onTap: () {
                        pageNumber++;
                        resetPage();
                        getData(indexingPage: pageNumber);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.17,
                        padding: const EdgeInsets.all(8.0),
                        child: const FittedBox(
                            fit: BoxFit.contain, child: Text("Next>>")),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget tableContent(BuildContext context, List<TodaysPriceModel> data) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.258 * 12,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    dataText(context, data[index].symbol),
                    dataText(context, data[index].openPrice.toString()),
                    dataText(context, data[index].highPrice.toString()),
                    dataText(context, data[index].lowPrice.toString()),
                    dataText(
                        context, data[index].totalTradedQuantity.toString()),
                    dataText(context, data[index].totalTradedValue.toString()),
                    dataText(context, data[index].totalTrades.toString()),
                    dataText(context, data[index].lastUpdatedPrice.toString()),
                    dataText(
                        context, data[index].previousDayClosePrice.toString()),
                    dataText(
                        context, data[index].averageTradedPrice.toString()),
                    dataText(
                      context,
                      data[index].fiftyTwoWeekHigh.toString(),
                    ),
                    dataText(
                      context,
                      data[index].fiftyTwoWeekLow.toString(),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.258 * 12,
                  color: Colors.blueGrey,
                  height: 0.5,
                ),
              ],
            );
          }),
    );
  }

  Widget dataHeader(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      width: MediaQuery.of(context).size.width * 0.23,
      child: AutoSizeText(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600),
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget dataText(BuildContext context, String text,
      {Color color = Colors.black}) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        width: MediaQuery.of(context).size.width * 0.23,
        child: AutoSizeText(
          text,
          maxLines: 2,
          style: TextStyle(color: color),
          textAlign: TextAlign.center,
        ));
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
              getData(indexingPage: pageNo);
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
              getData(indexingPage: pageNo);
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
              getData(indexingPage: pageNo);
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: _page,
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepse/bloc/floor_sheet/bloc.dart';
import 'package:nepse/model/floor_sheet/floor_sheet_model.dart';

class FloorSheetScreen extends StatefulWidget {
  static const String routeName = "/floor_sheet_screen";
  const FloorSheetScreen({Key? key}) : super(key: key);

  @override
  State<FloorSheetScreen> createState() => _FloorSheetScreenState();
}

class _FloorSheetScreenState extends State<FloorSheetScreen> {
  int pageNumber = 1;
  int totalItemsCount = 182;
  List<InkWell> _page = <InkWell>[];
  void getData({int indexingPage = 1}) {
    BlocProvider.of<FloorSheetBloc>(context)
        .add(FetchFloorSheet(pageNumber: indexingPage));
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
        title: const Text("Floor Sheet"),
      ),
      body: BlocBuilder<FloorSheetBloc, FloorSheetState>(
          builder: (context, state) {
        if (state is FloorSheetLoaded) {
          List<FloorSheetModel> data = state.floorSheet.floorSheetList;
          return floorSheetData(context, data);
        } else if (state is FloorSheetError) {
          return const Text("Error");
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }

  Widget floorSheetData(BuildContext context, List<FloorSheetModel> data) {
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
                dataBigHeader(context, 'Contract No.'),
                dataHeader(context, 'Buyer'),
                dataHeader(context, 'Seller'),
                dataHeader(context, 'Quantity'),
                dataHeader(context, 'Rate(Rs)'),
                dataHeader(context, 'Amount(Rs)'),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.258 * 7.5,
              color: Colors.blueGrey,
              height: 1.5,
            ),
            tableContent(context, data),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.258 * 7.5,
              child: Center(
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
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget tableContent(BuildContext context, List<FloorSheetModel> data) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.258 * 7.5,
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
                    dataText(context, data[index].stockSymbol),
                    dataBigText(context, data[index].contractId.toString()),
                    dataText(context, data[index].buyerMemberId.toString()),
                    dataText(context, data[index].sellerMemberId.toString()),
                    dataText(context, data[index].contractQuantity.toString()),
                    dataText(context, data[index].contractRate.toString()),
                    dataText(context, data[index].contractAmount.toString()),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.258 * 7.5,
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

  Widget dataBigHeader(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      width: MediaQuery.of(context).size.width * 0.33,
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

  Widget dataBigText(BuildContext context, String text,
      {Color color = Colors.black}) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        width: MediaQuery.of(context).size.width * 0.33,
        child: AutoSizeText(
          text,
          maxLines: 1,
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

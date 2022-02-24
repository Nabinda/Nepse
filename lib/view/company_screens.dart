import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepse/bloc/company/company_bloc.dart';
import 'package:nepse/bloc/company/company_event.dart';
import 'package:nepse/model/company/company_model.dart';

import '../bloc/company/company_state.dart';


class CompanyScreen extends StatefulWidget {
  static const String routeName = "/company_screen";

  const CompanyScreen({Key? key}) : super(key: key);

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  int pageNumber = 1;
  int totalItemsCount = 182;
  List<InkWell> _page = <InkWell>[];
  void getData({int indexingPage = 1}) {
    BlocProvider.of<CompanyBloc>(context)
        .add(FetchCompany(pageNumber: indexingPage));
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
        title: const Text('Companies'),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<CompanyBloc, CompanyState>(
            builder: (context, state) {
              if (state is CompanyLoaded) {
                List<CompanyModel> data = state.company.companyList;
                return companyData(context, data);
              } else if (state is CompanyError) {
                return const Text("Error");
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
  Widget companyData(BuildContext context, List<CompanyModel> data) {
    resetPage();
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
          physics: const ScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: ListTile(
                      leading: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.13,
                          child: Center(child: Text(data[index].symbol))),
                      title: Text(
                        data[index].companyName,
                      ),
                      subtitle: Text(
                        data[index].companyEmail +"\n"+data[index].sectorName,
                      ),
                      trailing: Text(data[index].status),
                    ),
                  ),
                  const Divider(
                    height: 2.0,
                    color: Colors.grey,
                  )
                ],
              );
            }),
        const SizedBox(height: 4.0,),
        Row(
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
                  child:
                  const FittedBox(fit: BoxFit.contain, child: Text("<<Prev")),
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
                  child:
                  const FittedBox(fit: BoxFit.contain, child: Text("Next>>")),
                )),
          ],
        )
      ],
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
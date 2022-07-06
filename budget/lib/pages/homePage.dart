import 'package:budget/database/tables.dart';
import 'package:budget/functions.dart';
import 'package:budget/main.dart';
import 'package:budget/pages/addTransactionPage.dart';
import 'package:budget/pages/subscriptionsPage.dart';
import 'package:budget/pages/transactionsListPage.dart';
import 'package:budget/struct/databaseGlobal.dart';
import 'package:budget/widgets/budgetContainer.dart';
import 'package:budget/widgets/button.dart';
import 'package:budget/widgets/fadeIn.dart';
import 'package:budget/widgets/lineGraph.dart';
import 'package:budget/widgets/openContainerNavigation.dart';
import 'package:budget/widgets/pageFramework.dart';
import 'package:budget/widgets/pieChart.dart';
import 'package:budget/widgets/tappable.dart';
import 'package:budget/widgets/textInput.dart';
import 'package:budget/widgets/textWidgets.dart';
import 'package:budget/widgets/transactionEntry.dart';
import 'package:budget/widgets/walletEntry.dart';
import 'package:flutter/material.dart';
import "../struct/budget.dart";
import 'package:budget/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required Function this.changePage,
  }) : super(key: key);

  final changePage;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  void refreshState() {
    setState(() {});
  }

  void scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 1200), curve: Curves.elasticOut);
  }

  @override
  bool get wantKeepAlive => true;
  bool showElevation = false;
  late ScrollController _scrollController;
  late AnimationController _animationControllerHeader;
  late AnimationController _animationControllerHeader2;

  void initState() {
    super.initState();
    _animationControllerHeader = AnimationController(vsync: this, value: 1);
    _animationControllerHeader2 = AnimationController(vsync: this, value: 1);

    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  _scrollListener() {
    double percent = _scrollController.offset / (200);
    if (percent >= 0 && percent <= 1) {
      _animationControllerHeader.value = 1 - _scrollController.offset / (200);
      _animationControllerHeader2.value =
          1 - _scrollController.offset * 2 / (200);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animationControllerHeader.dispose();
    _animationControllerHeader2.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Wipe all remaining pixels off - sometimes graphics artifacts are left behind
          SliverToBoxAdapter(
            child: Container(height: 1, color: Theme.of(context).canvasColor),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  // Subtract one (1) here because of the thickness of the wiper above
                  height: 207 - 1 + MediaQuery.of(context).padding.top,
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.only(left: 18, bottom: 22, right: 18),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          appStateSettings["username"] == ""
                              ? SizedBox()
                              : AnimatedBuilder(
                                  animation: _animationControllerHeader,
                                  builder: (_, child) {
                                    return Transform.translate(
                                      offset: Offset(
                                          0,
                                          20 -
                                              20 *
                                                  (_animationControllerHeader
                                                      .value)),
                                      child: child,
                                    );
                                  },
                                  child: FadeTransition(
                                    opacity: _animationControllerHeader2,
                                    child: TextFont(
                                      text: getWelcomeMessage(),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                          AnimatedBuilder(
                            animation: _animationControllerHeader,
                            builder: (_, child) {
                              return Transform.scale(
                                alignment: Alignment.bottomLeft,
                                scale: _animationControllerHeader.value < 0.5
                                    ? 0.25 + 0.5
                                    : (_animationControllerHeader.value) * 0.5 +
                                        0.5,
                                child: child,
                              );
                            },
                            child: TextFont(
                              text: appStateSettings["username"] == ""
                                  ? "Home"
                                  : appStateSettings["username"],
                              fontWeight: FontWeight.bold,
                              fontSize: 39,
                              textColor: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                          ),
                        ],
                      ),
                      // Profile icon
                      // AnimatedBuilder(
                      //   animation: _animationControllerHeader,
                      //   builder: (_, child) {
                      //     return Transform.scale(
                      //       alignment: Alignment.bottomRight,
                      //       scale: _animationControllerHeader.value < 0.5
                      //           ? 0.25 + 0.5
                      //           : (_animationControllerHeader.value) * 0.5 +
                      //               0.5,
                      //       child: child,
                      //     );
                      //   },
                      //   child: Container(
                      //     width: 50,
                      //     height: 50,
                      //     color: Colors.red,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          appStateSettings["showWalletSwitcher"] == true
              ? SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 13.0),
                    child: Container(
                      height: 85.0,
                      child: StreamBuilder<List<TransactionWallet>>(
                        stream: database.watchAllWallets(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              addAutomaticKeepAlives: true,
                              clipBehavior: Clip.none,
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.length + 1,
                              itemBuilder: (context, index) {
                                bool lastIndex = index == snapshot.data!.length;
                                if (lastIndex) {
                                  return WalletEntryAdd();
                                }
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: (index == 0 ? 7 : 0.0),
                                  ),
                                  child: WalletEntry(
                                    selected:
                                        appStateSettings["selectedWallet"] ==
                                            snapshot.data![index].walletPk,
                                    wallet: snapshot.data![index],
                                  ),
                                );
                              },
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                  ),
                )
              : SliverToBoxAdapter(),
          StreamBuilder<List<Budget>>(
            stream: database.watchAllPinnedBudgets(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.length == 0) {
                  return SliverToBoxAdapter();
                }
                if (snapshot.data!.length == 1) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 13, right: 13, bottom: 13),
                      child: BudgetContainer(
                        budget: snapshot.data![0],
                      ),
                    ),
                  );
                }
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 13),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 183,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        viewportFraction: 0.95,
                        clipBehavior: Clip.none,
                      ),
                      items: snapshot.data?.map((Budget budget) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: BudgetContainer(
                            budget: budget,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              } else {
                return SliverToBoxAdapter();
              }
            },
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 13, left: 13, right: 13),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: UpcomingTransactions()),
                  SizedBox(width: 13),
                  Expanded(
                    child: UpcomingTransactions(
                      overdueTransactions: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          StreamBuilder<List<Transaction>>(
            stream: database.getTransactionsInTimeRangeFromCategories(
              DateTime(
                DateTime.now().year,
                DateTime.now().month - 1,
                DateTime.now().day,
              ),
              DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
              ),
              [],
              true,
              true,
            ),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                bool cumulative = appStateSettings["showCumulativeSpending"];
                double cumulativeTotal = 0;
                List<Pair> points = [];
                for (DateTime indexDay = DateTime(
                  DateTime.now().year,
                  DateTime.now().month - 1,
                  DateTime.now().day,
                );
                    indexDay.compareTo(DateTime.now()) < 0;
                    indexDay = indexDay.add(Duration(days: 1))) {
                  //can be optimized...
                  double totalForDay = 0;
                  snapshot.data!.forEach((transaction) {
                    if (indexDay.year == transaction.dateCreated.year &&
                        indexDay.month == transaction.dateCreated.month &&
                        indexDay.day == transaction.dateCreated.day) {
                      totalForDay += transaction.amount;
                    }
                  });
                  cumulativeTotal += totalForDay;
                  points.add(Pair(points.length.toDouble(),
                      cumulative ? cumulativeTotal : totalForDay));
                }
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 13),
                    child: Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, bottom: 10, top: 20),
                        margin: EdgeInsets.symmetric(horizontal: 13),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Theme.of(context)
                              .colorScheme
                              .lightDarkAccentHeavyLight,
                          boxShadow: boxShadow(context),
                        ),
                        child:
                            LineChartWrapper(points: points, isCurved: true)),
                  ),
                );
              }
              return SliverToBoxAdapter();
            },
          ),
          SliverToBoxAdapter(
            child: Container(height: 13),
          ),
          ...getTransactionsSlivers(
              DateTime(DateTime.now().year, DateTime.now().month - 1,
                  DateTime.now().day),
              DateTime.now()),
          SliverToBoxAdapter(
            child: Container(height: 4),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Tappable(
                color: Theme.of(context).colorScheme.lightDarkAccent,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: TextFont(
                    text: "View All Transactions",
                    textAlign: TextAlign.center,
                    fontSize: 16,
                    textColor: Theme.of(context).colorScheme.textLight,
                  ),
                ),
                onTap: () {
                  widget.changePage(1, switchNavbar: true);
                },
                borderRadius: 10,
              ),
            ),
          ),
          SliverToBoxAdapter(child: Container(height: 135)),
          // Wipe all remaining pixels off - sometimes graphics artifacts are left behind
          SliverToBoxAdapter(
            child: Container(height: 1, color: Theme.of(context).canvasColor),
          ),
        ],
      ),
    );
  }
}

class UpcomingTransactions extends StatelessWidget {
  const UpcomingTransactions({
    Key? key,
    bool this.overdueTransactions = false,
  }) : super(key: key);
  final overdueTransactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: boxShadow(context)),
      child: OpenContainerNavigation(
        closedColor: Theme.of(context).colorScheme.lightDarkAccentHeavyLight,
        openPage: PageFramework(
          title: overdueTransactions ? "Overdue" : "Upcoming",
          dragDownToDismiss: true,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    StreamBuilder<List<double?>>(
                      stream: overdueTransactions
                          ? database.watchTotalOfOverdue()
                          : database.watchTotalOfUpcoming(),
                      builder: (context, snapshot) {
                        return CountNumber(
                          count: snapshot.hasData == false ||
                                  snapshot.data![0] == null
                              ? 0
                              : (snapshot.data![0] ?? 0).abs(),
                          duration: Duration(milliseconds: 700),
                          dynamicDecimals: true,
                          initialCount: (0),
                          textBuilder: (number) {
                            return TextFont(
                              text: convertToMoney(number),
                              fontSize: 25,
                              textColor: overdueTransactions
                                  ? Theme.of(context).colorScheme.unPaidRed
                                  : Theme.of(context).colorScheme.unPaidYellow,
                              fontWeight: FontWeight.bold,
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: StreamBuilder<List<int?>>(
                        stream: overdueTransactions
                            ? database.watchCountOfOverdue()
                            : database.watchCountOfUpcoming(),
                        builder: (context, snapshot) {
                          return TextFont(
                            text: snapshot.hasData == false ||
                                    snapshot.data![0] == null
                                ? "/"
                                : snapshot.data![0].toString() +
                                    " transactions",
                            fontSize: 15,
                            textColor: Theme.of(context).colorScheme.textLight,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
            StreamBuilder<List<Transaction>>(
              stream: overdueTransactions
                  ? database.watchAllOverdueTransactions()
                  : database.watchAllUpcomingTransactions(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.length <= 0) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 35, right: 30, left: 30),
                          child: TextFont(
                            maxLines: 4,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            text: "No " +
                                (overdueTransactions ? "overdue" : "upcoming") +
                                " transactions.",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  }
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        Transaction transaction = snapshot.data![index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UpcomingTransactionDateHeader(
                                transaction: transaction),
                            TransactionEntry(
                              openPage: AddTransactionPage(
                                title: "Edit Transaction",
                                transaction: transaction,
                              ),
                              transaction: transaction,
                            ),
                            SizedBox(height: 12),
                          ],
                        );
                      },
                      childCount: snapshot.data?.length,
                    ),
                  );
                } else {
                  return SliverToBoxAdapter();
                }
              },
            ),
          ],
        ),
        borderRadius: 15,
        button: (openContainer) {
          return Tappable(
            color: Theme.of(context).colorScheme.lightDarkAccentHeavyLight,
            onTap: () {
              openContainer();
            },
            child: Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFont(
                      text: overdueTransactions ? "Overdue" : "Upcoming",
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 6),
                    StreamBuilder<List<double?>>(
                      stream: overdueTransactions
                          ? database.watchTotalOfOverdue()
                          : database.watchTotalOfUpcoming(),
                      builder: (context, snapshot) {
                        return CountNumber(
                          count: snapshot.hasData == false ||
                                  snapshot.data![0] == null
                              ? 0
                              : (snapshot.data![0] ?? 0).abs(),
                          duration: Duration(milliseconds: 2500),
                          dynamicDecimals: true,
                          initialCount: (0),
                          textBuilder: (number) {
                            return TextFont(
                              text: convertToMoney(number),
                              fontSize: 25,
                              textColor: overdueTransactions
                                  ? Theme.of(context).colorScheme.unPaidRed
                                  : Theme.of(context).colorScheme.unPaidYellow,
                              fontWeight: FontWeight.bold,
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(height: 5),
                    StreamBuilder<List<int?>>(
                      stream: overdueTransactions
                          ? database.watchCountOfOverdue()
                          : database.watchCountOfUpcoming(),
                      builder: (context, snapshot) {
                        return TextFont(
                          text: snapshot.hasData == false ||
                                  snapshot.data![0] == null
                              ? "/"
                              : snapshot.data![0].toString() + " transactions",
                          fontSize: 15,
                          textColor: Theme.of(context).colorScheme.textLight,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

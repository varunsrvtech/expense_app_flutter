import "package:intl/intl.dart";

import 'package:carousel_slider/carousel_slider.dart';
import 'package:expense_app_flutter/mock_data.dart';
import 'package:expense_app_flutter/models/card.dart';
import 'package:expense_app_flutter/models/transaction.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<ApiTransaction> transactions;
  late List<ApiCard> cards;
  late bool showDigits = false;
  int activeCardIndex = 0;

  @override
  void initState() {
    super.initState();
    transactions = mockTransactions;
    cards = mockCards;
    activeCardIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: const Text('Home'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _cardsSlider(context),
              _transactions(context),
            ],
          ),
        ));
  }

  Widget _cardsSlider(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200,
                viewportFraction: 1,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 3),
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeCardIndex = index;
                  });
                },
              ),
              items: cards.map((e) => _singleCard(context, e)).toList(),
            )),
        Center(
          child: Row(
            children: [
              ...cards.asMap().keys.map((i) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: activeCardIndex == i ? 40 : 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: activeCardIndex == i
                          ? Colors.black87
                          : Colors.black12,
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }

  Widget _singleCard(BuildContext context, ApiCard e) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (showDigits)
                  ...e.number
                      .split(' ')
                      .map((number) => Expanded(
                              child: Center(
                            child: Text(number),
                          )))
                      .cast<Widget>()
                      .toList()
                else
                  ..."XXXX XXXX XXXX ${e.lastDigits}"
                      .split(' ')
                      .map((number) => Expanded(
                              child: Center(
                            child: Text(number),
                          )))
                      .cast<Widget>()
                      .toList(),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    const Text('Card Holder'),
                    Text(e.cardHolderName),
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text('CVV'),
                        Switch(
                            value: showDigits,
                            onChanged: (v) => setState(() {
                                  showDigits = v;
                                }))
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text('Expired'.toUpperCase()),
                    Text(DateFormat('MM / yy').format(e.expiryDate)),
                  ],
                )
              ],
            )
          ],
        ));
  }

  Widget _transactions(BuildContext context) {
    return Column(
      children: [
        ...transactions.map((e) => _singleTransaction(context, e)),
      ],
    );
  }

  Widget _singleTransaction(BuildContext context, ApiTransaction transaction) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 10), blurRadius: 10)
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(80),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(transaction.title),
                    Text(DateFormat('MMMM d, y').format(transaction.date))
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Text('Rs. ${transaction.amount / 100}'),
                Text(transaction.currentStatus.title)
              ],
            )
          ],
        ));
  }
}

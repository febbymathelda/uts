import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Padding(
            padding: EdgeInsets.only(bottom: 1.0),
            child: Text(
              'Transaction History',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          centerTitle: true,
          bottom: const TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                color: Colors.red,
                width: 4.0,
              ),
              insets: EdgeInsets.symmetric(horizontal: 128),
            ),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.red,
            tabs: [
              Tab(
                child: Text(
                  'Pending',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Tab(
                child: Text(
                  'Done',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              color: const Color(0xFFEBF1F9),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/aset_complete_transaction.png',
                      height: 150,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'All transactions are completed!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      'Any Pending transactions will appear in this page',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFBDBDBD),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: const Color(0xFFEBF1F9),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: const [
                    TransactionCard(
                      title: 'Direct Debit',
                      date: '6 Oct 2024, 16:25 WIB',
                      amount: 'Rp 8.500',
                      status: 'Success',
                      description: 'PT.GRAB t20LqoZIQam357M8qlRWEw',
                    ),
                    TransactionCard(
                      title: 'Refund',
                      date: '6 Oct 2024, 16:25 WIB',
                      amount: 'Rp 8.500',
                      status: 'Success',
                      description: 'PT.GRAB 6282297217404',
                    ),
                    TransactionCard(
                      title: 'Reserved',
                      date: '6 Oct 2024, 16:12 WIB',
                      amount: 'Rp 8.500',
                      status: 'Succes',
                      description: 'PT.GRAB O4UMDjtzRYqetUlllGdj33A',
                    ),
                    TransactionCard(
                      title: 'Top Up from Bank',
                      date: '6 Oct 2024, 15:58 WIB',
                      amount: 'Rp 10.000',
                      status: 'Succes',
                      description: 'Top Up BANK BNI',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  final String title;
  final String date;
  final String amount;
  final String description;
  final String status;

  const TransactionCard({
    required this.title,
    required this.date,
    required this.amount,
    required this.description,
    required this.status,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: Colors.white,
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          date,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          amount,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              status,
                              style: TextStyle(
                                color: status == 'Fail'
                                    ? Colors.red
                                    : Colors.green,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 4),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(color: Colors.grey[300]),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 45,
          right: 2,
          child: Container(
            height: 24,
            width: 4,
            decoration: BoxDecoration(
              color: status == 'Fail' ? Colors.red : Colors.green,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

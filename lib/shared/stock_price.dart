import 'package:analytix/shared/yahoo_finance/get_current_price.dart';
import 'package:flutter/material.dart';

class StockPrice extends StatelessWidget {
  const StockPrice({super.key, required this.symbol});
  final String symbol;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getCurrentPrice(symbol),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: SizedBox(
                  height: 6,
                  width: 40,
                  child: LinearProgressIndicator(),
                ),
              );
            case ConnectionState.done:
              var priceColor = (double.parse(snapshot.data![1].toString()) < 0) ? Colors.red : Colors.green;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    snapshot.data![0].toString(),
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        snapshot.data![1].toString(),
                        style: TextStyle(color: priceColor),
                      ),
                      Text(
                        snapshot.data![2].toString(),
                        style: TextStyle(color: priceColor),
                      ),
                    ],
                  )
                ],
              );
            default:
              return const Text("Error");
          }
        });
  }
}

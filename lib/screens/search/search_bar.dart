import 'package:analytix/shared/stock_price.dart';
import 'package:analytix/shared/yahoo_finance/search_assist.dart';
import 'package:flutter/material.dart';

class SearchBarSuggestion extends StatefulWidget {
  const SearchBarSuggestion({super.key});

  @override
  State<SearchBarSuggestion> createState() => _SearchBarSuggestionState();
}

class _SearchBarSuggestionState extends State<SearchBarSuggestion> {
  String _searchText = '';
  final TextEditingController _searchFieldController = TextEditingController();

  Future<List<dynamic>> _getSuggestions() async {
    List<dynamic> x = [];
    if (_searchText.isNotEmpty) {
      x = await searchAssist(_searchText);
    }
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        TextField(
          autocorrect: false,
          autofocus: true,
          controller: _searchFieldController,
          maxLines: 1,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            hintText: "Search",
            prefixIcon: const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Icon(Icons.search_rounded),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: IconButton(
                onPressed: () {
                  _searchFieldController.clear();
                },
                icon: const Icon(Icons.close_rounded),
              ),
            ),
          ),
          onChanged: (value) {
            setState(() {
              _searchText = value;
            });
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: FutureBuilder(
            future: _getSuggestions(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(
                    child: SizedBox(
                      height: 60,
                      width: 60,
                      child: CircularProgressIndicator(),
                    ),
                  );
                case ConnectionState.done:
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (_, index) {
                        String stockName = snapshot.data?[index]['name'];
                        String stockSymbol = snapshot.data?[index]['symbol'];
                        String stockExchange = snapshot.data?[index]['exchDisp'];
                        String stockType = snapshot.data?[index]['typeDisp'];

                        return Container(
                          height: 100,
                          padding: const EdgeInsets.only(top: 10),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          stockName,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                stockExchange,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Flexible(
                                              child: Text(
                                                stockSymbol,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Flexible(
                                              child: Text(
                                                stockType,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: StockPrice(symbol: stockSymbol),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                // TODO: Handle other connectionstate
                default:
                  return const Text("Error");
              }
            },
          ),
        )
      ],
    );
  }
}

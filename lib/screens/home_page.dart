import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/items_data.dart';
import 'package:to_do_app/screens/settings_page.dart';
import 'package:to_do_app/widgets/item_card.dart';

import 'item_adder.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: buildAppBar(context),
      body: buildColumn(context),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          iconSize: 35,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SetingsPage()));
          },
        ),
      ],
      title: Text(
        'Get In Done',
      ),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            // height: 150,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "${Provider.of<ItemData>(context).items.length} Items",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              //  height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Consumer<ItemData>(
                  builder: (context, itemData, child) => Align(
                    alignment: Alignment.topCenter,
                    child: ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: itemData.items.length,
                      itemBuilder: (context, index) => ItemCard(
                        title:
                            itemData.items[index].title,
                        isDone:
                            itemData.items[index].isDone,
                        toggleStatus: (_) {
                          // normalde _ 'alt ??izgi' yernde 'bool' yazar ama ba??ka yerde kullanmayaca????m??z i??in '_' kullanabiliriz
                          itemData
                              .toggleStatus(
                                  index); // 'listen: false' diyerek de provider'??n dinleme ??zelli??ini kapatmam??z gerekiyor, hem bir ??eyleri dinletmek hem de fonksiyonu kullanarak data yollayamay??z
                        },
                        //   deleteItem: (_) {  // E??er silme i??lemini 'Dismissible' ile yapacaksak '(_)' parantez i??inde al tire kullanmak gerekli ancak 'GestureDetector' kuulanacaksak parantez i??i bo?? olmal??!
                        deleteItem: () {
                          // normalde _ 'alt ??izgi' yernde 'bool' yazar ama ba??ka yerde kullanmayaca????m??z i??in '_' kullanabiliriz
                          itemData.deleteItem(
                              index); // 'listen: false' diyerek de provider'??n dinleme ??zelli??ini kapatmam??z gerekiyor, hem bir ??eyleri dinletmek hem de fonksiyonu kullanarak data yollayamay??z
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Colors.green.shade50,
          // barrierColor: Colors.black, // 'showModalBottomSheet' a????l??nca arkada kalan alan?? renklendirir!
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          context: context,
          builder: (context) => ItemAdder(),
        );
      },
      child: Icon(Icons.add),
    );
  }

}

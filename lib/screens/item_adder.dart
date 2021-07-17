import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/items_data.dart';

class ItemAdder extends StatelessWidget {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // Bu padding ile 'BottomSheet' açıldığında klavyenin altta kalmasına görülmeme hatalarına engel olmuş olduk!
        // padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: TextField(
                  minLines: 1,
                  maxLines: 3,
                  controller: textController,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Add Item',
                    hintText: '...',
                  ),
                  autofocus: true,
                  onChanged: (input) {
                    print(textController.text);
                  },
                ),
              ),
              FlatButton(
                color: Theme.of(context).accentColor,
                child: Text('ADD'),
                onPressed: () {
                  // Bu provider ile dinleme yapmıyoruz bir fonksiyon çalıştırıyoruz!
                  Provider.of<ItemData>(context, listen: false)
                      .addItem(textController.text);
                  // Bu context'deki sayfayı(yeni görev eklenilen açılır kapanır sayfa) kapat!
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

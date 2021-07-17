import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function toggleStatus;
  final Function deleteItem;

  ItemCard({this.title, this.isDone, this.toggleStatus, this.deleteItem});

  @override
  Widget build(BuildContext context) {
   // return Dismissible(  // alternatif olarak 'GestureDedector' da kullanılabilir!
    return GestureDetector(
      onDoubleTap: deleteItem,
      // onDismissed: deleteItem,   // 'Dismissible' ile kullanılmak durumunda
      key: Key(title), // Dismissible bizden string bir değer alması gereken 'key' istemkte, çünkü silme işlemini yaparken hangi öğeyi sileceğini key olmadan anlayamıyor!
      child: Card(
        color: isDone ? Colors.green.shade50 : Colors.white,
        elevation: isDone ? 1 : 5,
        shadowColor: Theme.of(context).primaryColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: isDone ? Colors.green.shade900 : Colors.black,
              decoration: isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Checkbox(
            onChanged: toggleStatus,
            value: isDone,
            activeColor: Colors.green,
          ),
        ),
      ),
    );
  }
}

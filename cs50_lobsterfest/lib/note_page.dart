import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:something_first/box.dart';
import 'package:something_first/globals.dart';

class ListWihParts extends StatefulWidget {
  @override
  State<ListWihParts> createState() => _ListWihPartsState();
}

class _ListWihPartsState extends State<ListWihParts> {
  void updateMyTiles(int oldIndex, int newIndex) {
    Provider.of<ArrayProvider>(context, listen: false)
        .reorderItems(oldIndex, newIndex);
  }

  void remove_index(int index) {
    setState(() {
      Provider.of<ArrayProvider>(context, listen: false)
          .myArray
          .removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Consumer<ArrayProvider>(
          builder: (context, arrayProvider, child) {
            return ReorderableListView.builder(
              itemCount: arrayProvider.myArray.length,
              itemBuilder: (context, index) {
                return ListTile(
                  // make this code work when size of the screen is bigger then 850
                  trailing: currentWidth > 850
                      ? ReorderableDragStartListener(
                          index: index,
                          child: const Icon(
                            Icons.drag_indicator_outlined,
                            color: Colors.white,
                          ))
                      : null,
                  key: ValueKey('${arrayProvider.myArray[index]}_$index'),
                  title: ClipRect(
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion: DrawerMotion(),
                        extentRatio: 1,
                        children: [
                          SlidableAction(
                            onPressed: (context) {},
                            backgroundColor: Color(0xff38544d),
                            foregroundColor: Colors.white,
                            label: "additional text here",
                            borderRadius: BorderRadius.circular(14),
                          )
                        ],
                      ),
                      startActionPane: ActionPane(
                        motion: DrawerMotion(),
                        children: [
                          SlidableAction(
                            borderRadius: BorderRadius.circular(12),
                            onPressed: (context) => remove_index(index),
                            icon: Icons.delete,
                            label: 'Delete',
                            backgroundColor: Colors.red.shade400,
                          )
                        ],
                      ),
                      child: SlidableContainer(
                        child: arrayProvider.myArray[index],
                      ),
                    ),
                  ),
                );
              },
              onReorder: (oldIndex, newIndex) =>
                  updateMyTiles(oldIndex, newIndex),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dropdown.model.dart';

class PCMDropdownButton<T> extends StatelessWidget {
  final List<T> items;

  Rx<T>? selectedItem;
  int selectedItemIndex = 0;
  final void Function(T value, int position)? onChanged;
  final DropdownAttributes? attributes;
  final DropdownMenuItem<T> Function(T item) onDraw;

  PCMDropdownButton(
      {Key? key,
      required this.items,
      this.selectedItem,
      this.onChanged,
      this.attributes,
      required this.onDraw})
      : super(key: key) {}

  List<DropdownMenuItem<T>> get dropdownItems {
    var menuItems = <DropdownMenuItem<T>>[];
    for (var element in items) {
      menuItems.add(
        onDraw(element),
      );
    }
    return menuItems;
  }

  List<DropdownMenuItem<T>> get dropdownItems2 {
    var menuItems = <DropdownMenuItem<T>>[];
    for (var element in items) {
      menuItems.add(
        onDraw(element),
      );
    }
    return menuItems;
  }

  int getSelectedItemIndex() {
    var index = items.indexOf(selectedItem!.value);
    return index >= 0 ? index : 0;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
          alignedDropdown: true,
          child: Obx(() => DropdownButton<T>(
                value: selectedItem!.value,
                items: dropdownItems,
                onChanged: (selectedItem) {
                  this.selectedItem!.value = selectedItem!;
                  selectedItemIndex = getSelectedItemIndex();
                  if (onChanged != null) {
                    onChanged!(items[selectedItemIndex], selectedItemIndex);
                  }
                },
              ))),
    );
  }
}

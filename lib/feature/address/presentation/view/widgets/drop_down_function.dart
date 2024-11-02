import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

DropDownState dropDown({
  required String title,
  required List<SelectedListItem> data,
  required Function(SelectedListItem) onSelected,
}) {
  return DropDownState(
    DropDown(
      bottomSheetTitle: Directionality(
        textDirection: TextDirection.rtl,
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
      data: data,
      onSelected: (List<dynamic> selectedList) {
        if (selectedList.isNotEmpty) {
          onSelected(selectedList[0] as SelectedListItem);
        }
      },
      enableMultipleSelection: false,
    ),
  );
}

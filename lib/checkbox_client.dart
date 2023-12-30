import 'package:flutter/material.dart';

class DataTableFunctions {
  static void toggleSelectAll({
    required List<bool> selectedRows,
    required bool selectAll,
    required Function(bool,List<bool>) onSelectAll,
  }) {
    selectAll = !selectAll;
    for (int i = 0; i < selectedRows.length; i++) {
      selectedRows[i] = selectAll;
    }
    onSelectAll(selectAll,selectedRows);
  }

  static void deleteRow({
    required List<bool> selectedRows,
    required int rowIndex,
    required Function(int) onDelete,
  }) {
    selectedRows.removeAt(rowIndex);
    onDelete(rowIndex);
  }

  static void editRow({
    required int rowIndex,
    required Function(int) onEdit,
  }) {
    onEdit(rowIndex);
  }
}

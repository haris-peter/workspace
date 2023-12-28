import 'package:flutter/material.dart';
import 'header_cell.dart';
import 'data_row_cell.dart';
import 'action_button_cell.dart';
import 'sized_box_cell.dart';
import 'checkbox_client.dart';

const double containerHeight = 50;

class DataTableRow extends StatefulWidget {
  final List<HeaderCell> headers;
  final List<List<String>> dataRows;
  final List<bool> selectedRows;
  final bool selectAll;
  final bool checkbox;
  final bool actionbutton;
  final Function(bool) toggleSelectAll;
  final Function(int) onEdit;
  final Function(int) onDelete;

  const DataTableRow({
    Key? key,
    required this.headers,
    required this.dataRows,
    required this.selectedRows,
    required this.selectAll,
    required this.toggleSelectAll,
    required this.onEdit,
    required this.onDelete,
    required this.checkbox,
    required this.actionbutton,
  }) : super(key: key);

  @override
  State<DataTableRow> createState() => _DataTableRowState();
}

class _DataTableRowState extends State<DataTableRow> {
  List<bool> selectedRows = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: containerHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 245, 246, 250),
          ),
          child: Row(
            children: [
              const SizedBoxCell(width: 10),
              if (widget.checkbox) ...[
                CheckboxCell(
                  selected: widget.selectAll,
                  onSelect: widget.toggleSelectAll,
                  selectall: true,
                  index: 0,
                  onCheckboxChanged: (value) {
                    selected: true;
                  },
                ),
                const SizedBoxCell(width: 30),
              ], // Placeholder for the image column
              ...widget.headers
                  .map((header) =>
                  HeaderCell(title: header.title, width: header.width))
                  .toList(),
              if (widget.actionbutton) ...[
                const SizedBoxCell(width: 10),
                ActionButtonCell(onEdit: () {}, onDelete: () {}),
              ],
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Container(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: widget.dataRows.length,
              itemBuilder: (context, rowIndex) {
                final List<String> rowData = widget.dataRows[rowIndex];
                final bool selected = selectedRows[rowIndex];
                return Container(
                  height: containerHeight,
                  decoration: BoxDecoration(
                    color: selected
                        ? const Color.fromARGB(255, 170, 149, 255)
                        : const Color.fromARGB(255, 241, 238, 253),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const SizedBoxCell(width: 10),
                      if (widget.checkbox) ...[
                        CheckboxCell(
                          selected: selected,
                          onSelect: (value) {},
                          selectall: false,
                          index: rowIndex,
                          onCheckboxChanged: (value) {},
                        ),
                        const SizedBoxCell(width: 30),
                      ], // Placeholder for the image column
                      ...rowData.asMap().entries.map((entry) {
                        final int cellIndex = entry.key;
                        final String cellData = entry.value;
                        final double cellWidth = widget.headers[cellIndex].width;
                        return DataRowCell(data: cellData, width: cellWidth);
                      }).toList(),
                      if (widget.actionbutton) ...[
                        const SizedBoxCell(
                            width: 10), // Placeholder for the action column
                        ActionButtonCell(onEdit: () {}, onDelete: () {}),
                      ],
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

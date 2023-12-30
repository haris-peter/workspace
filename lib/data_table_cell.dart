import 'package:flutter/material.dart';
import 'header_cell.dart';

class DataTableRow extends StatefulWidget {
  final List<HeaderCell> headers;
  final List<List<HeaderCell>> dataRows;

  const DataTableRow({
    Key? key,
    required this.headers,
    required this.dataRows,
  }) : super(key: key);

  @override
  State<DataTableRow> createState() => _DataTableRowState();
}

class _DataTableRowState extends State<DataTableRow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 245, 246, 250),
          ),
          child: Row(children: [for (final i in widget.headers) i]),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
              itemCount: widget.dataRows.length,
              itemBuilder: (context, index) => _DataRow(rowData: widget.dataRows[index])),
        ),
      ],
    );
  }
}

class _DataRow extends StatelessWidget {
  final List<HeaderCell> rowData;
  const _DataRow({required this.rowData});

  @override
  Widget build(BuildContext context) {
    return Row(children: [for (final i in rowData) i]);
  }
}

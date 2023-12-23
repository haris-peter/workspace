import 'package:flutter/material.dart';

class CheckboxCell extends StatefulWidget {
  final bool selected;
  final Function(bool) onSelect;
  final bool selectall;
  final int index;
  final Function(bool) onCheckboxChanged;

  const CheckboxCell({
    Key? key,
    required this.selected,
    required this.onSelect, 
    required this.selectall, 
    required this.index, 
    required this.onCheckboxChanged,
  }) : super(key: key);

  @override
  State<CheckboxCell> createState() => _CheckboxCellState();
}

class _CheckboxCellState extends State<CheckboxCell> {
  List<bool> selectedRows = List.generate(10, (index) => false);
  bool selectAll=false;
  @override
  Widget build(BuildContext context) {
    
    return Checkbox(
      value: widget.selectall ? selectAll : selectedRows[widget.index],
      onChanged: (value){
        if(widget.selectall){
          setState(() {
            selectAll=!selectAll;
            for (int  i=0;i<selectedRows.length;i++){
              selectedRows[i]=selectAll;
            }
          });
          widget.onCheckboxChanged(value!);
        }
        else{
          setState(() {
            selectedRows[widget.index]=value!;
          },);
        }
      },
    );
  }
}



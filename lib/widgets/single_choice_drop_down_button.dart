import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SingleChoiceDropdownButton extends StatefulWidget {
  final List<String> options;
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;

  const SingleChoiceDropdownButton({
    Key? key,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _SingleChoiceDropdownButtonState createState() => _SingleChoiceDropdownButtonState();
}

class _SingleChoiceDropdownButtonState extends State<SingleChoiceDropdownButton> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  onChanged (value) {
    setState(() {
    _selectedValue = value as String;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: const [
            Expanded(
              child: Text(
                'Select Item',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: widget.options
            .map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        )).toList(),
        value: _selectedValue,
        onChanged: (value) {
          setState(() {
            _selectedValue = value as String;
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 30,
          width: 120,
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black26,
            ),
            color: Colors.white,
          ),
          elevation: 1,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
          ),
          iconSize: 14,
          iconEnabledColor: Colors.black,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 200,
          padding: null,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          elevation: 8,
          offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const styleActive = TextStyle(color: Color(0xff7E7E7E), fontSize: 20);
    const styleHint = TextStyle(color: Color(0xff7E7E7E), fontSize: 20);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: 56,
      margin: const EdgeInsets.fromLTRB(16, 56, 16, 16),
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        border: Border.all(color: Colors.white70),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.search,
            color: Color(0xff7E7E7E),
            size: 28,
          ),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: const Icon(Icons.close, color: Colors.grey),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}

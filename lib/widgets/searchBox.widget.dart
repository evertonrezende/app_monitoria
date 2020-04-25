import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  final String label;
  final Function _cancelAction;
  final Function(String) _editAction;

  SearchBox(this._cancelAction, this._editAction, this.label);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _searchBox();
  }

  _searchBox() {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child:
         TextField(
            controller: _controller,
            onChanged: (value) {
              widget._editAction(value);
            },
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]),
                ),
                hintText: widget.label,
                hintStyle: TextStyle(color: Colors.grey),
                suffixIcon: IconButton(
                  focusColor: Colors.red,
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) => _controller.clear());
                    widget._cancelAction();
                  },
                )
            )
        )
      );
  }
}

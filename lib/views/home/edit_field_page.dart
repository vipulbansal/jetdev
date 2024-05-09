import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vipul_jet_assignment/blocs/auth/auth_event.dart';

import '../../blocs/auth/auth_bloc.dart';


class EditFieldPage extends StatefulWidget {
  final String fieldName;
  final String initialValue;

  const EditFieldPage({
    Key? key,
    required this.fieldName,
    required this.initialValue,
  }) : super(key: key);

  @override
  _EditFieldPageState createState() => _EditFieldPageState();
}

class _EditFieldPageState extends State<EditFieldPage> {
  late TextEditingController _controller;
  bool _hasUnsavedChanges = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _controller.addListener(() {
      setState(() {
        _hasUnsavedChanges = _controller.text != widget.initialValue;
      });
    });
  }

  Future<bool> _confirmDiscardChanges() async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Discard Changes?'),
        content: Text('You have unsaved changes. Do you want to leave without saving?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
        ],
      ),
    ) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !_hasUnsavedChanges || await _confirmDiscardChanges();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Edit ${widget.fieldName}'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () async {
              if (!_hasUnsavedChanges || await _confirmDiscardChanges()) {
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'New ${widget.fieldName}'),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(UpdateProfileFieldEvent (widget.fieldName, _controller.text));
                  Navigator.of(context).pop();
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

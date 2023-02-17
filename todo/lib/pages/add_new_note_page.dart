import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/notes_model.dart';
import 'package:todo/providers/notes_provider.dart';
import 'package:uuid/uuid.dart';

class AddNewNotePage extends StatefulWidget {
  const AddNewNotePage({super.key, required this.isUpdate, this.note});
  final bool isUpdate;
  final NotesModel? note;
  @override
  State<AddNewNotePage> createState() => _AddNewNotePageState();
}

class _AddNewNotePageState extends State<AddNewNotePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isUpdate == true) {
      titleController.text = widget.note!.title!;
      contentController.text = widget.note!.content!;
    }
  }

  // Focus node is used to focus the field which on interaction is submited or changed
  FocusNode noteFocus = FocusNode();
  void addNote() {
    NotesModel newNote = NotesModel(
      id: Uuid().v1(),
      userid: "SushilKumar",
      title: titleController.text,
      content: contentController.text,
      dateadded: DateTime.now(),
    );
    Provider.of<NotesProvider>(context, listen: false).addNote(newNote);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                if (widget.isUpdate) {
                  widget.note!.title = titleController.text;
                  widget.note!.content = contentController.text;
                  widget.note!.dateadded = DateTime.now();
                  Provider.of<NotesProvider>(context, listen: false)
                      .updateNote(widget.note!);
                  Navigator.pop(context);
                } else {
                  addNote();
                }
              },
              icon: const Icon(Icons.check))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          TextField(
            controller: titleController,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            onSubmitted: (value) {
              if (value != "") {
                noteFocus.requestFocus();
              }
            },
            autofocus: (widget.isUpdate == true) ? false : true,
            decoration: const InputDecoration(
              hintText: "Title",
            ),
          ),
          Expanded(
            child: TextField(
              controller: contentController,
              focusNode: noteFocus,
              maxLines: null,
              decoration: const InputDecoration(
                  hintText: "Note",
                  hintStyle: TextStyle(fontSize: 20),
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
        ],
      )),
    );
  }
}

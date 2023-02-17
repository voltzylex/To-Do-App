import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/notes_model.dart';
import 'package:todo/pages/add_new_note_page.dart';
import 'package:todo/providers/notes_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NotesProvider notesProvider = Provider.of<NotesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Note app"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: (notesProvider.notes.length > 0)
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: notesProvider.notes.length,
                  itemBuilder: (context, index) {
                    NotesModel contentData = notesProvider.notes[index];
                    return GestureDetector(
                      onTap: () {
                        // update
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => AddNewNotePage(
                                isUpdate: true,
                                note: contentData,
                              ),
                            ));
                      },
                      onLongPress: () {
                        notesProvider.deleteNote(contentData);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              contentData.title!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              contentData.content!,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text("Create New Notes"),
                )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (context) => AddNewNotePage(
                isUpdate: false,
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

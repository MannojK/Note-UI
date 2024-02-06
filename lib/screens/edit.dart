import 'package:flutter/material.dart';

import '../models/note.dart';

class EditScreen extends StatefulWidget {
  final Note? note;
  const EditScreen({super.key,this.note});



  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _title = TextEditingController();
  TextEditingController _content = TextEditingController();

    @override
  void initState(){
    super.initState();
    if(widget.note != null)
    _title = TextEditingController(text: widget.note!.title);
    _content = TextEditingController(text: widget.note!.content);
  
  }
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 1.4 * kToolbarHeight, 10, 4),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios_new),
                color: Colors.white,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade600.withOpacity(.9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.sort),
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Expanded(
              child: ListView(
            children: [
               TextField(
                controller: _title,
                style: TextStyle(color: Colors.white, fontSize: 30),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 30),
                ),
              ),
               TextField(
                controller: _content,
                style: TextStyle(color: Colors.white, fontSize: 20),
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type something here ',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 30),
                ),
              ),
            ],
          ))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        onPressed: () {
       Navigator.pop(context,[
        _title.text,_content.text,
       ]);
        },
        child: Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
    );
  }
}

import 'package:exam24/screen/todopage/provider/todoprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/todomodel.dart';

class todoscreen extends StatefulWidget {
  const todoscreen({Key? key}) : super(key: key);

  @override
  State<todoscreen> createState() => _todoscreenState();
}

class _todoscreenState extends State<todoscreen> {
  TextEditingController txttask = TextEditingController();
  TextEditingController txtcat = TextEditingController();

  TextEditingController xtxttask = TextEditingController();
  TextEditingController xtxtcat = TextEditingController();
  todoprovider? tpro;
  todoprovider? fpro;
  @override
  Widget build(BuildContext context) {
    tpro = Provider.of<todoprovider>(context, listen: true);
    fpro = Provider.of<todoprovider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyanAccent,
          actions: [],
        ),
        body:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("To Do",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ListView.builder(
                shrinkWrap: true,
                itemCount: fpro!.l1.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child:
                      ListTile(
                        leading: Text("${fpro!.l1[index].task}"),
                        title: Text("${fpro!.l1[index].catagory}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                fpro!.delete(index);
                              },
                              icon: Icon(Icons.delete,color: Colors.red),
                            ),
                            IconButton(
                                onPressed: () {
                                  xtxttask = TextEditingController(
                                      text: fpro!.l1[index].task);
                                  xtxtcat = TextEditingController(
                                      text: fpro!.l1[index].catagory);
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white,
                                                        width: 1.5))),
                                            controller: xtxttask,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextField(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white,
                                                        width: 1.5))),
                                            controller: xtxtcat,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          ElevatedButton(onPressed: () {
                                            Homemodel m1 = Homemodel(task: xtxttask.text,catagory: xtxtcat.text);
                                            fpro!.editData(index,m1);
                                            Navigator.pop(context);
                                          }, child: Text("update"))
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.edit)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: txttask,
                      decoration: InputDecoration(hintText: "enter your task"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: txtcat,
                      decoration: InputDecoration(hintText: "enter your catagory"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Homemodel h1 = Homemodel(
                            task: txttask.text,
                            catagory: txtcat.text,
                          );
                          fpro!.add(h1);
                          Navigator.pop(context);
                        },
                        child: Text("ADD"))
                  ],
                ),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }



}

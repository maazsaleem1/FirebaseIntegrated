import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToDoAppScreen extends StatefulWidget {
  const ToDoAppScreen({super.key});

  @override
  State<ToDoAppScreen> createState() => _ToDoAppScreenState();
}

class _ToDoAppScreenState extends State<ToDoAppScreen> {
  TextEditingController textcontroller = TextEditingController();
  List<String> names = ["asad", "jacob", "inres"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ToDoAPP'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: textcontroller,
                decoration: InputDecoration(
                  hintText: "Enter any thing",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black)),
                  suffixIcon: const Icon(
                    Icons.add_circle,
                    size: 25,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(
                      25,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    )
                  ]),
              child: Column(
                children: [
                  ListView.builder(
                      itemCount: names.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 60,
                          width: 1.sw,
                          color: Colors.blue,
                        );
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

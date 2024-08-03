import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/Controller/controller.dart';
import 'package:note_app/Custom%20Widget/custom_text.dart';
import 'package:note_app/Custom%20Widget/custom_textfeild.dart';
import 'package:note_app/Model/model.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final noteController = Get.put(NoteController());
    final arg = Get.arguments != null
        ? Get.arguments as Map
        : {'isUpdate': false, 'note': null};
    final bool isUpdate = arg['isUpdate'] ?? false;
    final noteList = arg['note'] == null ? null : arg['note'] as Model;
    final int? index = arg['index'] == null ? null : arg['index'] as int;

    final textTittle = TextEditingController(
      text: isUpdate ? noteList!.tittle : null,
    );
    final textDescription =
        TextEditingController(text: isUpdate ? noteList!.description : null);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Theme.of(context).colorScheme.surface,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              CustomTextfeild(
                textEditingController: textTittle,
                tittle: 'Tittle',
                fontWeight: FontWeight.bold,
                textsize: 20,
                maxLine: 3,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: CustomTextfeild(
                    textEditingController: textDescription,
                    tittle: 'Description',
                    fontWeight: FontWeight.normal,
                    textsize: 18,
                    hinttextsize: 18,
                    hintfontWeight: FontWeight.normal,
                    maxLine: 1000,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              if (textTittle.text.isEmpty || textDescription.text.isEmpty) {
                Get.snackbar('Error', 'Fill up the tittle and description',
                    animationDuration: const Duration(seconds: 1));
              } else {
                isUpdate
                    ? noteController.updateNote(
                        index!,
                        Model(
                            tittle: textTittle.text,
                            description: textDescription.text,
                            date: noteList!.date))
                    : noteController.addNote(Model(
                        tittle: textTittle.text,
                        description: textDescription.text,
                        date: DateTime.now()));
                Get.back();
              }
            },
            label: const CustomText(
                tittle: 'Save',
                size: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    );
  }
}

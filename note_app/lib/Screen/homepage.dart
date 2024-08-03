import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/Controller/controller.dart';
import 'package:note_app/Custom%20Widget/custom_container.dart';
import 'package:note_app/Custom%20Widget/custom_text.dart';
import 'package:note_app/Screen/note_screen.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NoteController());
    final Color onsurface = Theme.of(context).colorScheme.onSurface;
    final Color surface = Theme.of(context).colorScheme.surface;
    final Color primary = Theme.of(context).colorScheme.primary;
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: surface,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CustomText(
                    tittle: 'My Note',
                    size: 25,
                    fontWeight: FontWeight.w700,
                    color: onsurface),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.menu_rounded)),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search_rounded)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert_rounded)),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      tittle: 'Today',
                      size: 20,
                      fontWeight: FontWeight.bold,
                      color: onsurface),
                  CustomText(
                      tittle: 'view all',
                      size: 18,
                      fontWeight: FontWeight.w600,
                      color: primary),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Expanded(
                child:  Obx(() => SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      controller.notes.isEmpty
                          ? Center(
                        child: CustomText(
                            tittle: 'No Notes',
                            size: 20,
                            fontWeight: FontWeight.w600,
                            color:
                            Theme.of(context).colorScheme.onSurface),
                      )
                          : ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        reverse: true,
                        itemCount: controller.notes.length,
                        itemBuilder: (context, index) {

                       //   final note = controller.notes[index];

                          return  CustomContainer(
                            index: index,





                          );
                        },
                      ),
                    ],
                  ),
                ),)
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primary,
          tooltip: 'Add Note',
          onPressed: () {
            Get.to(const NoteScreen());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

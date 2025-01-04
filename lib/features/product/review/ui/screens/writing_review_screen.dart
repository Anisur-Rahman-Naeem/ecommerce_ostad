import 'package:flutter/material.dart';

class WritingReviewScreen extends StatefulWidget {
  const WritingReviewScreen({super.key});


  static const String name = "product/writing_review";

  @override
  State<WritingReviewScreen> createState() => _WritingReviewScreenState();
}


class _WritingReviewScreenState extends State<WritingReviewScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _writingReviewController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Review"),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios),),
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
            children: [
              const SizedBox(height: 24,),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _firstNameTEController,
                decoration: const InputDecoration(
                  hintText: 'First Name',
                ),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter valid first name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14,),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _lastNameTEController,
                decoration: const InputDecoration(
                  hintText: 'Last Name',
                ),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter valid last name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14,),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _writingReviewController,
                maxLines: 10,
                decoration: const InputDecoration(
                  hintText: 'Write Review',
                ),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter valid last name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20,),

              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {}
                },
                child: const Text("Submit"),
              ),

            ],
                  ),
          ),
        ),),
    );
  }
}

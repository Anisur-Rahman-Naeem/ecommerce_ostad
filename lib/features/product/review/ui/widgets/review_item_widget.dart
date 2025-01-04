import 'package:flutter/material.dart';

class ReviewItemWidget extends StatelessWidget {
  const ReviewItemWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.black45,
                      size: 18,
                    ),
                    backgroundColor: Colors.grey.shade300,
                    radius: 15,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    "Rabbil Hasan",
                    style: textTheme.titleSmall
                        ?.copyWith(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.",
                  style: TextStyle(color: Colors.grey))
            ],
          ),
        ),
      ),
    );
  }
}

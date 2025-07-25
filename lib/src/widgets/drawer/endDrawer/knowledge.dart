import 'package:flutter/material.dart';

import '../../../constants/size.dart';

class KnowledgeText extends StatelessWidget {
  const KnowledgeText({super.key, required this.knowledge});
  final String knowledge;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Row(
        children: [
          const SizedBox(width: defaultPadding/2,),
          Text('* $knowledge'),
        ],
      ),
    );
  }
}


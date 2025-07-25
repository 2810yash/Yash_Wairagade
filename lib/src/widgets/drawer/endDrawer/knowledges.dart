import 'package:flutter/material.dart';
import '../../../constants/knowledge.dart';
import 'knowledge.dart';

class Knowledges extends StatelessWidget {
  const Knowledges({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text('Knowledge',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
        ),
        for(int i=0;i<knowledgeItems.length;i++)
          KnowledgeText(knowledge: knowledgeItems[i]),
      ],
    );
  }

}

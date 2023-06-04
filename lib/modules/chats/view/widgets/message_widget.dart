import 'package:flutter/material.dart';

import '../../domain/models/chat_message.dart';

class MessageWidget extends StatelessWidget {
  final ChatMessage message;
  final bool isCurrentMember;
  const MessageWidget({
    Key? key,
    required this.message,
    required this.isCurrentMember,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment:
            isCurrentMember ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isCurrentMember)
            CircleAvatar(
              child: Text(message.sender.fullname.characters.first),
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isCurrentMember) Text(message.sender.firstName),
                if (!isCurrentMember) const SizedBox(height: 10),
                LayoutBuilder(builder: (context, constraints) {
                  return Container(
                    padding: const EdgeInsets.all(15),
                    constraints: BoxConstraints(
                      maxWidth: constraints.maxWidth * 0.8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade200,
                    ),
                    child: Text(
                      message.message,
                    ),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_rhp/components/customAppBar.dart';
import 'package:intl/intl.dart';

class Message {
  final bool sender;
  final String content;
  final DateTime timestamp;

  const Message({
    required this.sender,
    required this.content,
    required this.timestamp,
  });
}

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  late final DateTime now;
  late final String formattedTime;
  late final List<Message> _messages;

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    formattedTime = DateFormat.Hm().format(now);
    _messages = [
      Message(sender: true, content: "Bonjour", timestamp: now),
      Message(sender: false, content: "oui,Bonjour", timestamp: now)
    ];
  }

  void _handleSend(String message) {
    setState(() {
      _messages.add(Message(sender: true, content: message, timestamp: now));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(title: "Discussion", goBack: true),
      ),
      backgroundColor: Color(0xFFe3ecf1),
      body: Column(
        children: [
          Expanded(
            child: MessageList(messages: _messages),
          ),
          ChatBar(onSend: _handleSend),
        ],
      ),
    );
  }
}

class ChatBar extends StatefulWidget {
  final Function(String) onSend;

  ChatBar({Key? key, required this.onSend}) : super(key: key);

  @override
  State<ChatBar> createState() => _ChatBarState();
}

class _ChatBarState extends State<ChatBar> {
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                  hintText: 'veuillez saisir votre message...'),
              onSubmitted: (text) {
                widget.onSend(text);
                _messageController.clear();
              },
            ),
          ),
          IconButton(
            onPressed: () {
              final message = _messageController.text;
              if (message.isNotEmpty) {
                widget.onSend(message);
                _messageController.clear();
              }
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}

class MessageList extends StatefulWidget {
  final List<Message> messages;

  const MessageList({Key? key, required this.messages}) : super(key: key);

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  bool is_sender = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.messages.length,
      itemBuilder: (context, index) {
        final message = widget.messages[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: message.sender == true
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: message.sender == true
                        ? Theme.of(context).colorScheme.primary.withOpacity(0.7)
                        : Colors.grey.shade400),
                child: Text(
                  message.content,
                  style: TextStyle(
                      color:
                          message.sender == true ? Colors.white : Colors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class MessageBoardsScreen extends StatelessWidget {
  final List<Map<String, String>> messageBoards = [
    {
      'name': 'Games',
      'icon': 'assets/icons/joystick.png',
    },
    {
      'name': 'Business',
      'icon': 'assets/icons/business.png',
    },
    {
      'name': 'Public Health',
      'icon': 'assets/icons/public_health.png',
    },
    {
      'name': 'Study',
      'icon': 'assets/icons/study.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message Boards'),
      ),
      body: ListView.builder(
        itemCount: messageBoards.length,
        itemBuilder: (context, index) {
          final board = messageBoards[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/chat',
                  arguments: board['name'],
                );
              },
              child: Container(
                height: 100, 
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        board['icon']!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          board['name']!,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

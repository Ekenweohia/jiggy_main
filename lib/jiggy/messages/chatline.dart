
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search, color: Colors.pink),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Message',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.grid_view, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.search, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'All',
                    style: TextStyle(color: Colors.pink, fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Request',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Random',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
            const Divider(color: Colors.white24, thickness: 1),
            Expanded(
              child: ListView(
                children: const [
                  MessageItem(
                    avatar: 'assets/images/avatar1.png',
                    name: 'Anonymous m.',
                    message: 'Hi there!',
                    time: '9.56 AM',
                    unreadCount: 2,
                  ),
                  MessageItem(
                    avatar: 'assets/images/avatar2.png',
                    name: 'Anonymous message..',
                    message: 'Hi there!',
                    time: '9.56 AM',
                    unreadCount: 2,
                  ),
                  MessageItem(
                    avatar: 'assets/images/avatar3.png',
                    name: 'Anonymous message..',
                    message: 'Hi there!',
                    time: '9.56 AM',
                    unreadCount: 0,
                  ),
                  MessageItem(
                    avatar: 'assets/images/avatar4.png',
                    name: 'Anonymous message..',
                    message: 'Hi there!',
                    time: '9.56 AM',
                    unreadCount: 0,
                  ),
                  MessageItem(
                    avatar: 'assets/images/avatar5.png',
                    name: 'Anonymous message..',
                    message: 'Hi there!',
                    time: '9.56 AM',
                    unreadCount: 0,
                  ),
                  MessageItem(
                    avatar: 'assets/images/avatar6.png',
                    name: 'Anonymous message..',
                    message: 'Hi there!',
                    time: '9.56 AM',
                    unreadCount: 0,
                  ),
                  MessageItem(
                    avatar: 'assets/images/avatar7.png',
                    name: 'Anonymous message..',
                    message: 'Hi there!',
                    time: '9.56 AM',
                    unreadCount: 0,
                  ),
                  MessageItem(
                    avatar: 'assets/images/avatar8.png',
                    name: 'Anonymous message..',
                    message: 'Hi there!',
                    time: '9.56 AM',
                    unreadCount: 0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  final String avatar;
  final String name;
  final String message;
  final String time;
  final int unreadCount;

  const MessageItem({
    super.key,
    required this.avatar,
    required this.name,
    required this.message,
    required this.time,
    this.unreadCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(avatar),
            radius: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              if (unreadCount > 0)
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Text(
                    '$unreadCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: MessageScreen(),
  ));
}

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
      _tabController.animateTo(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            _buildTabButton(context, 'All', 0),
            _buildTabButton(context, 'IMSU', 1),
            _buildTabButton(context, 'Discover', 2),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildPostList(context),
          buildIMSUContent(context),
          buildDiscoverContent(context),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.pink,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/Frame 481949.png',
              width: 24,
              height: 24,
            ),
            label: 'Custom',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(BuildContext context, String label, int index) {
    return GestureDetector(
      onTap: () => _onTabSelected(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          border: _selectedTabIndex == index
              ? const Border(
                  bottom: BorderSide(color: Colors.red, width: 3.0),
                )
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: _selectedTabIndex == index ? Colors.red : Colors.white,
            fontSize: 16,
            fontWeight: _selectedTabIndex == index
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget buildPostList(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, index) {
        return buildPostItem(
          context,
          avatar: 'assets/images/avatar.png',
          username: 'Anonymous',
          timeAgo: '12h ago',
          location: 'IMSU',
          text: index % 2 == 0
              ? 'Have a great day with my amazing client all the way from NewYork'
              : 'I was so horny',
          likes: 803,
          comments: 4682,
          shares: 20,
          boosted: index % 2 == 1,
          postType: index % 3 == 0
              ? PostType.text
              : index % 3 == 1
                  ? PostType.boosted
                  : PostType.poll,
          images: index % 3 == 2
              ? ['assets/images/event1.png', 'assets/images/event2.png']
              : null,
        );
      },
    );
  }

  Widget buildIMSUContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('IMSU', style: TextStyle(color: Colors.white)),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Button 1'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Button 2'),
          ),
        ],
      ),
    );
  }

  Widget buildDiscoverContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Discover', style: TextStyle(color: Colors.white)),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Button 1'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Button 2'),
          ),
        ],
      ),
    );
  }

  Widget buildPostItem(
    BuildContext context, {
    required String avatar,
    required String username,
    required String timeAgo,
    required String location,
    String? text,
    List<String>? images,
    required int likes,
    required int comments,
    required int shares,
    bool boosted = false,
    required PostType postType,
  }) {
    return Card(
      color: Colors.black,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(avatar),
              ),
              title:
                  Text(username, style: const TextStyle(color: Colors.white)),
              subtitle: Text('$timeAgo . $location',
                  style: const TextStyle(color: Colors.white)),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.white),
                onPressed: () {},
              ),
            ),
            if (text != null && postType != PostType.boosted) ...[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(text, style: const TextStyle(color: Colors.white)),
              ),
            ],
            if (postType == PostType.boosted) ...[
              Container(
                color: Colors.pinkAccent,
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: Text(text ?? '',
                    style: const TextStyle(color: Colors.white)),
              ),
            ],
            if (images != null && images.isNotEmpty) ...[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: postType == PostType.poll
                    ? Row(
                        children: images.map((image) {
                          return Expanded(
                            child: Image.asset(image, fit: BoxFit.cover),
                          );
                        }).toList(),
                      )
                    : Image.asset(images[0], fit: BoxFit.cover),
              ),
            ],
            if (postType == PostType.poll) ...[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    Text('40%', style: TextStyle(color: Colors.white)),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: 0.4,
                        backgroundColor: Colors.grey,
                        color: Colors.red,
                      ),
                    ),
                    Text('60%', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('20 votes', style: TextStyle(color: Colors.white)),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child:
                    Text('Comment: 20', style: TextStyle(color: Colors.white)),
              ),
            ],
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.thumb_up, color: Colors.red),
                      const SizedBox(width: 4.0),
                      Text('$likes',
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.comment, color: Colors.white),
                      const SizedBox(width: 4.0),
                      Text('$comments',
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.share, color: Colors.white),
                      const SizedBox(width: 4.0),
                      Text('$shares',
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
            if (boosted) ...[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Anonymous Boosted this post',
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

enum PostType {
  text,
  boosted,
  poll,
  image,
}

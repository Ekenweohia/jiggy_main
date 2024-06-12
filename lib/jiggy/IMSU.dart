import 'package:flutter/material.dart';

class IMSU extends StatefulWidget {
  const IMSU({super.key});

  @override
  IMSUState createState() => IMSUState();
}

class IMSUState extends State<IMSU> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            const Expanded(
              child: Text(
                'Anonymous',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.red,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'IMSU'),
            Tab(text: 'Discover'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildPostList(context),
          const Center(
              child: Text('IMSU', style: TextStyle(color: Colors.white))),
          const Center(
              child: Text('Discover', style: TextStyle(color: Colors.white))),
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
          const BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/Frame 481949.png',
              width: 24,
              height: 24,
            ),
            label: 'Custom',
          ),
        ],
      ),
    );
  }

  Widget buildPostList(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        buildPostItem(
          context,
          avatar: 'assets/images/avatar.png',
          username: 'Anonymous',
          timeAgo: '12h ago',
          location: 'IMSU',
          text:
              'Have a great day with my amazing client all the way from NewYork',
          likes: 803,
          comments: 4682,
          shares: 20,
          boosted: false,
          postType: PostType.text,
        ),
        buildPostItem(
          context,
          avatar: 'assets/images/avatar.png',
          username: 'Anonymous',
          timeAgo: '12h ago',
          location: 'IMSU',
          text: 'I was so horny',
          likes: 803,
          comments: 4682,
          shares: 20,
          boosted: true,
          postType: PostType.boosted,
        ),
        buildPostItem(
          context,
          avatar: 'assets/images/avatar.png',
          username: 'Anonymous',
          timeAgo: '12h ago',
          location: 'IMSU',
          images: ['assets/images/event1.png', 'assets/images/event2.png'],
          likes: 803,
          comments: 4682,
          shares: 20,
          boosted: false,
          postType: PostType.poll,
        ),
        buildPostItem(
          context,
          avatar: 'assets/images/avatar.png',
          username: 'Anonymous',
          timeAgo: '12h ago',
          location: 'IMSU',
          images: ['assets/images/graduation.png'],
          text:
              'Have a great day with my amazing client all the way from NewYork',
          likes: 803,
          comments: 4682,
          shares: 20,
          boosted: false,
          postType: PostType.image,
        ),
      ],
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

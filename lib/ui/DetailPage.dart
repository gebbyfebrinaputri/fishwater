import 'package:flutter/material.dart';

class PostDetailPage extends StatefulWidget {
  final String title;
  final String content;
  final String image;
  final String description;

  const PostDetailPage({
    Key? key,
    required this.title,
    required this.content,
    required this.image,
    required this.description,
  }) : super(key: key);

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  int likes = 0;
  final List<String> comments = [];

  void _addLike() {
    setState(() {
      likes++;
    });
  }

  void _addComment(String comment) {
    setState(() {
      comments.add(comment);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromARGB(255, 109, 177, 255),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 3, 3, 3),
              ),
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(widget.image),
            ),
            const SizedBox(height: 10),
            Text(
              widget.content,
              style: const TextStyle(fontSize: 18, color: Colors.black87),
            ),
            const SizedBox(height: 10),
            Text(
              widget.description,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.thumb_up, color: Color.fromARGB(255, 110, 236, 202)),
                  onPressed: _addLike,
                ),
                Text('$likes Likes'),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Comments',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 124, 247, 214),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(comments[index]),
                );
              },
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Add a comment',
                border: OutlineInputBorder(),
              ),
              onSubmitted: _addComment,
            ),
          ],
        ),
      ),
    );
  }
}

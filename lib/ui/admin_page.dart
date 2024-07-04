import 'package:flutter/material.dart';
import 'edit_post_page.dart'; // Impor halaman edit posting

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final List<Map<String, dynamic>> posts = [
    {
      'title': 'Ikan Guppy',
      'content': 'Ikan kecil dengan warna-warna cerah dan ekor yang indah',
      'image': 'assets/images/guppy.jpg',
      'description': 'Ikan guppy adalah ikan kecil yang sangat populer di kalangan pecinta akuarium karena warna dan ekornya yang menarik. Guppy mudah berkembang biak dan cocok untuk pemula. Ikan gapi merupakan ikan hias air tawar yang berukuran kecil. Ikan ini digemari karena mudah dipelihara dan memiliki berbagai corak warna yang indah, terutama pada ikan jantan. Sedangkan pada ikan betina lebih monoton pada satu warna.',
      'comments': ['Beautiful fish!', 'I love the colors!', 'Where can I buy this?']
    },
    {
      'title': 'Ikan Cupang',
      'content': 'Terkenal dengan sirip panjang dan warna-warna yang beragam',
      'image': 'assets/images/cupang.jpg',
      'description': 'Ikan cupang yang biasanya dikenal sebagai ikan betta merupakan salah satu jenis ikan air tawar yang paling populer di kalangan pecinta ikan di seluruh dunia. Mempunyai keindahan yang menakjubkan dan perilaku unik, ikan cupang telah menjadi favorit di dunia hobi ikan. Ikan ini memiliki perilaku agresif terhadap ikan lain, terutama sesama jantan, sehingga sering dipelihara sendirian.',
      'comments': ['So aggressive yet so beautiful!', 'Perfect fish for a beginner.']
    },
    {
      'title': 'Ikan Koi',
      'content': 'Ikan besar berwarna-warni yang sering dipelihara di kolam',
      'image': 'assets/images/koi.jpg',
      'description': 'Ikan koi adalah jenis ikan mas yang dibudidayakan untuk keindahan, dengan pola warna yang beragam. Ikan ini sering dipelihara di kolam dan dianggap membawa keberuntungan di budaya Jepang. Ikan hias ini termasuk dalam ikan mas (Cyprinus carpio) yang memiliki corak yang sangat indah pada tubuhnya.',
      'comments': ['Brings good luck!', 'Beautiful patterns.', 'I have a pond full of them!']
    },
  ];

  void _addPost() {
    // Implement functionality to add new post
  }

  void _editPost(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditPostPage(
          post: posts[index],
          onSave: (updatedPost) {
            setState(() {
              posts[index] = updatedPost;
            });
          },
        ),
      ),
    );
  }

  void _deletePost(int index) {
    setState(() {
      posts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fish water'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    posts[index]['title']!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  posts[index]['image'] != null
                      ? Image.asset(
                          posts[index]['image'],
                          width: 200.0,
                        )
                      : Container(),
                  const SizedBox(height: 10),
                  Text(posts[index]['content']!),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          _editPost(index);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _deletePost(index);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPost,
        child: const Icon(Icons.add),
      ),
    );
  }
}

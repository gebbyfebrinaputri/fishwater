import 'package:flutter/material.dart';
import 'detailpage.dart';

class IkanView extends StatelessWidget {
  const IkanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> posts = [
      {
        'title': 'Ikan Guppy',
        'content': 'Ikan kecil dengan warna-warna cerah dan ekor yang indah',
        'image': 'assets/images/guppy.jpg',
        'description': 'Ikan guppy adalah ikan kecil yang sangat populer di kalangan pecinta akuarium karena warna dan ekornya yang menarik. Guppy mudah berkembang biak dan cocok untuk pemula. Ikan gapi merupakan ikan hias air tawar yang berukuran kecil. Ikan ini digemari karena mudah dipelihara dan memiliki berbagai corak warna yang indah, terutama pada ikan jantan. Sedangkan pada ikan betina lebih monoton pada satu warna.',
      },
      {
        'title': 'Ikan Cupang',
        'content': 'Terkenal dengan sirip panjang dan warna-warna yang beragam',
        'image': 'assets/images/cupang.jpg',
        'description': 'Ikan cupang yang biasanya dikenal sebagai ikan betta merupakan salah satu jenis ikan air tawar yang paling populer di kalangan pecinta ikan di seluruh dunia. Mempunyai keindahan yang menakjubkan dan perilaku unik, ikan cupang telah menjadi favorit di dunia hobi ikan. Ikan ini memiliki perilaku agresif terhadap ikan lain, terutama sesama jantan, sehingga sering dipelihara sendirian.',
      },
      {
        'title': 'Ikan Koi',
        'content': 'Ikan besar berwarna-warni yang sering dipelihara di kolam',
        'image': 'assets/images/koi.jpg',
        'description': 'Ikan koi adalah jenis ikan mas yang dibudidayakan untuk keindahan, dengan pola warna yang beragam. Ikan ini sering dipelihara di kolam dan dianggap membawa keberuntungan di budaya Jepang. Ikan hias ini termasuk dalam ikan mas (Cyprinus carpio) yang memiliki corak yang sangat indah pada tubuhnya.',
      },
    ];

    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Card(
            color: Color.fromARGB(255, 204, 234, 255),
            margin: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostDetailPage(
                      title: posts[index]['title']!,
                      content: posts[index]['content']!,
                      image: posts[index]['image']!,
                      description: posts[index]['description']!,
                    ),
                  ),
                );
              },
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
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 10),
                    posts[index]['image'] != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              posts[index]['image'],
                              width: 200.0,
                            ),
                          )
                        : Container(),
                    const SizedBox(height: 10),
                    Text(
                      posts[index]['content']!,
                      style: const TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.thumb_up, color: Color.fromARGB(255, 50, 111, 245)),
                          onPressed: () {
                            // Implement like functionality here
                          },
                        ),
                        const SizedBox(width: 8),
                        const Text('260 Likes', style: TextStyle(color: Color.fromARGB(255, 46, 91, 255))), // Placeholder for like count
                      ],
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

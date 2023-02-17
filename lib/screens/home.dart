import 'package:flutter/material.dart';
import 'package:loginapp/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var count = 6;
  var actors = [
    'https://wallpaperaccess.com/full/1403118.jpg',
    'https://i.pinimg.com/originals/c1/40/05/c14005a488c9b6289b526d64b07d7ab9.jpg',
    'https://i.pinimg.com/736x/0e/08/47/0e0847a061b7ba6827f9796d611b7106.jpg',
    'https://i.pinimg.com/originals/9f/0a/bc/9f0abc9723a56641a878076103755cb9.jpg',
    'https://i.pinimg.com/564x/cf/db/91/cfdb91284fd14307e9f70c56065ff0fc.jpg',
    'https://i.pinimg.com/originals/42/a2/1a/42a21ab29d435db1eac4adebbdc84635.jpg'
  ];
  var names = [
    'Mohanlal',
    'Mammootty',
    'Prithviraj',
    'Dulquer Salmaan',
    'Tovino Thomas',
    'Nivin Pauly'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cinema'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.setBool('isLogged', false);
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://img.favpng.com/22/1/8/film-reel-png-favpng-Hcq47JmJKi7GqpR9qCRWU7CvC.jpg'),
                    fit: BoxFit.fill),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: index.isEven
                          ? Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: Colors.grey.shade300),
                                image: DecorationImage(
                                    image: NetworkImage(actors[index]),
                                    fit: BoxFit.fill),
                              ),
                            )
                          : Image(
                              image: NetworkImage(actors[index]),
                            ),
                      title: Text(names[index]),
                      subtitle: const Text('Malayalam Film Actor'),
                      trailing: InkWell(
                        onTap: () {
                          setState(() {
                            count = count - 1;
                          });
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1,
                    );
                  },
                  itemCount: count),
            ),
          ],
        ),
      ),
    );
  }
}

alternateimage(index) {
  if (index % 2 == 0) {
  } else {}
}

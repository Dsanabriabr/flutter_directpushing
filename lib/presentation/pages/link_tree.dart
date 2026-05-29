import 'package:flutter/material.dart';
import '../../models/link_item.dart';
import '../../widgets/link_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:custom_rich_text/custom_rich_text.dart';
import 'package:custom_rich_text/models/read_more_less_model.dart';

class LinkTreePage extends StatelessWidget {
  const LinkTreePage({super.key});

  @override
  Widget build(BuildContext context) {
    final links = [
      LinkItem(
        title: "Me siga no Instagram",
        icon: FontAwesomeIcons.instagram,
        onTap: () {},
        notificationCount: 2,
        color: const Color(0xFFE7E39B),
      ),
      LinkItem(
        title: "Me Assista no YouTube",
        icon: FontAwesomeIcons.youtube,
        onTap: () {},
        notificationCount: 5,
        color: const Color(0xFFE7E39B),
      ),
      LinkItem(
        title: "Me Ouça no Spotify",
        icon: FontAwesomeIcons.spotify,
        onTap: () {},
        notificationCount: 0,
        color: const Color(0xFFE7E39B),
      ),
      LinkItem(
        title: "Grupo no Whatsapp",
        icon: FontAwesomeIcons.whatsapp,
        onTap: () {},
        color: const Color.fromARGB(255, 4, 170, 76),
        isPrimary: true,
      ),
      LinkItem(
        title: "Grupo no Telegram",
        icon: FontAwesomeIcons.telegram,
        onTap: () {},
        color: const Color.fromARGB(255, 84, 123, 214),
        isPrimary: true,
      ),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 20),

            // Avatar + Title
            Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.yellow,
                  backgroundImage: NetworkImage("https://instagram.fbhz1-2.fna.fbcdn.net/v/t51.82787-19/702544723_18590467711054132_7348923210716710638_n.jpg?stp=dst-jpg_s320x320_tt6&efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4xMDgwLmMyIn0&_nc_ht=instagram.fbhz1-2.fna.fbcdn.net&_nc_cat=104&_nc_oc=Q6cZ2gFBpExhKGRWR497-xfye572HJe1vIA1BJgrI9SaqEYSalt_9EHkmrdh_Jrgh-8z30d4dht4P7HZjqm9pc3jiEmX&_nc_ohc=85pYtTUnabcQ7kNvwEG1B3R&_nc_gid=D7gKzTv00sg8fs2TwqtjwQ&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_Af4tUXMY25MxTQmBX3_tCG6toPEF16xVPK9GyjFZvUcwuQ&oe=6A187A77&_nc_sid=8b3546"),
                ),
                SizedBox(height: 10),
                Text(
                  "Lucas Mortimer",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                CustomRichText(
                  text: "Pré-candidato deputado federal pelo @psolmg. Músico, agente cultural e Graxa @imersaolatina · @liquidificadorfestival · @confeitaria.musica",
                  readMoreLessModel: ReadMoreLessModel(
                    trimLines: 2,
                    readMoreText: "    ver mais",
                    readLessText: "    ver menos",
                    readMoreLessStyle: TextStyle(fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 0, 139, 252)),
                  ),
                  highlightTerms: ["@psolmg", "@imersaolatina", "@liquidificadorfestival", "@confeitaria.musica"],
                  highlightTermsStyle: TextStyle(fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 0, 139, 252)),
                  onTermTap: (term) async {
                    // Handle tap on highlighted terms if needed
                    // await launchUrlString(Uri.parse("https://www.instagram.com/${term.replaceAll('@', '')}"));
                    print("Tapped on: $term");
                  },
                ),
              ],
            ),

            const SizedBox(height: 30),

            ...links.map((link) => LinkButton(
                  title: link.title,
                  icon: link.icon,
                  onTap: link.onTap,
                  notificationCount: link.notificationCount,
                  backgroundColor: link.color,
                  isPrimary: link.isPrimary,
                )),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                "DS - Digital Services",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
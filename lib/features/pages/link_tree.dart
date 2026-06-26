import 'package:flutter/material.dart';
import '../../core/models/link_item.dart';
import '../../design_system/link_button.dart';
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
                  backgroundImage: NetworkImage("https://scontent.fbhz1-1.fna.fbcdn.net/v/t39.30808-1/702695592_28015886788013233_9182764264861766887_n.jpg?stp=dst-jpg_tt6&cstp=mx1080x1080&ctp=s480x480&_nc_cat=103&ccb=1-7&_nc_sid=1d2534&_nc_ohc=55i1xRzxEWgQ7kNvwGFCbHU&_nc_oc=Adq3fjshVawzmbD11Z759RuWf-Ce8IEDfGoX6clIWdGk7XMZgF1tMP2ftLMj3bVTnY6Xu8tzyx22x211nIDs1SlH&_nc_zt=24&_nc_ht=scontent.fbhz1-1.fna&_nc_gid=87vuLjTsnhaYmuqcLwwsbg&_nc_ss=7b289&oh=00_Af99ZIt67ELNr-KZFmVtJ2kZpTy0Cq4vxpBUC890lfCakA&oe=6A4475DE"),
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
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:zarity_task/service_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final primaryColor = const Color(0xff02012d);
  final secondaryColor = const Color(0xff1b2152);

  final services = [
    {
      'name': 'Consult',
      'icon_address': "https://cdn-icons-png.flaticon.com/512/7858/7858230.png",
      'image_address':
          "https://static.wixstatic.com/media/ff34f6_f6be6373c94c45a388fe6bd66a9d9409~mv2.png/v1/crop/x_0,y_60,w_2000,h_1881/fill/w_503,h_473,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/Medical%20prescription-zarity.png",
      'description': "Speak to a doctor who's not in a rush.Your first "
          "consultation at zarity is different. They are ~30 minutes"
          " long, so you get enough time to ask your questions, and "
          "the doctor gets time to look at your health history.",
      'fees': 500,
    },
    {
      'name': "Mental\nHealth",
      'icon_address': "https://cdn-icons-png.flaticon.com/512/2036/2036943.png",
      'image_address':
          "https://static.wixstatic.com/media/ff34f6_2525755f76d44a8280f204b217bf5801~mv2.png/v1/crop/x_275,y_0,w_1450,h_2000/fill/w_380,h_524,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/Baseline%20consultation-zarity.png",
      'description':
          "Speak to a clinical therapist who offers therapy/medication for your stress/anxiety concerns, connecting it to your overall health.",
      'fees': 200
    },
    {
      'name': "Nutrition",
      'icon_address': "https://cdn-icons-png.flaticon.com/512/8662/8662440.png",
      'image_address':
          "https://static.wixstatic.com/media/ff34f6_bb48d8436b92468ca884e98f69d4565a~mv2.png/v1/fill/w_490,h_398,fp_0.50_0.50,q_85,usm_0.66_1.00_0.01,enc_auto/ff34f6_bb48d8436b92468ca884e98f69d4565a~mv2.png",
      'description':
          "Talk to our expert clinical nutritionists - who consider your biochemical data (lab reports) to provide diet & lifestyle guidance. They work along with our doctors & understand your long-term health.",
      'fees': 200
    }
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.07,
              width: double.infinity,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 0.06,
                      width: height * 0.06,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("assets/images/anurag.jpg")),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Good Afternoon\n",
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Anurag Tripathi",
                                style: GoogleFonts.outfit(
                                    fontWeight: FontWeight.bold))
                          ]),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.message_outlined,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        )),
                  ],
                )
              ],
            ),
            SizedBox(height: height * 0.035),
            Container(
              padding: EdgeInsets.all(height * 0.05),
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  SizedBox(
                    height: height * 0.08,
                    child: CircularPercentIndicator(
                      radius: height * 0.04,
                      percent: 0.8,
                      progressColor: Colors.amber,
                      backgroundColor: secondaryColor,
                      center: Text(
                        "70%",
                        style: GoogleFonts.outfit(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.07,
                  ),
                  Text(
                    "Please complete your profile\nto book consultations",
                    style:
                        GoogleFonts.outfit(color: Colors.white, fontSize: 13),
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            ),
            SizedBox(height: height * 0.035),
            Text(
              "Services",
              style: GoogleFonts.outfit(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            ),
            SizedBox(height: height * 0.02),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              for (var service in services) ...[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ServicePage(
                                  service: service,
                                )));
                  },
                  child: Container(
                    width: width * 0.29,
                    height: height * 0.18,
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: "${service['name']}",
                          child: Image.network(
                            "${service['image_address']}",
                            height: height * 0.07,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Text(
                          "${service['name']}".toUpperCase(),
                          style: GoogleFonts.outfit(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ])
          ],
        ),
      ),
    );
  }
}

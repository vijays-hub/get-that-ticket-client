import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/utils/app_info.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class FeaturedArticles extends StatelessWidget {
  const FeaturedArticles({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri randomArticleUri1 = Uri.parse(
        "https://www.mckinsey.com/industries/travel-logistics-and-infrastructure/our-insights/back-to-the-future-airline-sector-poised-for-change-post-covid-19");
    final Uri randomArticleUri2 = Uri.parse(
        "https://economictimes.indiatimes.com/industry/transportation/airlines-/-aviation/delhi-airport-congestion-jyotiraditya-scindia-visits-t3-to-inspect-arrangements/articleshow/96163129.cms");
    final Uri randomArticleUri3 = Uri.parse(
        "https://economictimes.indiatimes.com/industry/transportation/airlines-/-aviation/air-india-nears-historic-order-for-up-to-500-jets/articleshow/96152234.cms");

    final viewportSize = AppLayout.getViewportSize(context);

    void redirectToArticle(Uri articleUri) async {
      if (!await launchUrl(articleUri)) {
        throw 'Could not opne this article';
      }
    }

    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Featured Articles",
                style: GlobalStyles.heading2Style,
              ),
              InkWell(
                onTap: () {
                  debugPrint("Pressed the Stack All Button");
                },
                child: Text(
                  "Stalk all",
                  style: GlobalStyles.textStyle.copyWith(
                    color: GlobalStyles.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          Gap(
            generateDynamicHeight(15),
          ),
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Main Article.
                Container(
                  width: viewportSize.width * 0.45,
                  height: generateDynamicHeight(350),
                  padding: EdgeInsets.all(
                    generateDynamicHeight(10),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      generateDynamicHeight(12),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: generateDynamicHeight(1),
                        spreadRadius: generateDynamicHeight(1),
                      ),
                    ],
                  ),
                  child: LayoutBuilder(builder: (
                    BuildContext buildContext,
                    BoxConstraints boxConstraints,
                  ) {
                    return InkWell(
                      onTap: () {
                        redirectToArticle(randomArticleUri1);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: boxConstraints.constrainHeight() *
                                0.65, // 65% of the parent height.
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                generateDynamicHeight(12),
                              ),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  "$assetsPath/featured_article_mock_img.jpg",
                                ),
                              ),
                            ),
                          ),
                          Gap(
                            generateDynamicHeight(10),
                          ),
                          Text(
                            "Back to the future? Airline sector poised for change post-COVID-19!",
                            style: GlobalStyles.heading3Style,
                          ),
                        ],
                      ),
                    );
                  }),
                ),

                // Sub Articles.
                Container(
                  height: generateDynamicHeight(350),
                  width: viewportSize.width * 0.48,
                  padding: EdgeInsets.only(
                    left: generateDynamicHeight(10),
                  ),
                  child: LayoutBuilder(builder: (BuildContext buildContext,
                      BoxConstraints boxConstraints) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            // Article
                            Container(
                              width: boxConstraints.constrainWidth(),
                              height: boxConstraints.constrainHeight() * 0.48,
                              padding: EdgeInsets.all(
                                generateDynamicHeight(10),
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF3AB8B8),
                                borderRadius: BorderRadius.circular(
                                  generateDynamicHeight(12),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade200,
                                    blurRadius: generateDynamicHeight(1),
                                    spreadRadius: generateDynamicHeight(1),
                                  ),
                                ],
                              ),
                              child: InkWell(
                                onTap: () {
                                  redirectToArticle(randomArticleUri2);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Delhi airport congestion",
                                      style:
                                          GlobalStyles.heading2Style.copyWith(
                                        fontSize: 25,
                                      ),
                                    ),
                                    Gap(
                                      generateDynamicHeight(10),
                                    ),
                                    Text(
                                      "Jyotiraditya Scindia visits T3 to inspect arrangements",
                                      style:
                                          GlobalStyles.heading4Style.copyWith(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Circle.
                            Positioned(
                              top: -45,
                              right: -45,
                              child: Container(
                                padding: EdgeInsets.all(
                                  generateDynamicHeight(30),
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 18,
                                    color: const Color(0xFF189999),
                                  ),
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Sub Article 2
                        Container(
                          width: boxConstraints.constrainWidth(),
                          height: boxConstraints.constrainHeight() * 0.48,
                          padding: EdgeInsets.all(
                            generateDynamicHeight(10),
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEC6545),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: InkWell(
                            onTap: () {
                              redirectToArticle(randomArticleUri3);
                            },
                            child: Column(
                              children: [
                                Text(
                                  "Air India nears historic order for up to 500 jets!",
                                  style: GlobalStyles.heading3Style.copyWith(
                                    color: Colors.white,
                                    fontSize: 22,
                                  ),
                                ),
                                Gap(
                                  generateDynamicHeight(10),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "✈︎",
                                        style: TextStyle(
                                          fontSize: generateDynamicHeight(20),
                                        ),
                                      ),
                                      TextSpan(
                                        text: "✈︎",
                                        style: TextStyle(
                                          fontSize: generateDynamicHeight(40),
                                        ),
                                      ),
                                      TextSpan(
                                        text: "✈︎",
                                        style: TextStyle(
                                          fontSize: generateDynamicHeight(20),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
          Gap(
            generateDynamicHeight(10),
          ),
        ],
      ),
    );
  }
}

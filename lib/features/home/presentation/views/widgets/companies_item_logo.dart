import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/core/utils/app_assets.dart';
import 'package:kargomkolay_tracking_app/features/home/presentation/views/widgets/circular_container.dart';

class CompaniesItemLogo extends StatelessWidget {
  const CompaniesItemLogo({super.key});

  final List<String> logos = const [
    AppAssets.upsLogo,
    AppAssets.fedexLogo,
    AppAssets.dhlLogo,
    AppAssets.cargoMiniLogo,
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.width <= 320 ? size.height * 0.14 : size.height * 0.12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          logos.length,
          (index) => CircularContainer(logoString: logos[index]),
        ),
      ),
    );
  }
}

/*


SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularContainer(logoString: AppAssets.upsLogo),
              CircularContainer(logoString: AppAssets.fedexLogo),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularContainer(logoString: AppAssets.dhlLogo),
              CircularContainer(logoString: AppAssets.cargoMiniLogo),
            ],
          ),
        ],
      ),
    )

*/


/*
ClipOval(
              child: SizedBox.fromSize(
                size: Size.fromRadius(48), // Image radius
                child:
                    Image.asset('assets/images/dhl.png', fit: BoxFit.contain),
              ),
            ),
*/


/*
Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          logos.length,
          (index) => Container(
            margin: const EdgeInsets.only(left: 10),
            width: 80,
            height: 80,
            // padding: const EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(logos[index]),
              ),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      )
*/

/*
Container(
            margin: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(
                logos[index],
              ),
            ),
          ),
        ).toList()
*/


/*
ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
            logos[index],
          ),
        ),
        itemCount: logos.length,
      )

*/
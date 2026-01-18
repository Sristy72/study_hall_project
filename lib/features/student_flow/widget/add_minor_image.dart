import 'package:flutter/material.dart';

class ThinkingGirlWidget extends StatelessWidget {
  const ThinkingGirlWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none, // Allows the icon to overflow outside the rounded clip
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 1,
                color: Color(0xFFDBEAFE)
              )
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0), // Adjust radius for more/less rounding
              child: Image.asset(
                'assets/images/add_minor.jpg', // Replace with your image asset or use Image.network for URL
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            bottom: -20, // Adjust to position the button halfway overlapping the image
            child: Container(
              height: 34,
              width: 34,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.white
                ),
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue,
                //shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: IconButton(
                icon: Image.asset('assets/images/edit.png'),
                onPressed: () {
                  // Add your action here (e.g., edit functionality)
                  print('Edit pressed');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
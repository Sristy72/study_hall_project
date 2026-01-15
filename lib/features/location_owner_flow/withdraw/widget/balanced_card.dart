import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180, // typical height for such cards
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF3B82F6), // Starting blue
            Color(0xFF459D96), // Ending green
          ], stops: [0.0, 4],
        ),
      ),
      child: Stack(
        children: [
          // Background decorative circles
          Positioned(
            right: -50,
            top: -80,
            child: Container(
              width: 206,
              height: 206,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.2),
                border: Border.all(
                    color: Colors.white.withOpacity(0.4),
                    width: 2
                )
              ),
            ),
          ),
          Positioned(
            right: -25,
            bottom: -80,
            child: Container(
              width: 206,
              height: 206,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.2),
                  border: Border.all(
                      color: Colors.white.withOpacity(0.4),
                    width: 2
                  )
              ),
            ),
          ),


          // Main content
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row - Label + Percentage badge
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Current Balance',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.white70,
                          size: 20,
                        ),
                      ],
                    ),

                    // Percentage pill
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.trending_up_rounded,
                            color: Colors.white,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '+13.25%',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                // Balance amount
                const Text(
                  '\$12,000,000.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                    height: 1.1,
                  ),
                ),

                const Spacer(),

                Container(decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8)
                ),
                  child: TextButton(onPressed: (){}, style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,

                  ), child: Text('Withdraw', style: TextStyle(color: Color(0xFFFFFFFF)),)),
                )

                // // Withdraw button
                // Container(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 28,
                //     vertical: 12,
                //   ),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(30),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.black.withOpacity(0.12),
                //         blurRadius: 8,
                //         offset: const Offset(0, 3),
                //       ),
                //     ],
                //   ),
                //   child: const Text(
                //     'Withdraw',
                //     style: TextStyle(
                //       color: Color(0xFF2563EB),
                //       fontSize: 15,
                //       fontWeight: FontWeight.w600,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
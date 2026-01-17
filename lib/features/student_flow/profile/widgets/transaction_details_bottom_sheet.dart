import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionDetailsBottomSheet extends StatelessWidget {
  const TransactionDetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Close Icon
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.black),
              onPressed: () => Get.back(),
            ),
          ),
          
          // Ticket Shape Container
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: Offset(0, 4),
                    ),
                  ],
                  border: Border.all(color: Colors.grey.shade100),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 50), // For the icon
                    Text(
                      '\$500',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1D4ED8),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Cultivate Calm & Creativity with\nFun Drawing -',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(height: 24),
                    
                    // Dashed Line
                    Row(
                      children: List.generate(40, (index) => Expanded(
                        child: Container(
                          color: index % 2 == 0 ? Colors.transparent : Colors.grey.shade300,
                          height: 1,
                        ),
                      )),
                    ),
                    
                    // Details
                    _buildDetailRow("Transaction id", "Th12345654323456"),
                    _buildDetailRow("Date", "12 / 8 / 2025"),
                    _buildDetailRow("Payment Method", "Credit Card"),
                    _buildDetailRow("Customer Name", "John de"),
                    _buildDetailRow("Beneficiary", "Study Hall"),
                    
                    // Status
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Status",
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Color(0xFFD1FAE5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "Completed",
                              style: TextStyle(
                                color: Color(0xFF10B981),
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    
                    // Scalloped Edge Effect at Bottom
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(10, (index) => Container(
                        width: 24,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.white, // Match background of the parent (sheet)
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          boxShadow: [
                             BoxShadow(color: Colors.grey.shade100, blurRadius: 1, spreadRadius: -2)
                          ]
                        ),
                      )),
                    ),
                  ],
                ),
              ),
              
              // Success Icon
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFF34D399), // Green
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                    ),
                    child: Icon(Icons.verified, color: Colors.white, size: 30),
                  ),
                ),
              ),
              
              // Scallops / Cutouts on sides (Optional implementation detail)
              Positioned(
                top: 150,
                left: -12,
                child: Container(
                  width: 24, height: 24,
                  decoration: BoxDecoration(
                    color: Colors.white, // Match sheet background (assumed white here, but can be transparent if sheet is modal)
                     shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: 150,
                right: -12,
                child: Container(
                  width: 24, height: 24,
                  decoration: BoxDecoration(
                    color: Colors.white,
                     shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          
          SizedBox(height: 32),
          
          // Action Buttons
          Row(
            children: [
              Expanded(
                child: SizedBox(
                   height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.share_outlined, size: 20),
                    label: Text("Share", style: TextStyle(fontSize: 16)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE0F2FE),
                      foregroundColor: Color(0xFF3B82F6),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                   height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.download_outlined, size: 20),
                    label: Text("Download", style: TextStyle(fontSize: 16)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3B82F6),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Container(width: 134, height: 5, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(10)))
        ],
      ),
    );
  }
  
  Widget _buildDetailRow(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
          ),
          Text(
            value,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

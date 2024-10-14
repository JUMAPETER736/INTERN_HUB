import 'package:flutter/material.dart';

class InternshipTips extends StatelessWidget {
  // Sample list of internship tips
  final List<String> tips = [
    "1. Tailor your resume for each application.",
    "2. Research the company and its culture.",
    "3. Prepare for common interview questions.",
    "4. Follow up with a thank-you email after interviews.",
    "5. Network with professionals in your field.",
    "6. Dress appropriately for interviews.",
    "7. Ask questions during your interview to show interest.",
    "8. Be open to feedback and willing to learn.",
    "9. Practice your communication skills.",
    "10. Set clear goals for what you want to achieve."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internship Tips'),
        centerTitle: true,
        backgroundColor: Colors.teal, // Changed color to teal for freshness
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Add your share functionality here
              // You can use a package like share_plus to share tips
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search tips...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                // Implement your search logic here
              },
            ),
            SizedBox(height: 16), // Space between the search bar and the list
            Expanded(
              child: ListView.separated(
                itemCount: tips.length,
                separatorBuilder: (context, index) => Divider(
                  height: 20,
                  color: Colors.grey[300],
                ), // Lighter divider
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.lightbulb, color: Colors.teal),
                      title: Text(
                        tips[index],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500, // Semi-bold text
                        ),
                      ),
                      onTap: () {
                        // Show a dialog or navigate to a detail screen
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Tip Detail'),
                            content: Text(tips[index]),
                            actions: [
                              TextButton(
                                child: Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

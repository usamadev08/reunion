import 'package:flutter/material.dart';
import 'package:reunion/utlis.dart';

class ReusableButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;
  final bool loading;
  final ImageProvider? imageProvider; // Nullable image provider

  ReusableButton({
    required this.title,
    required this.onTap,
    this.color = Colors.green, // Changed to green color
    this.textColor = Colors.black,
    this.loading = false,
    this.imageProvider, // Added nullable image provider parameter
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        borderRadius: BorderRadius.circular(25), // Rounded border
        child: Container(
          height: 60, // Fixed height for the container
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 246, 245, 245), // Container color
            borderRadius: BorderRadius.circular(25), // Rounded border
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (imageProvider != null) // Conditionally show the image
                Container(
                  width: 35, // Fixed width for the image
                  height: 35, // Fixed height for the image
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Make the image circular
                  ),
                  child: ClipOval(
                    child: Image(
                      image: imageProvider!,
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                  ),
                ),
              SizedBox(width: 8), // Spacer between image and text
              Expanded(
                child: loading
                    ? Center(child: CircularProgressIndicator())
                    : Text(
                        title,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:reunion/utlis/utlis.dart';

class ReusableButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;
  final bool loading;
  final ImageProvider? imageProvider;

  ReusableButton({
    required this.title,
    required this.onTap,
    this.color = Colors.green,
    this.textColor = Colors.black,
    this.loading = false,
    this.imageProvider,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 246, 245, 245),
            borderRadius: BorderRadius.circular(25),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (imageProvider != null)
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image(
                      image: imageProvider!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              SizedBox(width: 8),
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

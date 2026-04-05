import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:math' as math;

class ProfileAvatarPicker extends StatefulWidget {
  const ProfileAvatarPicker({super.key});

  @override
  State<ProfileAvatarPicker> createState() => _ProfileAvatarPickerState();
}

class _ProfileAvatarPickerState extends State<ProfileAvatarPicker> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      // Ignored: optionally show error toast via context depending on configuration
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: SizedBox(
        width: 112,
        height: 112,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: const Size(112, 112),
              painter: DashedCirclePainter(
                color: const Color(0xFF71121C),
                strokeWidth: 1,
                dashWidth: 6,
                dashSpace: 4,
              ),
            ),
            Container(
              width: 108,
              height: 108,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFEAEAEA),
                image: _imageFile != null
                    ? DecorationImage(
                        image: FileImage(_imageFile!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: _imageFile == null
                  ? const Icon(CupertinoIcons.person_solid, size: 48, color: Colors.grey)
                  : null,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFD72335), Color(0xFF71121C)],
                  ),
                ),
                child: const Icon(Icons.camera_alt_outlined, color: Colors.white, size: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DashedCirclePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  DashedCirclePainter({
    required this.color,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final circumference = math.pi * size.width;
    final dashCount = (circumference / (dashWidth + dashSpace)).floor();
    final adjustSpace = (circumference - (dashCount * dashWidth)) / dashCount;
    final sweepAngle = (dashWidth) * 2 * math.pi / circumference;
    final spaceAngle = (adjustSpace) * 2 * math.pi / circumference;

    double currentAngle = 0;
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    for (int i = 0; i < dashCount; i++) {
      canvas.drawArc(rect, currentAngle, sweepAngle, false, paint);
      currentAngle += sweepAngle + spaceAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

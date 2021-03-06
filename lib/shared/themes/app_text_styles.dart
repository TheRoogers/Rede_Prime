import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class TextStyles {
  static final titleHome = GoogleFonts.ptSans(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.titlesplash,
  );
  static final titleLogin = GoogleFonts.lato(
    fontSize: 18,
    //fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );
  static final bottomLogin = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.titlesplash,
  );
  static final forgotpassword = GoogleFonts.quicksand(
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
  static final signup = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static final titulo = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black
  );

  static final campodeTexto = GoogleFonts.quicksand(
    fontSize: 16,
  );

  static final link = GoogleFonts.quicksand(
    fontSize: 16,
    color: Colors.lightBlue
  );

  static final link2 = GoogleFonts.quicksand(
    fontSize: 18,
    color: Colors.lightBlue
  );
  
}

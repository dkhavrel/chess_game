import 'package:chess_game/components/piece.dart';
import 'package:chess_game/values/colors.dart';
import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final bool isWhite;
  final ChessPiece? piece;
  final bool isSelected;
  final void Function()? onTap;
  final bool isValidMove;

  const Square({
    super.key,
    required this.isWhite,
    required this.piece,
    required this.isSelected,
    required this.onTap,
    required this.isValidMove,
  });

  @override
  Widget build(BuildContext context) {
    Color? squareColor;

    if (isSelected) {
      squareColor = Colors.green;
    } else if (isValidMove) {
      squareColor = Colors.green.shade300;
    } else {
      squareColor = isWhite ? foregroundColor : backgroundColor;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(isValidMove ? 8 : 0),
        color: squareColor,
        child: piece != null
            ? Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  piece!.imagePath,
                  color: piece!.isWhite ? Colors.white : Colors.black,
                ),
              )
            : null,
      ),
    );
  }
}

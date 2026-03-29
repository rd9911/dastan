import 'package:flutter/material.dart';
import 'package:dastan/src/features/tours/domain/tour_models.dart';

class BuyFab extends StatelessWidget {
  final TourSummary tour;
  final VoidCallback onPressed;

  const BuyFab({super.key, required this.tour, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      icon: const Icon(Icons.shopping_cart_checkout),
      label: Text(
        tour.isFree ? 'Get for Free' : 'Buy for \$${tour.priceUsd.toStringAsFixed(2)}',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Colors.white,
    );
  }
}

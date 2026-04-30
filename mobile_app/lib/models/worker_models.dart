import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData iconData; 
  Category({required this.name, required this.iconData});
}

class Worker {
  final String id;
  final String name;
  final String specialty;
  final double rating;
  final int experience;
  final double distance;
  final String startingPrice;
  final String priceUnit; 
  final String imageUrl;
  final bool isVerified;
  final String initial; 

  Worker({
    required this.id,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.experience,
    required this.distance,
    required this.startingPrice,
    required this.priceUnit,
    this.imageUrl = "", 
    this.isVerified = true,
    required this.initial,
  });
}

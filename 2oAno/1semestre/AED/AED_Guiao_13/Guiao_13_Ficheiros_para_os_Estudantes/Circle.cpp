//
// Algoritmos e Estruturas de Dados - 2024/2025
//
// J. Madeira - April/May 2022, December 2024
//
// COMPLETE the code, according to Circle.h
//

#include "Circle.h"

#define _USE_MATH_DEFINES

#include <cassert>
#include <cmath>
#include <iostream>
#include <string>

#include "Figure.h"
#include "Point.h"

Circle::Circle(void) {
  // Circle of radius 1 and centered at (0,0)
  // COMPLETE
}

Circle::Circle(Point center, const std::string& color, double length) {
  // Ensure that the radius is larger than 0.0
  // COMPLETE
}

Circle::Circle(double x, double y, const std::string& color, double length) {
  // Ensure that the radius is larger than 0.0
  // COMPLETE
  assert(length >= 0);
  SetCenter(Point(x,y));
  SetColor(color);
  radius_ = length;
}

double Circle::GetRadius(void) const { return radius_; }
void Circle::SetRadius(double length) {
  // Ensure that the radius is larger than 0.0
  // COMPLETE
  assert(length >= 0);
  radius_= length;
}

std::string Circle::GetClassName(void) const { return "Circle"; }

double Circle::Area(void) const {
  // COMPLETE
  return 3.141592654 * radius_ * radius_;
}

double Circle::Perimeter(void) const {
  // COMPLETE
  return 2 * 3.141592654 * radius_;
}

bool Circle::Intersects(const Circle& c) const {
  // dist(C1,C2) <= r1 + r2
  // if dist(C1,C2) == r1 + r2, then circles touch at a single point

  double distance_between_centers = GetCenter().DistanceTo(c.GetCenter());

  double sum_of_radii = radius_ + c.radius_;

  return (distance_between_centers < sum_of_radii);
}

std::ostream& operator<<(std::ostream& os, const Circle& obj) {
  os << "Center: " << obj.GetCenter() << std::endl;
  os << "Color: " << obj.GetColor() << std::endl;
  os << "Radius = " << obj.radius_ << std::endl;
  return os;
}

std::istream& operator>>(std::istream& is, Circle& obj) {
  // COMPLETE
  std::cout << "Center = ";
  is >> obj.center_;
  std::cout << "Color = ";
  is >> obj.color_;;
  std::cout << "Radius =  ";
  is >> obj.radius;
}

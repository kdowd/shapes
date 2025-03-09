#include <iostream>
#include <cmath>
#include <string>
#include <array>

using namespace std;

const double PI = 3.14159; // Define constant value for PI

class RandomColor{

public:
    RandomColor() {
        cout << "THIS = " << this << "\n";
        colors[0] = "Red";
        colors[1] = "Orange";
        colors[2] = "Yellow";
        colors[3] = "Green";
        colors[4] = "Blue";
        colors[5] = "Indigo";
        colors[6] = "Violet";
    }

    string  getColor(){

            int randomNum = rand() % 7;
            return colors[randomNum];
    }

private:
    string colors[7];

};


class Shape
{
protected:
    string name{};
    string colour{};
    RandomColor rc;


public:
    Shape(string s): name(s)
    {

        colour = rc.getColor();
    }

    string getName(){
        return name;
    }


    string getColour(){
        return colour;
    }

    static double calculateArea(){
        return 0.0;
    }

    static double calculatePerimeter(){
        return 0.0;
    }
    //virtual double calculatePerimeter() = 0;
};


class Circle: public Shape {
private:
    double radius;

public:
    Circle(double rad): Shape("Circle") {
        radius = rad;
    }



    double calculateArea() const {
        return PI * pow(radius, 2);
    }

    double calculatePerimeter() const {
        return 2 * PI * radius;
    }
};

class Rectangle: public Shape {
private:
    double length;
    double width;

public:

    Rectangle(double len, double wid): length(len), width(wid), Shape("Rectangle"){}

    double calculateArea() const {
        return length * width;
    }

    double calculatePerimeter() const {
        return 2 * (length + width);
    }
};



int main() {
    srand(time(NULL));
    Circle circle(7.0);
    Rectangle rectangle(4.2, 8.0);


    cout << circle.getName() << ":" << endl;
    cout << "Area: " << circle.calculateArea() << endl;
    cout << "Perimeter: " << circle.calculatePerimeter() << endl;
    cout << "Colour: " << circle.getColour() << endl;

    cout << rectangle.getName() << ":" << endl;
    cout << "Area: " << rectangle.calculateArea() << endl;
    cout << "Perimeter: " << rectangle.calculatePerimeter() << endl;
    cout << "Colour: " << rectangle.getColour() << endl;

}

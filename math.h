#ifndef MATH_H_
#define MATH_H_

#include "net.h"

void classify_network(NET Network);

void forward_propagation(NET Network);
void backward_propagation(NET Network);

double sigmoid_function(double input);
double sigmoid_derivative(double input);

#endif

#include <stdio.h>
#include <math.h>

#include "math.h"

/*
void classify_network(NET Network)
{

}
*/

void forward_propagation(NET Network)
{
    int currentLayer, currentNeuron, currentWeight;
    int startWeightPos, endWeightPos, neuronFrom;
    double weightedSum = 0;

    for (currentLayer = 0; currentLayer < (Network.layers - 1); currentLayer++)
    {
        for (currentNeuron = 0; currentNeuron < Network.NPL[currentLayer + 1]; currentNeuron++)
        {
            startWeightPos = (currentNeuron * Network.NPL[currentLayer]);
            endWeightPos = (startWeightPos + Network.NPL[currentLayer]);

            for (currentWeight = startWeightPos; currentWeight < endWeightPos; currentWeight++)
            {
                neuronFrom = (currentWeight % Network.NPL[currentLayer]);

                weightedSum += Network.neurons[currentLayer][neuronFrom].activation * Network.weights[currentLayer][currentWeight];
            }

            weightedSum += Network.neurons[currentLayer + 1][currentNeuron].bias;

            Network.neurons[currentLayer + 1][currentNeuron].activation = sigmoid_function(weightedSum);
        }
    }
}


void backward_propagation()
{

}


double sigmoid_function(double input)
{
    return 1 / (1 + exp(-input));
}


double sigmoid_derivative(double input)
{
    return sigmoid_function(input) * (1 - sigmoid_function(input));
}

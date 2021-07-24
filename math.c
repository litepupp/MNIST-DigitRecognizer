/*
MIT License

Copyright (c) 2021 litepupp

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

#include <stdio.h>
#include <math.h>

#include "math.h"


void test_mnistclassify_network(NET* Network)
{
    int imageNum;
    int isTesting = 0;
    double expectedOut[Network -> NPL[Network -> layers - 1]];

    for (imageNum = 0; imageNum < 10; imageNum++)
    {
        load_single_image(Network, imageNum, isTesting);
        label_to_expected_out(expectedOut, imageNum, isTesting);
        forward_propagation(Network);
        test_loss_calc(Network, expectedOut);
        print_output_layer(Network);
    }
}


void forward_propagation(NET* Network)
{
    int currentLayer, currentNeuron, currentWeight;
    int startWeightPos, endWeightPos, neuronFrom;
    double weightedSum = 0;

    for (currentLayer = 0; currentLayer < (Network -> layers - 1); currentLayer++)
    {
        for (currentNeuron = 0; currentNeuron < Network -> NPL[currentLayer + 1]; currentNeuron++)
        {
            startWeightPos = (currentNeuron * Network -> NPL[currentLayer]);
            endWeightPos = (startWeightPos + Network -> NPL[currentLayer]);

            for (currentWeight = startWeightPos; currentWeight < endWeightPos; currentWeight++)
            {
                neuronFrom = (currentWeight % Network -> NPL[currentLayer]);

                weightedSum += Network -> neurons[currentLayer][neuronFrom].activation * Network -> weights[currentLayer][currentWeight];
            }

            weightedSum += Network -> neurons[currentLayer + 1][currentNeuron].bias;

            Network -> neurons[currentLayer + 1][currentNeuron].activation = sigmoid_function(weightedSum);
        }
    }
}

void test_loss_calc(NET* Network, double* expectedOut)
{
    int i;
    double totalLoss = 0.0;
    double currentActivation = 0.0;

    for (i = 0; i < Network -> NPL[Network -> layers - 1]; i++)
    {
        currentActivation = Network -> neurons[Network -> layers - 1][i].activation;

        totalLoss += pow((expectedOut[i] - currentActivation), 2);
    }

    printf("LOSS: %lf\n\n", totalLoss);
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

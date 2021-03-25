/*
MIT License

Copyright (c) 2021 Michael Maldonado

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
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>

#include "input.h"

#define NUM_TRAIN 60000
#define NUM_TEST 10000
#define IMGSIZE 784

void initialize_mnist_data(MNIST* data)
{
    int i;
    
    data -> trainIMG = (double**)malloc(NUM_TRAIN * sizeof(double*));
    for (i = 0; i < NUM_TRAIN; i++)
    {
        data -> trainIMG[i] = (double*)malloc(IMGSIZE * sizeof(double));
    }

    data -> testIMG = (double**)malloc(NUM_TEST * sizeof(double*));
    for (i = 0; i < NUM_TEST; i++)
    {
        data -> trainIMG[i] = (double*)malloc(IMGSIZE * sizeof(double));
    }

    data -> trainLABEL = (int*)malloc(NUM_TRAIN * sizeof(int));
    data -> testLABEL = (int*)malloc(NUM_TEST * sizeof(int));
}


void load_mnist_data(MNIST* data)
{
    initialize_mnist_data(data);

    
}


void load_training_image(NET* Network, double** trainIMG, int imageNum)
{

}


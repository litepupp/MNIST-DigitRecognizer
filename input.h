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

#include "net.h"

#define TRAIN_IMG_PATH "./data/train-images.idx3-ubyte"
#define TRAIN_LABEL_PATH "./data/train-labels.idx1-ubyte"

#define TEST_IMG_PATH "./data/t10k-images.idx3-ubyte"
#define TEST_LABEL_PATH "./data/t10k-labels.idx1-ubyte"

#define IMG_SIZE 784

#define NUM_TRAIN_IMG 60000
#define NUM_TEST_IMG 10000

int imageInfoArr[4];
int labelInfoArr[2];

unsigned char train_image_buff[NUM_TRAIN_IMG][IMG_SIZE];
unsigned char train_label_buff[NUM_TRAIN_IMG][1];

unsigned char test_image_buff[NUM_TEST_IMG][IMG_SIZE];
unsigned char test_label_buff[NUM_TEST_IMG][1];

typedef struct MNIST
{
    double trainIMG[NUM_TRAIN_IMG][IMG_SIZE];
    double testIMG[NUM_TEST_IMG][IMG_SIZE];
    int trainLABEL[NUM_TRAIN_IMG];
    int testLABEL[NUM_TEST_IMG];
} MNIST;

MNIST data;


void read_training_images()
{
    int i;
    int imageFile;

    imageFile = open(TRAIN_IMG_PATH, O_RDONLY);

    read(imageFile, imageInfoArr, (4 * sizeof(int)));
    
    for (i = 0; i < NUM_TRAIN_IMG; i++)
    {
        read(imageFile, train_image_buff[i], (IMG_SIZE * sizeof(unsigned char)));   
    }

    close(imageFile);
}


void read_training_labels()
{
    int i;
    int labelFile;

    labelFile = open(TRAIN_LABEL_PATH, O_RDONLY);

    read(labelFile, labelInfoArr, (2 * sizeof(int)));
    
    for (i = 0; i < NUM_TRAIN_IMG; i++)
    {
        read(labelFile, train_label_buff[i], sizeof(unsigned char));   
    }

    close(labelFile);
}


void read_testing_images()
{
    int i;
    int imageFile;

    imageFile = open(TEST_IMG_PATH, O_RDONLY);

    read(imageFile, imageInfoArr, (4 * sizeof(int)));
    
    for (i = 0; i < NUM_TEST_IMG; i++)
    {
        read(imageFile, test_image_buff[i], (IMG_SIZE * sizeof(unsigned char)));   
    }

    close(imageFile);
}


void read_testing_labels()
{
    int i;
    int labelFile;

    labelFile = open(TEST_LABEL_PATH, O_RDONLY);

    read(labelFile, labelInfoArr, (2 * sizeof(int)));
    
    for (i = 0; i < NUM_TEST_IMG; i++)
    {
        read(labelFile, test_label_buff[i], sizeof(unsigned char));   
    }

    close(labelFile);
}


void convert_training_images()
{
    int i, j;
    for (i = 0; i < NUM_TRAIN_IMG; i++)
    {
        for (j = 0; j < IMG_SIZE; j++)
        {
            data.trainIMG[i][j]  = ((double)train_image_buff[i][j] / (double)255.0);
        }
    }
}


void convert_training_labels()
{
    int i;
    for (i = 0; i < NUM_TRAIN_IMG; i++)
    {
        data.trainLABEL[i] = (int)train_label_buff[i][0];
    }
}


void convert_testing_images()
{
    int i, j;
    for (i = 0; i < NUM_TEST_IMG; i++)
    {
        for (j = 0; j < IMG_SIZE; j++)
        {
            data.testIMG[i][j]  = ((double)test_image_buff[i][j] / (double)255.0);
        }
    }
}


void convert_testing_labels()
{
    int i;
    for (i = 0; i < NUM_TEST_IMG; i++)
    {
        data.testLABEL[i] = (int)test_label_buff[i][0];
    }
}


void load_mnist_data()
{
    read_training_images();
    convert_training_images();

    read_training_labels();
    convert_training_labels();

    read_testing_images();
    convert_testing_images();
    
    read_testing_labels();
    convert_testing_labels();
}


void load_single_image(NET* Network, int imageNum, int isTesting)
{
    //Testing Image Selected
    if (isTesting == 1)
    {
        int j;
        for (j = 0; j < IMG_SIZE; j++)
        {
            Network -> neurons[0][j].activation = data.testIMG[imageNum][j];
        }
    }
    //Testing Image Selected
    else
    {
        int i;
        for (i = 0; i < IMG_SIZE; i++)
        {
            Network -> neurons[0][i].activation = data.trainIMG[imageNum][i];
        }
    }
}


void print_image(int imageNum, int isTesting)
{
    int i;

    for (i = 0; i < 784; i++)
    {   
        //Testing Image Selected
        if (isTesting == 1)
        {
            if (data.testIMG[imageNum][i] == 0.0)
            {
                printf("    ");
            }
            else
            {
                printf("%1.1f ", data.testIMG[imageNum][i]);
            }
        }
        //Training Image Selected
        else
        {
            if (data.trainIMG[imageNum][i] == 0.0)
            {
                printf("    ");
            }
            else
            {
                printf("%1.1f ", data.trainIMG[imageNum][i]);
            }
        }

        if ((i + 1) % 28 == 0)
        {
            printf("\n");
        }
    }

    printf("%s_IMG[%d] label: %d\n", 
        (isTesting == 1 ? "TEST" : "TRAIN"), 
        imageNum, 
        (isTesting == 1 ? data.testLABEL[imageNum] : data.trainLABEL[imageNum]));
}


void print_expected_output(int imageNum, int isTesting)
{
    int i; 
    int imgLabel = (isTesting == 1 ? data.testLABEL[imageNum] : data.trainLABEL[imageNum]);

    printf("\nImage: %d, Label: %d\nExpected Output:\n", imageNum, imgLabel);
    
    for (i = 0; i < 10; i++)
    {
        if (i != imgLabel)
        {
            printf("L:%d N:%-3d A:%-2lf B:%-2lf\n", 3, i, (double)0, (double)0);
        }
        else if (i == imgLabel)
        {
            printf("L:%d N:%-3d A:%-2lf B:%-2lf\n", 3, i, (double)1, (double)0);
        }
    }
}

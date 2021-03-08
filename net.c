#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "net.h"


void load_random_inputs(NET Network)
{
    int j;
    for (j = 0; j < Network.NPL[0]; j++)
    {
        //Random double 0 -> 1
        Network.neurons[0][j].activation = (double)rand() / (double)RAND_MAX;
    }
}

void print_output_layer(NET Network)
{
    int i;

    printf("\nOUTPUT:\n\n");
    for (i = 0; i < Network.NPL[Network.layers - 1]; i++)
    {
        printf("L:%d N:%-3d A:%-2lf B:%-2lf\n", 
            (Network.layers - 1), i, 
            Network.neurons[Network.layers - 1][i].activation, 
            Network.neurons[Network.layers - 1][i].bias);
    }
}


void print_entire_network(NET Network)
{
    int i, j;

    printf("\nNEURONS:\n\n");
    for (i = 0; i < Network.layers; i++)
    {
        for (j = 0; j < Network.NPL[i]; j++)
        {
            printf("L:%d N:%-3d A:%-2lf B:%-2lf\n", 
                i, j, 
                Network.neurons[i][j].activation, 
                Network.neurons[i][j].bias);
        }

        printf("\n");
    }

    int neuronFrom, neuronTo;

    printf("\nWEIGHTS:\n\n");
    for (i = 0; i < Network.layers - 1; i++)
    {
        for (j = 0; j < (Network.NPL[i] * Network.NPL[i + 1]); j++)
        {
            neuronFrom = (j / Network.NPL[i + 1]);
            neuronTo   = (j % Network.NPL[i + 1]);

            if (j > 0 && neuronTo == 0)
            {
                printf("-\n");
            }

            printf("( L:%d N:%-3d  --[W:%10lf]->  L:%d N:%-2d )\n", 
                i, neuronFrom, 
                Network.weights[i][j], 
                (i + 1), neuronTo);
        }

        printf("***\n");
    }
}


NET create_network(NET Network, int LAYERS, int neuronsPerLayer[])
{
    Network.layers = LAYERS;
    Network.NPL = set_NPL_array(LAYERS, neuronsPerLayer);
    Network.neurons = create_neurons(LAYERS, neuronsPerLayer);
    Network.weights = create_weights(LAYERS, neuronsPerLayer);
    return Network;
}


int* set_NPL_array(int LAYERS, int neuronsPerLayer[])
{
    int x;
    int* temp;

    temp = (int*)malloc((unsigned long)LAYERS * sizeof(int));
    for (x = 0; x < LAYERS; x++)
    {
        temp[x] = neuronsPerLayer[x];
    }

    return temp;
}


Neuron** create_neurons(int LAYERS, int neuronsPerLayer[])
{
    int x;
    Neuron** temp;

    temp = (Neuron**)malloc((unsigned long)LAYERS * sizeof(Neuron*));
    for (x = 0; x < LAYERS; x++)
    {
        temp[x] = (Neuron*)malloc((unsigned long)neuronsPerLayer[x] * sizeof(Neuron));
    }

    return temp;
}


double** create_weights(int LAYERS, int neuronsPerLayer[])
{
    int x;
    double** temp;

    temp = (double**)malloc((unsigned long)(LAYERS - 1) * sizeof(double*));
    for (x = 0; x < LAYERS - 1; x++)
    {
        int numWeights = (neuronsPerLayer[x] * neuronsPerLayer[x + 1]);
        temp[x] = (double*)malloc((unsigned long)numWeights * sizeof(double));
    }

    return temp;
}


void initialize_network_values(NET Network)
{
    initialize_neuron_values(Network.neurons, Network.layers, Network.NPL);
    initialize_weight_values(Network.weights, Network.layers, Network.NPL);
}


void initialize_neuron_values(Neuron** neurons, int LAYERS, int neuronsPerLayer[])
{
    int i, j;
    for (i = 0; i < LAYERS; i++)
    {
        for (j = 0; j < neuronsPerLayer[i]; j++)
        {
            neurons[i][j].activation = 0;
            neurons[i][j].bias = 0;
        }
    }
}


void initialize_weight_values(double** weights, int LAYERS, int neuronsPerLayer[])
{
    int i, j, neuronsOut, neuronsIn;
    double xInit;

    for (i = 0; i < LAYERS - 1; i++)
    {
        neuronsOut = (neuronsPerLayer[i] * neuronsPerLayer[i + 1]);

        if (i == 0) {
            neuronsIn = 0;
        }
        else {
            neuronsIn = (neuronsPerLayer[i - 1] * neuronsPerLayer[i]);
        }

        xInit = sqrt(6) / sqrt(neuronsIn + neuronsOut);
        
        printf("xavierInit LAYER[%d -> %d]: (%lf <=> %lf)\n", 
            i, (i + 1), 
            -(xInit), xInit);
        
        for (j = 0; j < (neuronsPerLayer[i] * neuronsPerLayer[i + 1]); j++)
        {
            weights[i][j] = (xInit + xInit) * ((double)rand() / (double)RAND_MAX) - xInit;
        }
    }
}


void free_network(NET Network)
{
    free_NPL_array(Network.NPL);
    free_neurons(Network.neurons, Network.layers);
    free_weights(Network.weights, Network.layers);
}


void free_NPL_array(int* NPLArray)
{
    free(NPLArray);
    return;
}


void free_neurons(Neuron** neurons, int LAYERS)
{
    int i;
    for (i = 0; i < LAYERS; i++)
    {
        free(neurons[i]);
    }

    free(neurons);
    return;
}


void free_weights(double** weights, int LAYERS)
{
    int i;
    for (i = 0; i < LAYERS - 1; i++)
    {
        free(weights[i]);
    }

    free(weights);
    return;
}

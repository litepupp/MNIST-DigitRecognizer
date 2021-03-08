#ifndef NET_H_
#define NET_H_

typedef struct Neuron
{
    double activation;
    double bias;
} Neuron;

typedef struct NET
{
    int layers;
    int* NPL;
    Neuron** neurons;
    double** weights;
} NET;

void load_random_inputs(NET Network);

void print_entire_network(NET Network);
void print_output_layer(NET Network);

NET create_network(NET Network, int LAYERS, int neuronsPerLayer[]);
int* set_NPL_array(int LAYERS, int neuronsPerLayer[]);
Neuron** create_neurons(int LAYERS, int neuronsPerLayer[]);
double** create_weights(int LAYERS, int neuronsPerLayer[]);

void initialize_network_values(NET Network);
void initialize_neuron_values(Neuron** neurons, int LAYERS, int neuronsPerLayer[]);
void initialize_weight_values(double** weights, int LAYERS, int neuronsPerLayer[]);

void free_network(NET network);
void free_NPL_array(int* NPLArray);
void free_neurons(Neuron** neurons, int LAYERS);
void free_weights(double** weights, int LAYERS);

#endif

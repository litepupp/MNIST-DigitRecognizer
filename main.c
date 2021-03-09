#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "net.h"
#include "math.h"


//28 x 28 Pixel Image (784, 16, 16, 10)

int main()
{
    int neuronsPerLayer[] = {784, 16, 16, 10};
    int LAYERS = 4;

    //test

    srand(time(NULL));

    NET testNetwork;

    testNetwork = create_network(testNetwork, LAYERS, neuronsPerLayer);
    initialize_network_values(testNetwork);
    
    load_random_inputs(testNetwork);

    //print_entire_network(testNetwork);

    forward_propagation(testNetwork);

    print_output_layer(testNetwork);

    free_network(testNetwork);

    return 0;
}

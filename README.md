## Steps

To view how the code is structured - 

1. Open [adier_PDE.m](#adier) file. It contains the code required to automate the construction of all the boundary conditions needed for a 1D heat-equation problem.
2. The functions check4, check3 and check2 inside adier_PDE.m are required to convert the constructed equations into a MATLAB-understandable format.
3. The function [eqn_gen.m](eqn_gen) is used to compute the equations. Comments are present for each equation, and its corresponding computation. Taking time as the second axis, we have used a different "h" value for each dimension, so as to counter high dimensionality. 
4. The code thus constructed, is saved as a .txt file (output.txt), which will be generated once adier_PDE.m is run.
5. Now, we come to the implementation part. Inside the solverPDE.m file, the generated equations are copied at added as 7 inequality constraints (1 inequality constraint, 3 equality contraints - implemented as 6 inequality constraints).
6. The reason we are copying the equations and not automating is becuase of the way the code was originally written, and how automating this process would introduce a lot of lag.
7. To run the program , runnerMSA.m is run, which activates parallel processing (72 cores, on the server).
8. The solverPDE.m file is run. It asks for dimensions x - (set as 127, computed based on the h values), and u - (which is 2, owing to 1 space + 1 time dimension). The lower and upper bounds can be set as 0 to 1. Lastly, it asks for the exploration variable and step-size, as part of SwiftNav.
9. The solverPDE.m runs the CSIP_Solver_PDE.m, which in turn runs out_max2.m and ws3.m (implementing Walekr-slice).

## adier_PDE

We construct the following problem - 

![p1](https://github.com/user-attachments/assets/031a7f3b-b88e-40cd-8443-d91d0b21b5b5)

## eqn_gen

The file eqn_gen.m is used to customize the settings (and the fineness of the "h" parameter). We can set the value of h, h2, and D in the following approximation formula -

![p2](https://github.com/user-attachments/assets/30e9f37d-b7ae-4497-bdb8-946b402492fa)



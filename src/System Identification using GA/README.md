## Identifying the System State-Space Matrix **A**

1. **Obtain Transfer Functions**  
   Use MATLAB’s *System Identification Toolbox* (`ident`) to estimate the transfer function between each measurable input and output of the system.  

2. **Formulate the Loss Function**  
   Construct a loss function by combining the symbolic transfer function (expressed in terms of the Laplace variable $s$) with the numerical transfer function obtained from system identification.
   
<img width="1613" height="387" alt="Diagram" src="https://github.com/user-attachments/assets/b326e539-941d-4b93-a6b4-c9a868014ec8" />

   The loss is defined as the difference between the symbolic coefficients (multiplied by $s$) and the corresponding identified numerical values (numerator and denominator terms).
   - **Script:** `EuclideanDistance.m`

3. **Optimize Using Genetic Algorithm**  
   Apply a Genetic Algorithm (GA) to optimize the unknown state-space parameters: [a<sub>11</sub>, a<sub>12</sub>, a<sub>13</sub>, a<sub>31</sub>, a<sub>33</sub>, a<sub>in</sub>]
   
  The GA evaluates candidate solutions by minimizing the defined loss, where the loss metric is the **Euclidean Distance** of the residual error vector between the symbolic and identified transfer function coefficients.
  - **Script:** `main.m`

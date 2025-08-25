## 📊 Results  
### 1-Analysis and Filtration of Motors' Encoders Signals
After analyzing the frequency spectrum of the wheel angular velocity signals—measured by the encoders—using the Fourier Transform, it was observed that significant frequency components exist at higher frequencies. This is clearly shown in the following figure, where a relatively large amplitude appears at **ω = π/2**  
<div align="center">
  <img width="457" height="324" alt="image" src="https://github.com/user-attachments/assets/5eb12369-651a-42ba-ace8-a73d0b33c8fa" />
</div>  
These high-frequency components introduce noise and oscillations into the signals.  

To mitigate this issue, an **Equiripple FIR filter** was designed with the following specifications:
- **Filter Type:** Lowpass FIR  
- **Design Method:** Equiripple  
- **Filter Order:** 42  
- **Passband Frequency (`wp`):** 0.031 (normalized 0–1)  
- **Stopband Frequency (`ws`):** 0.2 (normalized 0–1)  
- **Passband Ripple (`Apass`):** 1 dB  
- **Stopband Attenuation (`Astop`):** 120 dB  
- **Stability:** Yes (Direct-Form FIR)

<img width="1366" height="697" alt="FIR_Specs" src="https://github.com/user-attachments/assets/d2a698d8-0655-4310-ac56-e260bcf2c3ff" />

This configuration ensures the preservation of the DC component and its nearby frequency responses, while attenuating undesired higher frequencies.

The effect of the filter is evident in the results. After applying the designed Equiripple FIR filter to the original signal, the filtered output—shown in the following image—demonstrates a steadily increasing trend with significantly reduced oscillations, making it a more reliable feedback signal for the lookup control objective.
<div align="center">
<img width="462" height="354" alt="image" src="https://github.com/user-attachments/assets/75a089c2-5e80-462b-a9db-2e024183526f" />
</div>  
Furthermore, the frequency spectrum of the filtered signal confirms the successful suppression of high-frequency noise as follows:
<div align="center">
<img width="478" height="328" alt="image" src="https://github.com/user-attachments/assets/737f8496-ad11-4501-8dff-890e51f26673" />
</div>

### 2- Evaluating the Accuracy of System Identification optimized through Genetic Algorithm
<section>
  <p>
    A sequence of input step signals with varying amplitudes is applied independently to each motor
    (<i>V</i><sub>r</sub>, <i>V</i><sub>l</sub>) to record the mobile robot states
    [<i>w</i><sub>r</sub>, <i>w</i><sub>l</sub>, <i>i</i><sub>r</sub>, <i>i</i><sub>l</sub>]
    in response to these inputs.
  </p>

  <p>
    These input–output relationships are modeled using MATLAB’s
    <strong>System Identification Toolbox</strong>, ensuring that each identified transfer function
    matches its theoretically defined number of poles and zeros.
  </p>
  
  The figure below illustrates the **measured vs. identified responses** of right wheel angular velocity (<i>w</i><sub>r</sub>) in RPM to the right motor input voltage (<i>V</i><sub>r</sub>).
<img width="1080" height="343" alt="System_Identification" src="https://github.com/user-attachments/assets/0949fd87-ff27-43da-ad6f-2e5d10a79675" />


  <p>
    The <strong>objective function</strong> is defined as the Euclidean distance between:
  </p>
  <ul>
    <li>
      a reference vector <span><i>v</i> ∈ ℝ<sup>12</sup></span>, which collects all numerical terms produced by the system identification; and the equations obtained from substituting the six system variables.
  </ul>

  having an initial guess that lies within the vicinity of the optimal solution can significantly reduce the 
number of generations required and increase the likelihood of successfully reaching 
the global minimum. Luckily, this initial guess is taken to be a preliminary solution 
for the genetic algorithm from previous practical endeavors to find the interior parameters of the mechanical and electrical parts. Through this formulation, the **Genetic Algorithm (GA)** converges to an optimal solution. The GA’s hyperparameters are carefully preset and tuned to minimize the loss function, leading to a sharp decline that reaches the **lowest global minimum value of 0.1189 within 782 generations**, as shown in the following Table and figure: <br>
  <img width="1204" height="782" alt="Trainingpng" src="https://github.com/user-attachments/assets/44f74b49-1026-48fa-b1b8-90ed5fa9064f" />

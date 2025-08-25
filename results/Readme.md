## 📊 Results  

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

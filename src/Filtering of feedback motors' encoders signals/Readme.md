# Signal Noise Analysis and FIR Filtering

This section demonstrates how to identify and remove high-frequency noise from a sampled signal using MATLAB. The workflow involves:
---

## 1. Noise Detection Using FFT
To locate the source of noise in the signal, the raw signal is analyzed using its frequency spectrum. 
High-frequency components indicate the presence of noise.  

- **Script:** `Analysis_of_signal_frequency_spectrum.m`  
---
## 2. Design the Customized FIR filter

The FIR filter used in this project was designed using MATLAB's **Filter Design & Analysis Tool (fdatool)**. The design is customized to ensure the preservation of the DC component and its nearby frequency responses, while attenuating undesired higher frequencies.

---
## 3. FIR Filtering and Validation

Once the high-frequency noise is identified, an FIR filter is applied to the raw signal to remove unwanted components. The filtered signal is then validated in both time and frequency domains.  
- **Script:** `Applied_filter_validation.m`  
---
## Notes
- Replace `YourSampledSignalFile.txt` with your actual data file.  
- Replace `FilterObjectName` with the FIR filter object created using MATLAB’s Filter Designer.
- FFT plots use normalized frequency ranging from `-π` to `π` (rad/sample).  

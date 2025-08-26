<div align="center">

# Autonomous-3D-Mapping
![](https://img.shields.io/badge/v2014a-green?style=plastic&label=MATLAB&labelColor=black&color=blue)
![](https://img.shields.io/badge/V5R21-blue?style=plastic&logo=dassaultsystemes&label=CATIA&labelColor=rgba(13%2C%2014%2C%2087%2C%200.98)&color=blue)
![](https://img.shields.io/badge/v3.11-green?style=plastic&logo=python&label=Python3&labelColor=black&color=green)
![](https://img.shields.io/badge/noetic-green?style=plastic&logo=ROS&label=ROS&labelColor=blue&color=green)
![](https://img.shields.io/badge/v%202.3.6-green?style=plastic&logo=arduino&label=Arduino&labelColor=blue&color=green)

</div>
  
## Overview
This project presents the development, modeling, and experimental validation of an
autonomous end to end indoor 3D reconstruction system using a monocular camera-
equipped differential-drive mobile robot. The goal is to control the platform through
the environment on a predefined path to capture images of the scene, then implement
the 3D reconstruction pipeline to build a virtual 3D Model of the space. A comprehensive dynamic model of the robot—encompassing mechanical and
electrical subsystems—was identified using input-output experiments and refined
via genetic algorithm optimization. The work incorporates the usage of FIR filter to
remove the noise from feedback signals (such as Encoders). The control architecture
employs a cascaded scheme with a Lyapunov-based outer loop and LQR-based inner
loop. To optimize performance metrics like path accuracy and energy efficiency, a
Predictive Neural Network (PNN) was trained to map target positions to optimal
control gains (𝐾𝑝 , 𝐾𝜃), enabling real-time adaptive control.
For the 3D reconstruction part, the hierarchical localization pipeline is implemented
to build a 3D model of the environment form a set of captured images. Empirical
benchmarking identified DISK (feature extractor) and LightGlue (matcher) as the
optimal vision components. These are fed into a reconstruction pipeline using
COLMAP and OpenMVS, producing high-quality 3D models of indoor scenes.
The system is implemented on a Raspberry Pi–Arduino platform running ROS and
validated both in simulation and on a real robot. The robot autonomously navigates
pre-defined discretized paths and captures structured image arcs at predefined waypoints.
This end-to-end framework bridges control theory with practical computer vision,
demonstrating how low-cost mobile robots can autonomously map environments
with high spatial accuracy using only monocular vision and optimized motion
planning.
> **TL;DR**: End-to-end autonomous 3D reconstruction of indoor environment using DDWMR
## ✨ Key Features
+ Integrating neural network-optimized hybrid control system
+ Deploying the optimal feature extractor and matcher—DISK and LightGlue—for dense and accurate 3D point cloud generation.
+ Identifying the robot system using "System-Identification" optimized through Genetic Algorithm
+ Filtering the Feedback signals with customized filter (FIR) for reliable localization and control.
## Demo
This video shows the end-to-end autonomous 3D reconstruction Process
<div align="center">
  <video src="https://github.com/user-attachments/assets/662caa91-467a-4c62-9c5a-49453e5b212f" controls loop></video>
</div>
<p align="center">
  <table>
    <tr>
      <!-- Left big image -->
      <td rowspan="2" width="40%">
        <img src="https://github.com/user-attachments/assets/55900751-be20-40be-a148-f7c0440b624e" width="100%">
      </td>
      <!-- Top row, two small images -->
      <td width="26%">
        <img src="https://github.com/user-attachments/assets/096c45c2-9bc9-43c6-a107-1c5f101271f1" width="100%">
      </td>
      <td rowspan="2" width="34%">
        <img src="https://github.com/user-attachments/assets/03510057-2b9b-45db-9acf-d9cadb2f2c6f" width="100%">
      </td>
    </tr>
    <tr>
      <!-- Bottom row, two small images -->
      <td>
        <img src="https://github.com/user-attachments/assets/4cce0b84-d043-425a-957f-8ba96fe1a7a8" width="100%">
      </td>
    </tr>
  </table>
</p>

## Methodology

<div align="center">
  <img src="https://github.com/user-attachments/assets/889543d1-367c-475c-b36f-7b4da2a5b131" alt="Description" />
</div>

### 1. Setting the Discretized Path:
Since the control algorithm is designed for a stabilization task—e.i., guiding the robot from its initial position to a target location—the first step in our project should be to define a discretized path through the relevant environment.

### 2. Navigating through the environment:
This step focuses on navigating the robot through the environment to capture images of surrounding objects. The process is carried out using the control scheme described in the following repo "https://github.com/B-A-IntelliBots/AI-optimized-LQR-Lyapunov-Control-System".

### 3. 3D Reconstrution:
This step involves constructing a 3D virtual model of the indoor environment using images captured by the robotic platform. The reconstruction process employs the ***DISK* Feature Extractor** and ***LIGHTGLUE* Feature Matcher** to achieve a highly accurate and densely detailed final output. The choice of this feature extractor–matcher combination is based on extensive comparative analysis supported by statistical metrics, as detailed in the following repository "https://github.com/B-A-IntelliBots/3D-Reconstruction".

---

## 🚀 Quick Start
### Prerequisites
- OS/Tooling: `Python ≥3.10` / `MATLAB R2014a` / `ROS1 noetic` / `CATIA V5R21`
- System deps: `cmake`
### Installation

+ #### Clone the repository:
  `$ git clone https://github.com/B-A-IntelliBots/Autonomous-3D-Mapping.git 3d-mapping`
  
---

## 📊 Results & Benchmarks
the performance of the proposed **System State-Space Identification** method—using MATLAB’s *System Identification Toolbox* in combination with a Genetic Algorithm (GA)—is validated according to the following criteria:

#### 🔹 1. Loss / Error Metrics

Quantitative performance is evaluated using:  
- **Euclidean Loss** (custom-defined residual error distance)

| Model Type   | Euclidean Loss |
|--------------|----------------|
| GA-Optimized |    *0.1189*    |

#### 🔹 2. Computational Performance

- GA converged in **~[782] generations**  
- Execution time: **~[47 Sec]** on Intel i5 CPU
  
---

## 📁Project Structure
├── [src](https://github.com/B-A-IntelliBots/Autonomous-3D-Mapping/tree/main/src)/  # Core codes with the robot CATIA-designed components <br>
├── [data](https://github.com/B-A-IntelliBots/Autonomous-3D-Mapping/tree/main/data)/ # Sample datasets <br>
├── [results](https://github.com/B-A-IntelliBots/Autonomous-3D-Mapping/tree/main/results)/    # Plots and evaluation metrics <br>
├── README.md   # This file <br>

---

## 📖 Citation

```bibtex
@software{myproject2025,
  author    = {Ali Deeb, Bisher Alsaleh}, Supervised by: {Prof. Iyad Hatem}
  title     = {Autonomous 3D Mapping},
  year      = {2025},
  publisher = {GitHub},
  url       = {https://github.com/B-A-IntelliBots/Autonomous-3D-Mapping}
}

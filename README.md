
# Autonomous-3D-Mapping
This project presents the development, modeling, and experimental validation of an
autonomous end to end indoor 3D reconstruction system using a monocular camera-
equipped differential-drive mobile robot. The goal is to control the platform through
the environment on a predefined path to capture images of the scene, then implement
the 3D reconstruction pipeline to build a virtual 3D Model of the space. The system
integrates hybrid control strategies, system identification, and machine learning with
a robust vision pipeline to generate dense, textured 3D models of indoor
environments.
A comprehensive dynamic model of the robot—encompassing mechanical and
electrical subsystems—was identified using input-output experiments and refined
via genetic algorithm optimization. The work incorporates the usage of FIR filter to
remove the nose from feedback signals (such as Encoders). The control architecture
employs a cascaded scheme with a Lyapunov-based outer loop and LQR-based inner
loop. To optimize performance metrics like path accuracy and energy efficiency, a
Predictive Neural Network (PNN) was trained to map target positions to optimal
control gains (𝐾𝑝 , 𝐾𝜃), enabling real-time adaptive control.
For the 3D reconstruction part, the hierarchical localization pipeline is implemented
to build a 3D model of the environment form a set of captured images. Empirical
benchmarking identified DISK (feature extractor) and LightGlue (matcher) as the
optimal vision components. These feed into a reconstruction pipeline using
COLMAP and OpenMVS, producing high-quality 3D models of indoor scenes.
The system is implemented on a Raspberry Pi–Arduino platform running ROS and
validated both in simulation and on a real robot. The robot autonomously navigates
discretized paths and captures structured image arcs at predefined waypoints.
This end-to-end framework bridges control theory with practical computer vision,
demonstrating how low-cost mobile robots can autonomously map environments
with high spatial accuracy using only monocular vision and optimized motion
planning.
This video shows the end-to-end autonomous 3D reconstruction Process
## Demo Video
https://github.com/user-attachments/assets/662caa91-467a-4c62-9c5a-49453e5b212f
## Project Pipeline
![](https://github.com/user-attachments/assets/889543d1-367c-475c-b36f-7b4da2a5b131)
### 1. Setting the Discetized Path:
Since the control algorithm is designed for a stabilization task—that is, guiding the robot from its initial position to a target location—the first step in our project should be to define a discretized path through the relevant environment.
### 2. Navigating through the environment:
This step focuses on navigating the robot through the environment to capture images of surrounding objects. The process is carried out using the control scheme described in https://DSFCHIMERJDS.com.

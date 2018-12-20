# DDoSAttackDetection
This repository consists of data collected and algorithm implemented on the testbed setup in SIS Lab, at the University of South Florida.

The purpose of this implementation was to test our Intrusion Detection System using a new anomaly detection algorithm called <b>Online Discrepany Test (ODIT) </b>. It has been proved that given sufficient data, ODIT performs asymptotically to the clairvoyant CUSUM algorithm and outperforms the more practical Generalized CUSUM (G-CUSUM) algorithm. 

<h2> Testbed Setup </h2>
The testbed setup consists of 15 devices namely a computer, a tablet, 7 Node MCUs, 4 Smart Switches, an Amazon Show device and a security camera. The devices with their respective Ip addresses are listed below:

1. Computer - Alienware - 10.42.0.215
2. Tablet - Microsoft Surface - 10.42.0.39
3. Node MCU 1 - 10.42.0.38
4. Node MCU 2 - 10.42.0.77
5. Node MCU 3 - 10.42.0.79
6. Node MCU 4 - 10.42.0.14
7. Node MCU 5 - 10.42.0.93
8. Node MCU 6 - 10.42.0.103
9. Node MCU 7 - 10.42.0.106
10. Smart Switch 1 - 10.42.0.111
11. Smart Switch 2 - 10.42.0.92
12. Smart Switch 3 - 10.42.0.98
13. Smart Switch 4 - 10.42.0.167
14. Amazon Show - 10.42.0.107
15. Security Camera - 10.42.0.29

Along with these devices, we also have a Raspberry Pi 3 which acts as a server. The Ip address of Raspberry Pi is 10.42.0.36.

<h2> Attacks </h2>

We implement three of the most commonly seen DDoS attacks, namely a Low Rate TCP Flooding Attack, a Low Rate ICMP Flooding attack and a High Rate UDP Flooding attack. 

The data is in the form of Wireshark capture, from which additional information can be extracted based on the implementation. In this particular implementation, ODIT extracts the number of packets per second from each device as the input data. 

<h2> Implementation Video </h2>

The implementation video can be viewed <a href="url">here</a>.

<h2> Citation </h2>

To cite ODIT, please refer the below paper.
Yilmaz, Yasin. "Online nonparametric anomaly detection based on geometric entropy minimization." Information Theory (ISIT), 2017 IEEE International Symposium on. IEEE, 2017.


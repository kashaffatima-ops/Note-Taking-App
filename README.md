## 🚦 Data Traffic

The primary focus of **congestion control** is to avoid traffic congestion, while **quality of service (QoS)** aims to create a suitable environment for data traffic. Key aspects include traffic descriptors and traffic profiles.

### Traffic Descriptor

A **traffic descriptor** defines the characteristics of the data traffic.

![Traffic descriptor graph showing data rate over time](https://api-turbo.ai/3febe322-a80e-41b5-a8de-a303fe2193f6/0df905fd-3c02-4b8a-a070-5ab0c2649dd1.jpeg)

The figure illustrates key traffic parameters:

*   **Peak data rate**: The maximum rate at which data is transmitted.
*   **Average data rate**: The average rate of data transmission over a period.
*   **Maximum burst size**: The maximum amount of data sent at the peak rate.

### Traffic Profiles

Different applications generate different traffic patterns, and these can be categorized into traffic profiles:

![Three graphs of traffic profiles over time](https://api-turbo.ai/3febe322-a80e-41b5-a8de-a303fe2193f6/0f121bbd-1105-4e5f-bb55-4b034fef12a6.jpeg)

*   **Constant Bit Rate (CBR)**: Data rate remains constant over time.
*   **Variable Bit Rate (VBR)**: Data rate fluctuates over time.
*   **Bursty Data**: Data is transmitted in short, intermittent bursts.

## 🚧 Congestion

**Congestion** occurs when the load on the network (number of packets sent) exceeds the network's capacity (number of packets the network can handle). **Congestion control** involves mechanisms to manage congestion and keep the load within the network's capacity.

### Network Performance

Congestion significantly impacts network performance.

![Flowchart showing queues in a router](https://api-turbo.ai/3febe322-a80e-41b5-a8de-a303fe2193f6/d447113f-a952-4577-8140-4f9ad1243748.jpeg)

Routers use **queues** to manage incoming and outgoing packets. When the arrival rate exceeds the processing rate, queues build up, leading to increased delay and potential packet loss.

![Graph showing packet delay and throughput as functions of load](https://api-turbo.ai/3febe322-a80e-41b5-a8de-a303fe2193f6/4a665013-0b85-441b-b28f-c795a02432c1.jpeg)
![Graph showing load and throughput](https://api-turbo.ai/3febe322-a80e-41b5-a8de-a303fe2193f6/3423ab94-3cc5-4d54-9542-351cc605d1ad.jpeg)

These graphs illustrate the relationship between load, delay, and throughput:

*   **Delay**: As the load increases beyond the network's capacity, the delay increases sharply.
*   **Throughput**: Throughput increases with load up to a point, after which it decreases due to congestion.

## 🛡️ Congestion Control

**Congestion control** techniques aim to prevent or remove congestion. These mechanisms are categorized into:

*   **Open-loop congestion control (prevention)**: Prevents congestion before it occurs.
*   **Closed-loop congestion control (removal)**: Alleviates congestion after it has occurred.

![Flowchart of congestion control categories](https://api-turbo.ai/3febe322-a80e-41b5-a8de-a303fe2193f6/bd58427d-8d03-41ff-9c12-318626ecdd58.jpeg)

### Open-Loop Congestion Control

Open-loop congestion control policies include:

*   Retransmission policy
*   Window policy
*   Acknowledgment policy
*   Discarding policy
*   Admission policy

### Closed-Loop Congestion Control

Closed-loop congestion control policies include:

*   **Back Pressure**: A congested node informs upstream nodes to reduce their sending rate.

    ![Network diagram illustrating backpressure method](https://api-turbo.ai/3febe322-a80e-41b5-a8de-a303fe2193f6/43e26254-04d8-4de7-8e64-2af958fe3a15.jpeg)

    As illustrated, congestion at node III causes backpressure to propagate backwards through the network.
*   **Choke Packet**: A congested node sends a choke packet to the source, instructing it to reduce its sending rate.

    ![Network diagram illustrating choke packet](https://api-turbo.ai/3febe322-a80e-41b5-a8de-a303fe2193f6/ed6c8eb4-b80b-4876-97f2-f2f8a680e0e3.jpeg)

    As shown, node III detects congestion and sends a choke packet back to the source.
*   Implicit Signaling
*   Explicit Signaling

## 🧪 Examples of Congestion Control

### Congestion Control in TCP

TCP uses a combination of algorithms to manage congestion:

*   **Slow Start**: The congestion window size increases exponentially until it reaches a threshold.

    ![Diagram illustrating slow start and exponential increase](https://api-turbo.ai/3febe322-a80e-41b5-a8de-a303fe2193f6/fa403829-f792-43eb-81ac-5a29ab878d10.jpeg)

    In slow start, the congestion window (`cwnd`) increases exponentially until it reaches the slow start threshold (`ssthresh`).
*   **Congestion Avoidance**: The congestion window size increases additively until congestion is detected.

    ![Diagram illustrating congestion avoidance and additive increase](https://api-turbo.ai/3febe322-a80e-41b5-a8de-a303fe2193f6/f445af41-c43c-4d37-a417-3d29433d4d7e.jpeg)

    In congestion avoidance, the congestion window (`cwnd`) increases additively until congestion is detected.
*   **Congestion Detection**: TCP reacts to congestion in the following ways:
    *   **Timeout**: A new slow start phase begins.
    *   **Three ACKs**: A new congestion avoidance phase begins.

![Flowchart of TCP congestion policy summary](https://api-turbo.ai/3febe322-a80e-41b5-a8de-a303fe2193f6/c295aa0d-0d2d-473f-931a-488d59712091.jpeg)

The flowchart summarizes the TCP congestion control algorithm.

![Graph illustrating TCP congestion example](https://api-turbo.ai/3febe322-a80e-41b5-a8de-a303fe2193f6/3866ec7b-2e62-46f0-a6eb-370c4150d990.jpeg)

The graph illustrates the behavior of the congestion window (`cwnd`) over time, showing slow start (SS), additive increase (AI), and multiplicative decrease (MD) phases.

### Congestion Control in Frame Relay

Frame Relay uses explicit congestion notification:

*   **Backward Explicit Congestion Notification (BECN)**: A bit set in a frame to notify the sender of congestion.

    ![Network diagram illustrating BECN](https://api-turbo.ai/3febe322-a80e-4175-476a-ae58-051eb377f07b.jpeg)

    BECN informs the sender about congestion in the network.
*   **Forward Explicit Congestion Notification (FECN)**: A bit set in a frame to notify the receiver of congestion.

    ![Network diagram illustrating FECN](https://api-turbo.ai/3febe322-a8e2-44c9-808c-504c444dce63.jpeg)

    FECN informs the receiver about congestion in the network.

![Diagram illustrating four cases of congestion in Frame Relay](https://api-turbo.ai/3febe322-a80e-41e-9c5c-06c35aeb5006.jpeg)

The diagram illustrates how FECN and BECN values are updated in response to changing congestion conditions.

## ✨ Quality of Service (QoS)

> Quality of Service (QoS) is an internetworking issue that defines the characteristics a flow seeks to attain.

### Flow Characteristics

![Flowchart of flow characteristics](https://api-turbo.ai/3febe322-3de2-468d-95ef-6453ec0ddb87.jpeg)

Key characteristics of flow include:

*   Reliability
*   Delay
*   Jitter
*   Bandwidth

### Flow Classes

Flows can be categorized into different classes based on their QoS requirements.

## 🛠️ Techniques to Improve QoS

Several techniques can be used to improve QoS:

*   Scheduling
*   Traffic Shaping
*   Admission Control
*   Resource Reservation

### Scheduling

Scheduling algorithms determine the order in which packets are processed.

*   **FIFO (First-In-First-Out) Queueing**: Packets are processed in the order they arrive.

    ![Flowchart illustrating FIFO queue](https://api-turbo.ai/3febe322-7b1f-4216-9667-ab7c0e4fab07.jpeg)
*   **Priority Queueing**: Packets are assigned priorities, and higher-priority packets are processed first.

    ![Flowchart illustrating priority queueing](https://api-turbo.ai/3febe322-47dc-47d7-adb7-a4e917f79622.jpeg)
*   **Weighted Fair Queueing**: Each flow is assigned a weight, and packets are processed based on these weights.

    ![Flowchart illustrating weighted fair queueing](https://api-turbo.ai/3febe322-76d5-489c-a371-e16ecc6a2fe8.jpeg)

### Traffic Shaping

Traffic shaping techniques regulate the rate of data transmission.

*   **Leaky Bucket**: Shapes bursty traffic into fixed-rate traffic by averaging the data rate. It may drop packets if the bucket is full.

    ![Diagram illustrating leaky bucket](https://api-turbo.ai/3febe322-1300-4bdd-bfb7-85445e5e5fe9.jpeg)
    ![Flowchart illustrating leaky bucket implementation](https://api-turbo.ai/3febe322-807f-4359-b19d-d95154d138ce.jpeg)
*   **Token Bucket**: Allows bursty traffic at a regulated maximum rate.

    ![Diagram illustrating token bucket](https://api-turbo.ai/3febe322-2f69-496b-97fc-233715e75af5.jpeg)

### Admission Control

Admission control prevents new flows from entering the network if they would cause congestion.

### Resource Reservation

Resource reservation allocates specific resources to flows to guarantee QoS.

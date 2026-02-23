# 🛰️ Network Slicing in Satellite Systems for RAN (5G NR / NTN)

> Developed as part of my Master's coursework in Satellite Communications at Cleveland State University (2024–2025).  
> Documented here to showcase system design, simulation methodology, and performance results.

---

## 📌 Project Overview

This project designs and simulates a **5G NR Network Slicing architecture** applied to **Non-Terrestrial Networks (NTN)** — specifically satellite-based Radio Access Networks (RAN). Network slicing allows a single physical satellite network to be logically divided into multiple independent virtual networks, each optimized for a different type of service.

**Three service classes were implemented and evaluated:**

| Slice | Full Name | Use Case |
|-------|-----------|----------|
| eMBB | Enhanced Mobile Broadband | HD video streaming, high-speed data |
| mMTC | Massive Machine-Type Communications | IoT sensors, smart devices |
| URLLC | Ultra-Reliable Low-Latency Communications | Critical control, remote operations |

**Core Research Question:** How can limited satellite spectrum and resources be dynamically allocated across eMBB, mMTC, and URLLC slices while meeting each slice's QoS requirements under NTN constraints?

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| MATLAB | System simulation, resource allocation modeling, performance evaluation |
| MATLAB Toolboxes | Communications Toolbox, Signal Processing Toolbox |
| 3GPP 5G NR Standards | Slice architecture and numerology reference (TR 38.821) |
| NTN Channel Model | Satellite propagation delay and link budget modeling |

---

## 🏗️ System Architecture

```
┌─────────────────────────────────────────────────────────┐
│                   SATELLITE NODE (gNB-like)              │
│                                                          │
│   ┌──────────┐   ┌──────────┐   ┌──────────────────┐   │
│   │  eMBB    │   │  mMTC    │   │     URLLC        │   │
│   │  Slice   │   │  Slice   │   │     Slice        │   │
│   │(High BW) │   │(Low BW,  │   │  (Low latency,   │   │
│   │          │   │ massive) │   │   high reliability│   │
│   └────┬─────┘   └────┬─────┘   └────────┬─────────┘   │
│        │              │                   │              │
│   ┌────▼──────────────▼───────────────────▼─────────┐   │
│   │         Virtualized RAN (vRAN) Layer             │   │
│   │      Resource Allocation & Spectrum Sharing      │   │
│   └─────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────┘
                         │
              Satellite Link (NTN)
              Propagation Delay: ~600ms (LEO) / ~250ms (MEO)
                         │
                  ┌──────▼──────┐
                  │  User Terminal│
                  └─────────────┘
```

---

## 🔬 Methodology

### Step 1 — Slice Architecture Design
- Defined three logical slices (eMBB, mMTC, URLLC) with distinct QoS profiles
- Assigned priority weights, bandwidth guarantees, and latency budgets per slice
- Based architecture on 3GPP TR 38.821 NTN specifications

### Step 2 — Resource Allocation Algorithm
- Implemented dynamic spectrum sharing between slices using MATLAB
- Designed a priority-based scheduler: URLLC > eMBB > mMTC under congestion
- Applied bandwidth partitioning with minimum guaranteed resource blocks (RBs) per slice

### Step 3 — NTN Channel Modeling
- Modeled satellite propagation delay (LEO and GEO orbits)
- Applied free-space path loss and rain fade margin to link budget
- Simulated Doppler shift compensation for LEO satellite pass

### Step 4 — Performance Evaluation
- Measured throughput, packet loss rate, and latency per slice under varying load
- Compared performance with and without slicing (baseline = no isolation)
- Evaluated system under NTN constraints (high delay, limited bandwidth)

---

## 📊 Results

<!-- Replace with your actual simulation results and plots -->

### Throughput per Slice

| Load Condition | eMBB Throughput | mMTC Throughput | URLLC Throughput |
|----------------|-----------------|-----------------|------------------|
| Low (25%)      | [your value] Mbps | [your value] Kbps | [your value] Mbps |
| Medium (60%)   | [your value] Mbps | [your value] Kbps | [your value] Mbps |
| High (90%)     | [your value] Mbps | [your value] Kbps | [your value] Mbps |

### Latency per Slice

| Slice  | Target Latency | Measured Latency | Met? |
|--------|---------------|------------------|------|
| eMBB   | < 100ms       | [your value]     | ✅/❌ |
| mMTC   | < 1000ms      | [your value]     | ✅/❌ |
| URLLC  | < 10ms        | [your value]     | ✅/❌ |

> 📈 **Add your MATLAB simulation plots here**  
> Suggested plots to include:
> - Throughput vs. Network Load (3 lines, one per slice)
> - Latency CDF per slice
> - Resource Block allocation over time
>
> Example: `![Throughput vs Load](images/throughput_vs_load.png)`

**Key Finding:** [Write 2–3 sentences summarizing your main result — e.g., "The proposed slicing architecture successfully isolated URLLC traffic from eMBB and mMTC under high network load, maintaining latency below X ms. Without slicing, URLLC latency exceeded the 10ms threshold at loads above Y%."]

---

## 📁 Repository Structure

```
Network-Slicing-Satellite-RAN/
│
├── matlab/
│   ├── main_simulation.m            # Entry point — runs full simulation
│   ├── slice_architecture.m         # Slice definitions and QoS parameters
│   ├── resource_allocator.m         # Dynamic spectrum sharing algorithm
│   ├── ntn_channel_model.m          # Satellite link budget and delay model
│   ├── performance_evaluator.m      # Throughput, latency, packet loss metrics
│   └── plot_results.m               # Visualization of all results
│
├── results/
│   └── [your exported .mat result files]
│
├── images/
│   └── [your MATLAB plots as .png screenshots]
│
├── docs/
│   └── system_design.pdf            # Optional: your project report or slides
│
└── README.md
```

> 📝 *Rename files to match your actual MATLAB script names before uploading.*

---

## ▶️ How to Run

### Requirements
- MATLAB R2022a or later
- Communications Toolbox
- Signal Processing Toolbox

### Steps
```matlab
% 1. Clone or download this repository
% 2. Open MATLAB and navigate to the /matlab folder
% 3. Run the main simulation:
run('main_simulation.m')

% 4. To visualize results separately:
run('plot_results.m')

% Parameters can be adjusted at the top of main_simulation.m:
%   - NUM_USERS per slice
%   - BANDWIDTH_MHZ total available spectrum
%   - ORBIT_TYPE ('LEO' or 'GEO')
%   - LOAD_LEVEL (0.0 to 1.0)
```

---

## 💡 Key Learnings

- Gained deep understanding of **3GPP 5G NR network slicing** concepts and how they apply to non-terrestrial networks
- Learned how **NTN-specific constraints** (high propagation delay, Doppler shift, limited spectrum) challenge standard terrestrial 5G designs
- Designed and implemented a **priority-based resource scheduler** that balances competing QoS requirements across service classes
- Strengthened MATLAB skills for **complex system simulation and multi-variable performance analysis**
- Understood the trade-offs between **spectral efficiency and service isolation** in virtualized RAN environments

---

## 🔭 Future Improvements

- [ ] Extend to multi-satellite (constellation) scenario with inter-satellite handover
- [ ] Implement machine learning-based dynamic resource allocation
- [ ] Add GEO vs. LEO vs. MEO performance comparison
- [ ] Simulate interference between adjacent satellite beams
- [ ] Validate against real NTN measurement datasets (e.g., ESA or NASA open data)

---

## 📚 References

- 3GPP TR 38.821 — *Solutions for NR to support Non-Terrestrial Networks*
- 3GPP TS 28.530 — *Management of network slicing in mobile networks*
- Lin, X. et al. — *"5G New Radio: Unveiling the Essentials of the Next Generation Wireless Access Technology"* — IEEE Communications Standards Magazine
- Rinaldi, F. et al. — *"Non-Terrestrial Networks in 5G & Beyond"* — IEEE Access (2020)
- Dr. Mehdi Rahmati, Satellite Communications


---

## 👩‍💻 Author

**Supriya Rayabandi**  
M.S. Electrical & Computer Engineering — Cleveland State University  
📧 rayabandisupriya2002@gmail.com  
🔗 [LinkedIn](https://linkedin.com/in/supriya-rayabandi) | [GitHub](https://github.com/supriya-rayabandi)

---

*⭐ If you found this project useful or are working on something similar, feel free to connect on LinkedIn!*

# 📡 SDR Modulation Analysis — BPSK & QPSK

> Developed as part of my Master's coursework in Modern Digital Communications at Cleveland State University (2024–2025).  
> Documented here to showcase technical implementation, results, and methodology.

---

## 📌 Project Overview

This project analyzes the performance of **BPSK (Binary Phase Shift Keying)** and **QPSK (Quadrature Phase Shift Keying)** modulation schemes using Software Defined Radio (SDR). The goal was to compare how each modulation technique performs under varying noise conditions and validate results against theoretical predictions.

**Key Question:** How does modulation order affect Bit Error Rate (BER) as Signal-to-Noise Ratio (SNR) changes in a real SDR environment?

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| MATLAB | Signal modeling, BER analysis, data visualization |
| GNU Radio | SDR flowgraph design and signal processing |
| USRP (Universal Software Radio Peripheral) | Hardware signal transmission and reception |
| BPSK / QPSK | Modulation schemes under analysis |

---

## 🔬 Methodology

1. **Signal Generation** — Generated baseband BPSK and QPSK signals in MATLAB/GNU Radio
2. **Channel Simulation** — Added AWGN (Additive White Gaussian Noise) at varying SNR levels (0 dB to 20 dB)
3. **Transmission** — Transmitted and received signals over USRP hardware
4. **Measurement** — Measured BER at each SNR point for both modulation schemes
5. **Analysis** — Compared measured BER curves against theoretical values

---

## 📊 Results

<!-- TIP: Replace this section with your actual graphs/screenshots -->

| SNR (dB) | BPSK BER (Measured) | QPSK BER (Measured) | Theoretical BPSK BER |
|----------|---------------------|---------------------|----------------------|
| 0        | [your value]        | [your value]        | 0.0786               |
| 5        | [your value]        | [your value]        | 0.0060               |
| 10       | [your value]        | [your value]        | 0.0000               |

> 📈 **Add your BER vs SNR plot here** — even a screenshot from MATLAB works great!  
> Example: `![BER vs SNR](images/ber_vs_snr.png)`

**Key Finding:** [Write 1–2 sentences about what your results showed — e.g., "BPSK outperformed QPSK at low SNR values, consistent with theoretical predictions, while QPSK achieved higher spectral efficiency at SNR above X dB."]

---

## 📁 Repository Structure

```
SDR-Modulation-Analysis/
│
├── matlab/
│   ├── bpsk_simulation.m       # BPSK signal generation and BER analysis
│   ├── qpsk_simulation.m       # QPSK signal generation and BER analysis
│   └── plot_ber_curves.m       # BER vs SNR visualization
│
├── gnuradio/
│   └── sdr_flowgraph.grc       # GNU Radio flowgraph for USRP transmission
│
├── images/
│   └── ber_vs_snr.png          # Result plots (add your screenshots here)
│
└── README.md
```

> 📝 *Update this structure to match your actual files before uploading.*

---

## ▶️ How to Run

### MATLAB Simulation
```matlab
% 1. Open MATLAB
% 2. Navigate to the /matlab folder
% 3. Run:
run('bpsk_simulation.m')
run('qpsk_simulation.m')
run('plot_ber_curves.m')
```

### GNU Radio (requires USRP hardware)
```
1. Open GNU Radio Companion
2. Load sdr_flowgraph.grc
3. Connect USRP hardware
4. Click Run
```

> ⚠️ USRP hardware is required for live transmission tests. MATLAB scripts run standalone without hardware.

---

## 💡 Key Learnings

- Gained practical understanding of how **modulation order trades off spectral efficiency vs. noise robustness**
- Validated that measured BER closely matches theoretical AWGN channel predictions
- Learned to configure and operate **USRP SDR hardware** with GNU Radio for real signal transmission
- Strengthened skills in **MATLAB signal processing and data visualization**

---

## 🔭 Future Improvements

- [ ] Extend analysis to higher-order modulations (8-PSK, 16-QAM)
- [ ] Test under fading channel models (Rayleigh, Rician)
- [ ] Add Python-based analysis scripts as an alternative to MATLAB
- [ ] Automate BER measurements across SNR sweep

---

## 👩‍💻 Author

**Supriya Rayabandi**  
M.S. Electrical & Computer Engineering — Cleveland State University  
📧 rayabandisupriya2002@gmail.com  
🔗 [LinkedIn](https://linkedin.com/in/supriya-rayabandi) | [GitHub](https://github.com/supriya-rayabandi)

---

## 📚 References

- Proakis, J. G. — *Digital Communications* (5th Ed.)
- GNU Radio Documentation: https://wiki.gnuradio.org
- Ettus Research USRP Documentation: https://www.ettus.com/support
- [Add your course name/professor if you'd like to credit the coursework]

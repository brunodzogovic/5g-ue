# 5G-UE emulator
Building Docker images emulate User Equipment from OpenAirInterface. The build scripts assigns a MACVLAN network, builds the UE software in a Docker container and runs the image

To pull the latest ready image from docker hub: `docker pull brunodzogovic/5g_ue`

To run the NR UE-Softmodem:
 
`/openairinterface/targets/bin./nr-uesoftmodem.Rel15 --numerology 1 --rfsim --sa -C 3619200000 --band 78 --C0 3 -r 106 --parallel-config PARALLEL_SINGLE_THREAD -O /openair
interface5g/ci-scripts/conf_files/ue.sa.conf` 

Where --numerology 1 refers to utilizing 5G calculations instead of 4G, --rfsim to run the UE in simulator mode, --sa for standalone-mode (NSA is used if the core network is 4G), --band is the frequency band (in this case N78), --C0 is the frequency offset for the uplink channel (0 = 0Khz, 1 = 30Khz, 2 = 60KHz and 3 = 120Khz), -r is the channel bandwidth (100 MHz in our case) and --parallel-config to run single-threaded process vs. CU/DU split in case we use option 7 split in the 5G RAN.

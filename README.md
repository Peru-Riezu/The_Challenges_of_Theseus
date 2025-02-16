# The Challenges of Theseus

A series of riddles that need be solved through terminal commands, designed to help people familiarize themselves with the command-line interface of GNU/Linux.

## Installation

The Challenges of Theseus are designed to be easily installed on any Debian-based GNU/Linux system. The system requires **17GB** of free storage and is optimized to run securely within the AWS Free Tier.

To install, clone the repository, run `make set_up` (which, among other things, installs all required packages via apt), and then run `make`. You must execute these commands as root or as a sudoer, and you may be prompted for your password. After installation, you can ssh into the first challenge.

    sudo apt install -y make git
    git clone https://github.com/Peru-Riezu/The_Challenges_of_Theseus.git
    cd The_Challenges_of_Theseus
    make set_up
    make

The Challenges of Theseus will automatically reconfigure the SSHD and Nginx services, so make a copy of the previous configuration of these services if you want to preserve them.

### Important Note About `check_network_quota.bash`

We include a script named `check_network_quota.bash` that keeps track of outbound data usage on your system. If the total outbound data exceeds 100 GB on the main network interface in any given month, the script brings that interface down, preventing charges under the AWS free tier.

- Since The Challenges of Theseus always launches containers with `--network=host`, the `docker0` interface is not used. The script looks for another interface (such as `enp1s0`, `eth0`, etc.) to monitor.  
- If you have more than one interface, make sure the script is monitoring the one that actually handles outbound traffic.  
- If the script disables the interface, you will lose the ability to ssh into the instance. You must then use the serial console to access the instance.  
- Debian is the only system where this script has been tested, so be sure to verify that it’s working as intended on other distributions.

## Usage

To ssh into the first challenge you can use the following command:

    sshpass -p piraten_bizitza_hoberena_da ssh labirintoaren_erdigunea@your-host

Replace `your-host` with the actual hostname or IP address (e.g., `localhost`, `192.168.122.157`).

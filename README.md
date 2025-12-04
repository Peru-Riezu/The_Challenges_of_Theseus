# The Challenges of Theseus

A series of riddles that need be solved through terminal commands, designed to help people familiarize themselves with the command-line interface of GNU/Linux. The text of the riddles can be set to be in Basque or English.

## Quick Start

You can start facing riddels instantly with the following commands:

- ~~For the **Basque version**~~ (the basque version is not currently available):
```bash
ssh labirintoaren_erdigunea@theseus.ecclesiad.net
```
using the password
```bash
piraten_bizitza_hoberena_da
```
- For the **English version**:
```bash
ssh center_of_the_labyrinth@english.theseus.ecclesiad.net
```
using the password
```bash
a_pirate_s_life_is_best
```

Keep in mind that, depending on your geographical location, the stability of your internet connection, and the number of connections the server is handling at that moment, you might experience high latency when using this method. To avoid this, we recommend installing The Challenges of Theseus on a local virtual machine.

You might also want to install sshpass in your local machine, to avoid having to type the password every time you log in to a challenge.

## Installation

The Challenges of Theseus is designed to be easily installed on any Debian-based GNU/Linux system. The system requires **17GB** of free storage and is optimized to run securely within the AWS Free Tier.

To install, clone the repository, run `make set_up` (which, among other things, installs all required packages via apt), and then run either `make english` or `make basque`. You must execute these commands as root or as a sudoer, and you may be prompted for your password. After installation, you can ssh into the first challenge.

    sudo apt install -y make git
    git clone https://github.com/Peru-Riezu/The_Challenges_of_Theseus.git
    cd The_Challenges_of_Theseus
    make set_up
    make basque # or make english

The Challenges of Theseus will automatically reconfigure the SSHD and Nginx services, so make a copy of the previous configuration of these services if you want to preserve them.

### Important Note About `check_network_quota.bash`

We include a script named `check_network_quota.bash` that keeps track of outbound data usage on your system. If the total outbound data exceeds 100 GB on the main network interface in any given month, the script brings that interface down, preventing charges under the AWS free tier.

- Since The Challenges of Theseus always launches containers with `--network=host`, the `docker0` interface is not used. The script looks for another interface (such as `enp1s0`, `eth0`, etc.) to monitor.  
- If you have more than one such interface, make sure the script is monitoring the one that actually handles outbound traffic.  
- If the script disables the interface, you will lose the ability to ssh into the instance through that interface. If that was the only interface through which you could ssh,
you must then use the serial console to access the instance.  
- Debian is the only system where this script has been tested, so be sure to verify that it’s working as intended on other distributions.

## Usage

To ssh into the first challenge of the **Basque version**, you can use the following command:

```bash
ssh labirintoaren_erdigunea@your-host
```
using the password
```bash
piraten_bizitza_hoberena_da
```

And to ssh into the first challenge of the **English version**, you can use the following command:
```bash
ssh center_of_the_labyrinth@your-host
```
using the password
```bash
a_pirate_s_life_is_best
```

Replace `your-host` with the actual hostname or IP address (e.g., `localhost`, `192.168.122.157`).

## Contact

If you have any questions, feel free to reach out via email at **[thechallengesoftheseus@gmail.com](mailto:thechallengesoftheseus@gmail.com)**.  

You can also use [GitHub Issues](https://github.com/Peru-Riezu/The_Challenges_of_Theseus/issues) to report bugs or request improvements. However, please use common sense, avoid opening issues for non-issues or unproductive feature requests.  

For questions or suggestions, email is the preferred channel of communication.


# The Challenges of Theseus

A series of riddles that need be solved through terminal commands, designed to help people grok the command-line interface of GNU/Linux.

## Installation

The Challenges of Theseus are designed to be easily installed on any Debian-based GNU/Linux system. The system requires **1GB of RAM** and **30GB of storage**, and it is optimized to run securely within the AWS Free Tier. To install, clone the repository and run `make set_up` followed by `make`. (You will need to run these commands as root or a sudoer, and you may be prompted for your password.) After installation, you can SSH into the first challenge.

```bash
sudo apt install -y make git
git clone https://github.com/Peru-Riezu/The_Challenges_of_Theseus.git
cd The_Challenges_of_Theseus
make set_up
make
```

The Challenges of Theseus will automatically reconfigure the SSHD and Nginx services, so make a copy of the previous configuration of these services if you want to preserve them.

Note as well that if you wish to host The Challenges of Theseus on an AWS instance and have chosen not to use Debian, you should check whether the 'check_network_quota.bash' script properly 
detects Docker's network interface.

## Usage

To ssh into the first challenge you can use the following command:

```bash
sshpass -p piraten_bizitza_hoberena_da ssh labirintoaren_erdigunea@your-host
```

Replace your-host with the actual hostname or IP address (e.g., localhost, 192.168.122.157).


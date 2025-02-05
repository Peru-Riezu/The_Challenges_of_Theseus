# The Challenges of Theseus

A series of riddles that need to be solved through terminal commands, designed to help people grok the command-line interface of GNU/Linux.

## Installation

The Challenges of Theseus are designed to be easily installed on any Debian-based GNU/Linux system. The system requires **1GB of RAM** and **30GB of storage**, and it is optimized to run securely within the AWS Free Tier. To install, clone the repository and run `make set_up` followed by `make`. (You will need to run these commands as root or a sudoer, and you may be prompted for your password.) After installation, you can SSH into the first challenge.

```bash
sudo apt install -y make git
git clone https://github.com/Peru-Riezu/The_Challenges_of_Theseus.git
cd The_Challenges_of_Theseus
make set_up
make
```
## Usage

To ssh into the first challenge you can use the following command:

```bash
ssh labirintoaren_erdigunea@your-host <<< 'piraten_bizitza_hoberana_da'
```

Replace your-host with the actual hostname or IP address (e.g., localhost, 192.168.122.2).


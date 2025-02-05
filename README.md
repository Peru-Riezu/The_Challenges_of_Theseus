# The Challenges of Theseus

A series of riddles that need be solved through terminal commands, to help people grok the command line interface of GNU/Linux.

## Installation

The Challenges of Theseus are made to be easily installable in any Debian-based GNU/Linux system (like Ubuntu for example). You only need to clone the repository and run `make set_up` and `make` (you will need to run these commands as root or as a sudoer, it may also prompt you for your password). After that, you will be ready to ssh into the first challenge.

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

Remember to change 'your-host' with the actual hostname or IP (e.g., localhost).



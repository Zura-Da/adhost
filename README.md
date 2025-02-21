# HTB Host Enumeration Script

This Bash script automates the process of adding a host to `/etc/hosts` and performing an Nmap scan on the specified IP address. It is designed to simplify host enumeration during penetration testing or network reconnaissance.

---

## **Features**
1. **Interactive Input**: If no arguments are provided, the script prompts the user to enter the IP address and hostname.
2. **Automatic IP Detection**: If the first argument contains the substring `10.10.`, it is treated as the IP address.
3. **Nmap Scans**:
   - Runs a standard Nmap scan with `-sC` (default scripts) and `-sV` (version detection).
   - Performs a full port scan (`-p-`) to enumerate all 65535 ports.
4. **Output Files**: Saves the Nmap scan results to `/home/kali/nmap/` with filenames based on the hostname.

---

## **Usage**

### **1. Interactive Mode**
If no arguments are provided, the script will prompt for the IP address and hostname:
```bash
(user㉿host)-[~] ./adhost.sh
add host IP: 10.10.10.5
add host name: example
```
### **2. Command-Line Mode**
You can provide the IP address and hostname as arguments:
```bash
(user㉿host)-[~] ./adhost.sh <IP> <Hostname>
```
  -If the first argument contains 10.10., it is treated as the IP address.

  -Otherwise, the first argument is treated as the hostname, and the second as the IP address.

Examples:
```bash
# First argument contains "10.10."
(user㉿host)-[~] ./adhost.sh 10.10.10.5 example

# First argument does not contain "10.10."
(user㉿host)-[~] ./adhost.sh example 192.168.1.10
```
## **Output**

Hosts File:

The script appends the IP and hostname to /etc/hosts in the format:
Copy
``` bash
127.0.0.1       localhost
127.0.1.1       kali
::1             localhost ip6-localhost ip6-loopback
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters


<IP> <Hostname>.htb
```
Nmap Scan Results:

    -Standard scan results are saved to /home/kali/nmap/<Hostname>.
    
    -Full port scan results are saved to /home/kali/nmap/<Hostname>-allports.

## **Requirements**

    Bash: The script is written for Bash and may not work with other shells.

    Nmap: Ensure Nmap is installed on your system.

    Permissions: You may need sudo privileges to modify /etc/hosts.
## **Notes**
    Ensure the /home/kali/nmap/ directory exists before running the script.

    Modify the output directory (/home/kali/nmap/) as needed.

    Use sudo if required to write to /etc/hosts.

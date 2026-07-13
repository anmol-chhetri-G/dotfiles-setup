{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # ------------------------------------------------------------
    # Network forensics / packet analysis
    # ------------------------------------------------------------
    wireshark
    tshark
    tcpdump
    ngrep
    termshark
    zeek
    suricata
    snort
    nmap
    rustscan
    masscan
    arp-scan
    netcat-openbsd
    socat
    iperf3
    mtr
    traceroute
    whois
    bind
    dnsutils
    inetutils

    # PCAP / file carving / forensic helpers
    foremost
    binwalk
    exiftool
    file
    hexyl
    xxd
    binutils
    jq
    yq
    ripgrep
    fd
    fzf

    # ------------------------------------------------------------
    # Web pentesting / recon
    # ------------------------------------------------------------
    burpsuite
    zap
    sqlmap
    nikto
    whatweb
    wafw00f
    dirb
    gobuster
    ffuf
    feroxbuster
    httpx
    nuclei
    subfinder
    amass
    dnsx
    naabu
    katana
    waybackurls
    gau

    # HTTP / API testing
    curl
    wget
    httpie
    postman
    insomnia

    # Wordlists
    seclists

    # Password/hash testing helpers
    john
    hashcat
    hashcat-utils
    hydra

    # General reversing/inspection helpers useful in CTFs
    gdb
    radare2
    ghidra
    checksec
    patchelf
  ];

  # Needed for Wireshark packet capture as non-root.
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };
}

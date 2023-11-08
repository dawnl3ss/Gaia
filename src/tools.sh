linuxPkg=(
    ffuf nmap sqlmap
    nikto hash-identifier
    hydra binwalk ./package/stegseek.deb
    wpscan python python3
    exploitdb amass ghidra
)

declare -A osintGitTools=(
    [DaProfiler]="https://github.com/daprofiler/DaProfiler"
    [PhoneinfoGA]="https://github.com/sundowndev/phoneinfoga"
    [WhatsMyName]="https://github.com/WebBreacher/WhatsMyName"
    [Maigret]="https://github.com/soxoj/maigret"
    [Theia]="https://github.com/dawnl3ss/Theia"
    [Holehe]="https://github.com/megadose/holehe"
)

declare -A enumGitTools=(
    [Kharon]="https://github.com/4m4Sec/Kharon"
)

declare -A accesGitTools=(
    [py-rev-shell]="https://github.com/4m4Sec/py-reverse-shell"
    [php-rev-shell]="https://github.com/4m4Sec/php-reverse-shell"
    [sh-rev-shell]="https://github.com/4m4Sec/sh-reverse-shell"
)

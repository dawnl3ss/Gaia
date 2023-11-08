#!/bin/bash
source src/tools.sh
source src/display/ascii.sh
source src/display/colors.sh

main(){
    clear
    echo -e "$Blue 🎩 $White Starting Gaia... $Blue"
    display_ascii

    echo -e "$White──────────⮞ Checking for your dotfiles ⮜──────────"
    echo -e "$BBlue[>] Github dotfiles found..."
    git clone https://github.com/dawnl3ss/dotfiles dotfiles/
    echo -e "$Cyan[+] moving files in the /home/ folder..."
    mv dotfiles/bashrc /home/amanara/.bashrc
    rm -rf dotfiles/

    echo -e "$White──────────⮞ Checking for Packages ⮜──────────"
    for pkg in ${linuxPkg[@]}; do
        isInstalled=`dpkg -s $pkg`
        echo -e "$BBlue[>] Checking for $pkg..."

        if [[ "$isInstalled" == *"install ok installed"* ]]; then
            echo -e "$Cyan[!] Package $pkg is already installed !"
            echo -e " "
        else
            echo -e "$Cyan[+] Installing package $pkg..."
            sudo apt install $pkg
        fi
    done

    echo -e "$White─────────⮞ Checking for Repositories ⮜─────────"
    echo -e "$BBlue[>] Checking for OSINT repositories..."
    for repo in ${!osintGitTools[@]}; do
        echo -e "$Cyan[+] Installing repository $repo...$BCyan"
        git clone ${osintGitTools[$repo]} /security/osint/$repo
        echo -e " "
    done

    echo -e "$BBlue[>] Checking for Enum repositories..."
    for repo in ${!enumGitTools[@]}; do
        echo -e "$Cyan[+] Installing repository $repo...$BCyan"
        git clone ${enumGitTools[$repo]} /security/tools/$repo
        echo -e " "
    done

    echo -e "$BBlue[>] Checking for GainAccess repositories..."
    for repo in ${!accesGitTools[@]}; do
        echo -e "$Cyan[+] Installing repository $repo...$BCyan"
        git clone ${accesGitTools[$repo]} /security/rev-shells/$repo
        echo -e " "
    done

    echo -e "$Cyan[+] Installing repository SecLists...$BCyan"
    git clone https://github.com/4m4Sec/SecLists /security/wordlists/
    echo -e " "

    echo -e "$White─────────⮞ Checking for implementations ⮜─────────"
    echo -e "$BBlue[>] MD5-2-John implement detected..."
    echo -e "$Cyan[+] moving file in /usr/share/john/md5-2-john.py..."
    sudo mv src/john/md5-2-john.py /usr/share/john/md5-2-john.py
    echo -e " "
}
#already exists and is not an empty directory
main

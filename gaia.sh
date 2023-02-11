#!/bin/bash
source src/tools.sh
source src/display/ascii.sh
source src/display/colors.sh

main(){
    clear
    echo -e "$Blue 🎩 $White Starting Gaia... $Blue"
    display_ascii

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
#${githubTools[$repo]}
    echo -e "$White─────────⮞ Checking for Repositories ⮜─────────"
    echo -e "$BBlue[>] Checking for OSINT repositories..."
    for repo in ${!osintGithubTools[@]}; do
        echo -e "$Cyan[+] Installing repository $repo...$BCyan"
        git clone ${osintGithubTools[$repo]} tools/osint/$repo
        echo -e " "
    done

    echo -e "$BBlue[>] Checking for Enum repositories..."
    for repo in ${!enumGithubTools[@]}; do
        echo -e "$Cyan[+] Installing repository $repo...$BCyan"
        git clone ${enumGithubTools[$repo]} tools/enum/$repo
        echo -e " "
    done
}
main
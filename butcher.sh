#!/bin/sh
#
# authors: b3yc0d3 <b3yc0d3@gmail.com>
#
# This file is called "butcher" because it butchers with the
# orginal Discord asar file.

# STEPS:
# 1. User must agree to Disclaimer
# 2. Ask version to butcher
# 3. Download that version
# 4. Unpack downloaded Tarball
# 5. Unpack it with "asar"
# 6. Inject needed files
# 7. Bundle it back to a .asar file
# 8. Install Discord
# 9. Clean Up

# GLOBAL VARIABLES
DISCORD_STABLE="https://discord.com/api/download?platform=linux&format=tar.gz"
DISCORD_ALPHA="https://canary.discord.com/api/download?platform=linux&format=tar.gz"
DISCORD_BETA="https://ptb.discord.com/api/download?platform=linux&format=tar.gz"
DOWNLOAD_URI=$DISCORD_STABLE

BUILD_PATH="./build"
UNP_ASAR_PATH="$BUILD_PATH/Discord/resources/app"
INSTALL_DIR="/opt/"

CLR_FREEBSD="\033[38;2;171;43;40m"
CLR_DICORD="\033[38;2;88;101;242m"
CLR_FG="\033[38;2;252;252;252m"
CLR_USR_INP="\033[38;2;106;120;252m"
RST_FG="\033[0m"
PREFIX="$CLR_FG"
PREFIX+="DoBSD]"

# Prints Header
# Header Font made by:
#   https://www.kammerl.de/ascii/AsciiSignature.php
print_header() {
    
    echo -e "$CLR_DICORD  _____  _                       _                $CLR_FREEBSD ____   _____ _____$RST_FG"
    echo -e "$CLR_DICORD |  __ \(_)                     | |              $CLR_FREEBSD |  _ \ / ____|  __ \\ $RST_FG"
    echo -e "$CLR_DICORD | |  | |_ ___  ___ ___  _ __ __| |   ___  _ __  $CLR_FREEBSD | |_) | (___ | |  | |$RST_FG"
    echo -e "$CLR_DICORD | |  | | / __|/ __/ _ \| '__/ _\` |  / _ \\| '_ \ $CLR_FREEBSD |  _ < \___ \| |  | |$RST_FG"
    echo -e "$CLR_DICORD | |__| | \__ \ (_| (_) | | | (_| | | (_) | | | |$CLR_FREEBSD | |_) |____) | |__| |$RST_FG"
    echo -e "$CLR_DICORD |_____/|_|___/\___\___/|_|  \__,_|  \___/|_| |_|$CLR_FREEBSD |____/|_____/|_____/ $RST_FG"

    echo -e "\t\t\t\t\t     github.com/b3yc0d3/DoBSD\n$CLR_FG"
}

# 1. Printing the agreement to the user
print_agreement() {
    echo "1) Disclaimer"
    echo "  I am fully aware that I make changes to Discord at my own risk."
    echo "  I am aware that modifying the Discord application violates Discord's Terms of Service."
    echo -ne " (I AM AWARE OF THIS/I AM NOT AWARE OF THIS): $CLR_USR_INP"
    read -r agreement
    echo -e "$CLR_FG"

    case "$agreement" in
        "IAAOT")
        func_step2
        ;;
        "I AM AWARE OF THIS")
        func_step2
        ;;

        "IANAOT")
        exit 0
        ;;
        "I AM NOT AWARE OF THIS")
        exit 0
        ;;
        *)
        exit 0
        ;;
    esac
}

# Download Discord Version
# args:
#       str: URL
func_download() {
    local URL=${1:?}
    local save_path=${2:?}

    wget -O "$save_path" "$URL"
}

# 2. Ask version to butcher
func_step2() {
    local sVerson="stable"
    local appName="discord"
    
    echo -e "2) Select Version of Discord"
    echo "  Select Discord version you want to Install"
    echo "  1] Stable"
    echo "  2] Canary"
    echo "  3] Public Test Build (PTB)"
    echo ""
    echo -ne "Type ID: $CLR_USR_INP"
    read -r sVersion
    
    case "$sVersion" in
        "1")
        appName="discord"
        DOWNLOAD_URI=$DISCORD_STABLE
        INSTALL_DIR+="$appName"
        ;;
        "2")
        appName+="-canary"
        DOWNLOAD_URI=$DISCORD_ALPHA
        INSTALL_DIR+="$appName"
        ;;
        "3")
        appName+="-ptb"
        DOWNLOAD_URI=$DISCORD_BETA
        INSTALL_DIR+="$appName"
        ;;
        *)
        echo "Unkown Option of $sVersion"
        exit 1
        ;;
    esac

    echo -e "$PREFIX Start download of \"$appName\"...$RST_FG"
    # check if Build Path exists
if [ ! -d "$BUILD_PATH" ]; then
    mkdir $BUILD_PATH
fi
#   3. Download that version
#   check if it is not downloaded yet
if [ ! -f "$BUILD_PATH/discord.tgz" ]; then
    echo $(func_download "$DOWNLOAD_URI" "$BUILD_PATH/discord.tgz")
    echo -e "$PREFIX Done downloading"
else
    echo -e "$PREFIX Skiped downloading"
fi

#   4. Unpack downloaded Tarball
    echo -e "$PREFIX Unpacking Tarball...$RST_FG"
    tar -xvf "$BUILD_PATH/discord.tgz" -C "$BUILD_PATH"
    echo "$PREFIX Done Unpacking Tarball"

#   5. Unpack it with "asar"
    echo -e "$PREFIX Unpacking app.asar...$RST_FG"
    asar e "$UNP_ASAR_PATH.asar" "$UNP_ASAR_PATH"
    echo -e "$PREFIX Unpacked app.asar"

    echo "D] EXIT 0"
    exit 0

#   6. Inject needed files

#   7. Bundle it back to a .asar file
#   echo -e "$PREFIX Createing asar archive...$RST_FG"
#   asar p "$UNP_ASAR_PATH" "$UNP_ASAR_PATH.asar"
#   echo -e "$PREFIX Created asar archive$RST_FG"

#   8. Install Discord
#   mkdir "$INSTALL_DIR"
#   cp "$BUILD_DIR/Dioscrd/*" "$INSTALL_DIR"
#   9. Clean Up
}

# Entry Point
run() {
#   Print da header
    print_header
    print_agreement
}

run
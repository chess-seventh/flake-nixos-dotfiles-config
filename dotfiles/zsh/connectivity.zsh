
# pvpnc() {
#     if [[ -z $1 ]]; then
#         return
#     fi
#     sudo protonvpn c --cc $1
# }
#
#
# stopcon() {
#     sudo protonvpn d
#     sudo ip link set wlp61s0 down
#     sudo macchanger -p wlp61s0
#     sudo ip link set wlp61s0 up
# }
#
# homecon() {
#     sudo protonvpn d
#     sudo ip link set wlp61s0 down
#     sudo macchanger -p wlp61s0
#     sudo ip link set wlp61s0 up
#     sudo netctl-auto switch-to wlp61s0-PowerHub
# }
#
# phonecon() {
#     sudo protonvpn d
#     sudo ip link set wlp61s0 down
#     sudo macchanger -p wlp61s0
#     sudo ip link set wlp61s0 up
#     sudo netctl-auto switch-to wlp61s0-Hullabaloo
# }
#
#
# wifipublic_disconnect() {
#     sudo protonvpn d
#     sudo ip link set wlp61s0 down
#     sudo macchanger -p wlp61s0
# }
#
# wifipublic() {
#     sudo protonvpn d
#     sudo ip link set wlp61s0 down
#     sudo macchanger -r wlp61s0
#     sudo ip link set wlp61s0 up
#     sudo wifi-menu
#     while [[ -z $(ip add | grep wlp61s0 | awk -F 'inet' '{ print $2 }' | awk '{ print $1 }') ]]; do
#         sleep 1
#     done
#     sudo protonvpn c --sc
#     sudo protonvpn s
#     figlet "Configure Kill Switch! (5 & 1)"
#     sudo protonvpn configure
# }

wifidown() {
    sudo macchanger -p wlp61s0
    sudo ip link set wlp61s0 up
}

wifiup() {
    sudo macchanger -p wlp61s0
    sudo ip link set wlp61s0 up
}

lip() {
    echo $(ip add | grep inet | grep -v '::' | grep -v '/16' | grep -v '/8' | awk '{ print $2 }')
}

macreset() {
    sudo protonvpn d
    sudo ip link set wlp61s0 down
    sudo macchanger -p wlp61s0
    sudo ip link set wlp61s0 up
}

amiconnected() {
    if [[ -z $(pidof openvpn) ]]; then
        echo false
        notify-send "Not connected" --app-name=info
    else
        echo true
        if [[ $(grep -ri '.*rootbytes.*' /etc/resolv.conf) ]]; then
            notify-send "Connected at Home" --app-name=info
        else
            notify-send "Connected with PVPN" --app-name=info
        fi
    fi
}

discon_vpn () {
    if [[ $(pidof openvpn) ]]; then
        if [[ $(grep -ri '.*rootbytes.*' /etc/resolv.conf) ]]; then
            notify-send "Disconnecting from Home VPN..." --app-name=info
            sudo kill -15 $(pidof openvpn)
        elif [[  "$(sudo protonvpn s | grep Status | awk '{ print $2 }')"  == "Connected" ]]; then
            notify-send "Disconnecting from ProtonVPN..." --app-name=info
            sudo protonvpn d
        else
            kill_vpn
        fi
    fi
}

## CONNECT TO HOME VPN
#
am_i_at_home() {
    if [[ $(pidof openvpn) ]]; then
        if [[ $(ping -c 1 192.168.70.1 192.168.70.17 192.168.10.4 192.168.70.6) ]]; then
            # at home
            return 0
        else
            # somewhere
            return 1
        fi
    fi
    # no vpn
    return 99
}

kill_vpn() {
    export DISPLAY=:0
    sudo kill -15 $(pidof openvpn)
    if [[ $? == 0 ]]; then
        notify-send "Disconnected from VPN" --app-name=info
    else
        notify-send "Not connected" --app-name=info
    fi
}

vpn_home() {
    export DISPLAY=:0

    if [[ $(pidof openvpn) ]]; then
        if [[ am_i_at_home == 1 ]]; then
            if [[ "$(sudo protonvpn s | grep Status | awk '{ print $2 }')" == "Connected" ]]; then
                sudo protonvpn d
            else
                kill_vpn
            fi
        fi
    fi
    sudo openvpn --script-security 2 --config ~/.vpns/private-hub.ovpn --log ~/.vpns/home_vpn_logs.log --daemon

    am_i_at_home
    res=$?

    if [[ $res != 0 ]]; then
        while [[ am_i_at_home != 0 ]]; do
            sleep 20
        done
    fi
    notify-send "connected @ Home" --app-name=info
}

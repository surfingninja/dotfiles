#!/usr/bin/env bash


cpu_macos() {
    sysctl -n vm.loadavg | awk '{print $2}'
}

cpu_linux() {
    cut -d " " -f 1 /proc/loadavg
}

mem_macos() {
    local pagesize=4096

    local active
    local inactive

    active=$(vm_stat | awk '/Pages active/ {gsub(/\./,"",$3); print $3}')
    inactive=$(vm_stat | awk '/Pages inactive/ {gsub(/\./,"",$3); print $3}')

    local used=$(( (active + inactive) * pagesize / 1024 / 1024 ))

    echo "${used}MB"
}

mem_linux() {
    awk '
        /MemTotal:/ {total=$2}
        /MemAvailable:/ {avail=$2}
        END {
            used=(total-avail)/1024
            printf "%dMB\n", used
        }
    ' /proc/meminfo
}

main() {
    case "$(uname)" in
        Darwin)
            cpu=$(cpu_macos)
            mem=$(mem_macos)
            ;;
        Linux)
            cpu=$(cpu_linux)
            mem=$(mem_linux)
            ;;
        *)
            echo "CPU N/A MEM N/A"
            echo "N/A"
            ;;
    esac

    echo "#[fg=cyan] CPU: #[default]$cpu  #[fg=orange] Mem: #[default]${mem}"
}

main

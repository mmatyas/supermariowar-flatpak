#! /bin/bash

set -o errexit
set -o nounset
set -o pipefail


print_help() {
    echo "Usage: $0 [module]"
    echo "Where 'module' is:"
    echo "  game         Launches the main game"
    echo "  leveledit    Launches the level editor"
    echo "  worldedit    Launches the world editor"
    echo "  server       Launches the online server"
}


[[ $# -eq 0 ]] && {
    print_help
    exit 1
}


for opt in "$@"; do
case $opt in
    game)
        /app/games/smw --datadir /app/share/games/smw && exit
    ;;
    leveledit)
        /app/games/smw-leveledit --datadir /app/share/games/smw && exit
    ;;
    worldedit)
        /app/games/smw-worldedit --datadir /app/share/games/smw && exit
    ;;
    server)
        /app/games/smw-server && exit
    ;;
    --help)
        print_help && exit
    ;;
    *)
        print_help && exit 1
    ;;
esac
done

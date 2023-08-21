#!/bin/bash -e

function usage() {
    cat <<tac
Usage: $0 [OPTION]

Build artifacts of the lab work
  -o, --out FILENAME       output FILENAME without extension
  -d, --docker             build using docker-image asciidoctor/docker-asciidoctor
  -h, --help               print this help message and exit

Examples:
  $0
  $0 -o 'Лабораторная_работа_по_Git'
  $0 -d -o 'Лабораторная_работа_по_Git'
tac
}


# Parse arguments
FILENAME=""
MAKEOPTS=()
DOCKER="docker run --rm -v $(pwd):/documents/ asciidoctor/docker-asciidoctor"
RUN_ENV=""

while [ "$1" != "" ]; do
    case $1 in
        -h|--help)
            usage
            exit 0
            ;;
        -o|--out)
            FILENAME=$2
            shift 2
            ;;
        -d|--docker)
            RUN_ENV=$DOCKER
            shift
            ;;
        *)
            echo "Unknown option $1"
            usage
            exit 1
            ;;
    esac
done

if [ "$FILENAME" != "" ]; then
    MAKEOPTS+=( "RESULT_PDF=${FILENAME}.pdf" )
fi

# Build pdf
$RUN_ENV make "${MAKEOPTS[@]}"

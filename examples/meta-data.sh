#! /bin/sh

FIRST_RELEASE=2017-08-13
PROJECT_PAGES="https://github.com/JosefFriedrich-shell/skeleton"
SHORT_DESCRIPTION='This is an example script to demonstrate the metadata usage in shell scripts!'
USAGE="Usage: $(basename "$0") [-hsv]

$SHORT_DESCRIPTION

"
VERSION=1.0

_getopts() {
	while getopts ':hsv-:' OPT ; do
		case $OPT in
			h) echo "$USAGE"; exit 0;;
			s) echo "$SHORT_DESCRIPTION"; exit 0;;
			v) echo "$VERSION"; exit 0;;
			\?)
				echo "Invalid option “-$OPTARG”!" >&2
				exit 2
				;;

			:)
				echo "Option “-$OPTARG” requires an argument!" >&2
				exit 3
				;;

			-)
				LONG_OPTARG="${OPTARG#*=}"

				case $OPTARG in
					help) echo "$USAGE"; exit 0;;
					short-description) echo "$SHORT_DESCRIPTION"; exit 0;;
					version) echo "$VERSION"; exit 0;;

					help*|short-description*|version*)
						echo "No argument allowed for the option “--$OPTARG”!" >&2
						exit 4
						;;

					'') break;;
					*) echo "Invalid option “--$OPTARG”!" >&2; exit 2;;

				esac
				;;

		esac
	done
	GETOPTS_SHIFT=$((OPTIND - 1))
}

## This SEPARATOR is required for test purposes. Please don’t remove! ##

_getopts $@
shift $GETOPTS_SHIFT

[ -n "$1" ] && echo "Parameter 1: $1"
[ -n "$2" ] && echo "Parameter 2: $2"

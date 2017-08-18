#! /bin/sh

# See https://stackoverflow.com/a/28466267

# Exit codes
# Invalid option: 2
# Missing argument: 3
# No argument allowed: 4
_getopts() {
	while getopts ':ab:c-:' OPT ; do
		case $OPT in
			a)
				OPT_ALPHA=1
				;;

			b)
				OPT_BRAVO="$OPTARG"
				;;

			c)
				OPT_CHARLIE=1
				;;

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
					alpha)
						OPT_ALPHA=1
						;;

					bravo=?*)
						OPT_BRAVO="$LONG_OPTARG"
						;;



					charlie)
						OPT_CHARLIE=1
						;;

					alpha*|charlie*)
						echo "No argument allowed for the option “--$OPTARG”!" >&2
						exit 4
						;;

					bravo*)
						echo "Option “--$OPTARG” requires an argument!" >&2
						exit 3
						;;

					'')	# "--" terminates argument processing
						break
						;;

					*)
						echo "Invalid option “--$OPTARG”!" >&2
						exit 2
						;;

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

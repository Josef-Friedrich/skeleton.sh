#! /bin/bash

# See https://stackoverflow.com/a/28466267

_getopts() {
	OPT_ALPHA=
	OPT_BRAVO=
	OPT_CHARLIE=
	while getopts :ab:c-: OPT ; do
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

			-)
				LONG_OPTARG="${OPTARG#*=}"

				case $OPTARG in
					alpha)
						OPT_ALPHA=1
						;;

					bravo=?*)
						OPT_BRAVO="$LONG_OPTARG"
						;;

					bravo*)
						echo "Option --$OPTARG requires an argument." >&2
						exit 2
						;;

					charlie)
						OPT_CHARLIE=1
						;;

					alpha* | charlie*)
						echo "No arg allowed for --$OPTARG option" >&2
						exit 2
						;;

					'')	# "--" terminates argument processing
						break
						;;

					*)
						echo "Invalid option --$OPTARG" >&2
						exit 2
						;;

					 esac ;;

			\?)
				echo "Invalid option -$OPTARG" >&2
				exit 1
				;;

			:)
				echo "Option -$OPTARG requires an argument." >&2
				exit 2
				;;
		esac
	done
	shift $((OPTIND - 1))
}

## This SEPARATOR is required for test purposes. Please don’t remove! ##

_getopts $@

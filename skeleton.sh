#! /bin/sh

# MIT License
#
# Copyright (c) 2017 Josef Friedrich <josef@friedrich.rocks>
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

FIRST_RELEASE=2017-08-13
VERSION=1.0
PROJECT_PAGES="https://github.com/JosefFriedrich-shell/skeleton"
SHORT_DESCRIPTION='This is an example script of the skeleton.sh project!'
USAGE="$(basename "$0") v$VERSION

Usage: $(basename "$0") [-hsv]

$SHORT_DESCRIPTION

Options:
	-h, --help
	  Show this help message
	-s, --short-description
	  Show a short description / summary
	-v, --version
	  Show the version number of this script.
"

# See https://stackoverflow.com/a/28466267

# Exit codes
# Invalid option: 2
# Missing argument: 3
# No argument allowed: 4
_getopts() {
	while getopts ':ab:chsv-:' OPT ; do
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

					help) echo "$USAGE"; exit 0;;
					short-description) echo "$SHORT_DESCRIPTION"; exit 0;;
					version) echo "$VERSION"; exit 0;;

					help*|short-description*|version*)
						echo "No argument allowed for the option “--$OPTARG”!" >&2
						exit 4
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

cat <<EOF
      .-.
     (o.o)
      |=|        Welcome to
     __|__       skeleton.sh
   //.=|=.\\
  // .=|=. \\
  \\ .=|=. //
   \\(_=_)//
    (:| |:)
     || ||
     () ()
     || ||
     || ||
    ==' '==
EOF

#!/usr/bin/env sh

BASEDIR="$(cd "$(dirname "$0")"; pwd)"
#echo "$BASEDIR"

cd "$BASEDIR"

if [ -z $1 ]; then
#	echo "usage: $0 role_name"
	exit 1
fi

if ! [ -d "roles/$1" ]; then
#	echo "Creating directory '${BASEDIR}/roles/$1'..."
	mkdir -p "roles/$1"
fi

cd "roles/$1"

for i in defaults files handlers meta tasks templates vars; do
	if ! [ -d "$i" ]; then
#		echo "Creating directory '${BASEDIR}/roles/$1/$i'..."
		mkdir "$i"
	fi

	if [ $i = handlers -o $i = meta -o $i = tasks ]; then
#		echo "Creating file '${BASEDIR}/roles/$1/$i/main.yml'..."
		echo '---' > "$i/main.yml"
	fi
done

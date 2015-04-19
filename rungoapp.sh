#
# a script to use with entr in development
# find app lib db config ../../qor/qor | entr -r rungoapp
#

set -e

# echo go-bindata -o ui.go -ignore .module-cache -dev ui/...
# go-bindata -o ui.go -ignore .module-cache -dev ui/...

app=$1

if [[ "$app" == "" ]]; then
	echo "require an app name"
	exit 1
fi

echo "----------------------------"
echo go build -o $GOPATH/bin/$app
go build -o "$GOPATH/bin/$app"

# $apppid=$(cat $GOPATH/bin/$app.pid)
# if ps -p $apppid > /dev/null; then
# 	echo kill $app
# 	kill -9 $apppid
# fi

if pgrep $app > /dev/null; then
	echo kill $app
	pkill $app
fi

echo running $app
echo "----------------------------"
$app
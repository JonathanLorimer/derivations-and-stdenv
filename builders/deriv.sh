# List exported variables
declare -xp

# List
echo "1st argument passed to this builder: $1"
echo "out is: $out"
echo "lib is: $lib"
echo "NIX_BUILD_TOP is: $NIX_BUILD_TOP"
echo "PATH is: $PATH"
echo "HOME is: $HOME"
echo "OUR_ENV_VAR is: $OUR_ENV_VAR"

$coreutils/bin/mkdir -p $out
$coreutils/bin/mkdir -p $lib

echo $1 >> "$out/arg.txt"
echo $2 >> "$lib/arg.txt"

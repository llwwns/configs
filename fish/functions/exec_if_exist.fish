# Defined interactively
function exec_if_exist
if test (count $argv[2..-1]) != "0"
$argv[1] $argv[2..-1]
end
end

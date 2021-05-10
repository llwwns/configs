# Defined interactively
function exec_if_exist_2
if test (count $argv[3..-1]) != "0"
$argv[1] $argv[2] $argv[3..-1]
end
end

# Defined in - @ line 1
function autoremove --description 'alias autoremove=sudo pacman -Rns (pacman -Qtdq)'
	sudo pacman -Rns (pacman -Qtdq) $argv;
end

# Defined in - @ line 1
function lh --description 'alias lh=du -ahd1 | sort -h'
	du -ahd1 | sort -h $argv;
end

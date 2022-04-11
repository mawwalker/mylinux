# Defined in - @ line 1
function cpic --description 'alias cpic'
    grim -g (slurp -p) -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:- | tail -n1 | awk '{ print $3 }' | pastel color -;
end

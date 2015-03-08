clear all

cd "~/Documents"

input str18 country hrtdrop brcadrop
USA 20 6.7
Germany 20 8.8
Belgium 20 9.5
Canada 15 8
France 21 12
Switzerland 15 6
Australia 8 6.7
end

save hrtdata, replace

use hrtdata

list



function W = randomWeights (L_in, L_out)

epsilon_init = 0.12;
W = rand(L_out, 1 + L_in) * 2 * epsilon_init - epsilon_init;
%W = ones(L_out, 1 + L_in)/3;
end

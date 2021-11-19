function op = waveGen( bits, strechCoefficient )
    op = cell(1, 3);
    dt = 0.01;
    t = 0 : dt : length(bits)*strechCoefficient - dt;

    op{1} = polarNRZ(bits, strechCoefficient);
    op{2} = t;
end

function op = polarNRZ( bits, strechCoefficient )
    one = ones(1, 100*strechCoefficient);
    zero = zeros(1, 100*strechCoefficient) - 1;
    graph = [];
    for i = 1:length(bits)
        if(bits(i)==1)
            graph = [graph one];
        else
            graph = [graph zero];
        end
    end
    op = graph;
end

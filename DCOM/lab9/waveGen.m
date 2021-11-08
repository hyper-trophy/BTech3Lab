function op = waveGen( bits )
    op = cell(1, 3);
    dt = 0.01;
    t = 0 : dt : length(bits) - dt;

    op{1} = unipolarNRZ(bits);
    op{2} = polarNRZ(bits);
    op{3} = AMI(bits);
    op{4} = t;
end

function op = unipolarNRZ( bits )
    one = ones(1, 100);
    zero = zeros(1, 100);
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


function op = polarNRZ( bits )
    one = ones(1, 100);
    zero = zeros(1, 100) - 1;
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

function op = AMI( bits )
    one = [ones(1, 50), zeros(1, 50)];
    onebar = [zeros(1, 50)-1 , zeros(1, 50)];
    zero = zeros(1, 100);
    graph = [];
    flag = 1;
    for i = 1:length(bits)
        if(bits(i)==1)
            if(flag == 1)
                graph = [graph one];
                flag = 0;
            else 
                graph = [graph onebar];
                flag = 1;
            end
        else
            graph = [graph zero];
        end
    end
    op = graph;
end
function op = plotters( bits, amp )
    dt = 0.01;
    t = 0 : dt : length(bits) - dt;
    
    subplot(6, 1, 1)
    plot(t, amp.*unipolarNRZ(bits));
    title(['Unipolar NRZ for bits : ' num2str(bits)]);
    
    subplot(6, 1, 2)
    plot(t, amp.*unipolarRZ(bits));
    title(['Unipolar RZ for bits : ' num2str(bits)]);
    
    subplot(6, 1, 3)
    plot(t, amp.*polarNRZ(bits));
    title(['Polar NRZ for bits : ' num2str(bits)]);
    
    subplot(6, 1, 4)
    plot(t, amp.*polarRZ(bits));
    title(['Polar RZ for bits : ' num2str(bits)]);
    
    subplot(6, 1, 5)
    plot(t, amp.*AMI(bits));
    title(['AMI for bits : ' num2str(bits)]);
    
    subplot(6, 1, 6)
    plot(t, amp.*manchester(bits));
    title(['Manchester for bits : ' num2str(bits)]);
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

function op = unipolarRZ( bits )
    one = [ones(1, 50) zeros(1, 50)];
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

function op = polarRZ( bits )
    one = [ones(1, 50), zeros(1, 50)];
    zero = [zeros(1, 50) - 1, zeros(1, 50)];
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

function op = manchester( bits )
    one = [ones(1, 50), zeros(1, 50)-1];
    zero = [zeros(1, 50) - 1, ones(1, 50)];
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
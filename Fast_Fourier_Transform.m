function [X] = Fast_Fourier_Transform(x)

%%Let FFT length = Power of 2
if( mod(log2(length(x)),1) ~= 0 )
    for i=length(x) + 1 : 1 : 2 ^ ceil(log2(length(x)))
        x(i)=0;
    end
end

m_N = length(x); %FFT length
m_logN = log2(m_N); %Log2 of FFT length
numFlies = 1; % Number of butterflies per sub-FFT
span = 1; % Width of the butterfly
spacing = bitsll(span,1); % Distance between each of sub-FFTs
wIndexStep = m_N / 2; % Increment for twiddle table index

%%Creat a BitReverse table
Bit_table=zeros(1,m_N);
for i=0 : 1 : m_N - 1
    Bit_table(i+1)=0;
    num=i;
    for k=0 : 1 : m_logN - 1
        Bit_table(i+1) = bitsll(Bit_table(i+1),1); %y = y << 1
        Bit_table(i+1) = bitor(Bit_table(i+1),bitand(uint16(num),1)); %y =  y | (x & 1);
        %num = bitsra(uint16(num),1); %x = x >> 1;
        num = bitsra(num,1); %x = x >> 1;
    end
end

%For each stage of the FFT
for stage = 0: 1 : m_logN - 1
    
    %For each butterfly in this stage
    for start = 0 : spacing : m_N - 1
        twiddle = 1 + j*0;
        
        %For each butterfly in this stage
        for flyCount = 0 : 1 : numFlies - 1
            
            %Get the top & bottom values
            xTop = x(Bit_table(start + 1 + flyCount) + 1);
            xBot = x(Bit_table(start + span + 1 + flyCount) + 1);
            
            %Bottom branch of butterly has multiplication by twiddle factor
            xBot = xBot * twiddle ;
            
            %Top branch of butterfly has addition
            x(Bit_table(start + 1 + flyCount) + 1) = xTop + xBot;

            %Bottom branch of butterly has subtraction 
            x(Bit_table(start + span + 1 + flyCount) + 1) = xTop - xBot;
            
            %Update the twiddle factor
            twiddle = twiddle * (exp(-j * 2 * pi / m_N * wIndexStep));
            
        end
    end
    
    numFlies = bitsll(numFlies,1); %Multiply by 2 by left shift
    span = bitsll(span,1);
    spacing = bitsll(spacing,1);
    wIndexStep = bitsra(wIndexStep,1); %Divide by 2 by right shift
    
end 

%Copying output values from input by BitReverse table
X = zeros(1,m_N);
for i=1 : 1 : m_N
    X(i)=x(Bit_table(i) + 1);
end

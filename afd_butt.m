function [b,a,Wc]=afd_butt(Wp,Ws,Rp,As,edge_frequency);
N= ceil( ( log10(( (10^(Rp/10)-1) / (10^(As/10)-1) )) ) ...
            / (2*log10(Wp/Ws)) );
switch(edge_frequency)
    case 'passband'
        Wc=Wp/ ((10^(Rp/10)-1)^(1/(2*N)));
    case 'stopband'
        Wc=Ws/ ((10^(As/10)-1)^(1/(2*N)));
end
[z,p,k]=buttap(N);
[b,a]=deNormalize(z,p,k,Wc,N);
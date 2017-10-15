M = [5,1,18,-1,1;
    18,7,5,-1,1;
    18,4,11,-1,1;
    11,1,18,-1,0.9;
    11,1,3,-10,0.1;
    11,2,18,-10,0.1;
    11,2,3,-1,0.9;
    3,11,11,-1,0.9;
    3,11,15,-10,0.1;
    3,8,11,-10,0.1;
    3,8,15,-1,0.9;
    3,5,1,-1,1;
    15,2,3,-1,0.9;
    15,2,22,-10,0.1;
    15,3,22,-1,0.9;
    15,3,3,-10,0.1;
    22,6,15,-1,1;
    22,12,10,-1,1;
    10,3,22,-1,1;
    1,2,3,-1,0.8;
    1,2,4,-10,0.1;
    1,2,2,-10,0.1;
    1,1,2,-1,0.8;
    1,1,3,-10,0.1;
    1,1,4,-10,0.1;
    1,3,4,-1,0.8;
    1,3,3,-10,0.1;
    1,3,2,-10,0.1;
    4,6,1,-1,1;
    4,10,14,-1,0.9;
    4,10,12,-10,0.1;
    4,12,12,-1,0.9;
    4,12,14,-10,0.1;
    2,4,1,-1,1;
    2,9,13,-1,0.9;
    2,9,16,-10,0.1;
    2,7,13,-10,0.1;
    2,7,16,-1,0.9;
    14,3,4,-1,0.9;
    14,3,20,-10,0.1;
    14,2,20,-1,0.9;
    14,2,4,-10,0.1;
    20,5,14,-1,1;
    20,11,8,-1,1;
    12,3,4,-1,0.9;
    12,3,19,-10,0.1;
    12,1,4,-10,0.1;
    12,1,19,-1,0.9;
    19,4,12,-1,1;
    19,9,7,-1,1;
    7,1,19,-1,1;
    16,1,2,-1,0.9;
    16,1,21,-10,0.1;
    16,3,21,-1,0.9;
    16,3,2,-10,0.1;
    21,6,16,-1,1;
    21,10,9,-1,1;
    9,3,21,-1,1;
    13,1,2,-1,0.9;
    13,1,17,-10,0.1;
    13,2,2,-10,0.1;
    13,2,17,-1,0.9;
    17,5,13,-1,1;
    17,8,6,-1,1;
    6,2,17,-1,1];
   % 8,1,5,-1,1];

Q = zeros(100,3);
lamda = ones(65,4);
temp=zeros(9,5);
c=1;
cc=0;
ccc=0;
rr=1;
r=0;
cccc=0;
fl=0;
flfl=0;

fla=0;
for u = 1:1000
sstart=5;
while sstart~=8
    for i=1:65
        if M(i,1) == sstart
            temp(c,1)=M(i,1);
            temp(c,2)=M(i,2);
            temp(c,3)=M(i,3);
            temp(c,4)=M(i,4);
            temp(c,5)=M(i,5);
            c=c+1;
        end
    end
    c=c-1; %length of temp
    r = randi([1  c],1,1); %I can use temp(r,1/2/3/4/5) for the action specified exoume diale3ei randomly to action
    for k=1:size(temp,1)  %edw mhdenizw osa den einai idio state kai idio action
        if temp(k,1) == temp(r,1) && temp(k,2) == temp(r,2)
            cc=cc+1;%metra posa states,actions exoume
        else 
            temp(k,1)=0;
            temp(k,2)=0;
            temp(k,3)=0;
            temp(k,4)=0;
            temp(k,5)=0;
        end
    end
     x = (1-0).*rand();
     if cc==3
         if x(1,1)>0.9
            for k=1:size(temp,1) %psa3e ston pinaka to 1o temp me to 0.1
                if temp(k,5)==0.1 && ccc<1
                    rr = k;
                    ccc=ccc+1;
                end
            end
         elseif 0.8<x(1,1)<=0.9
              for k=1:size(temp,1) %psa3e ston pinaka to temp me to 0.1
                if temp(k,5)==0.1 
                    if ccc==1
                        rr = k;
                    else
                        ccc=ccc+1;
                    end
                end
              end
         else
              for k=1:size(temp,1) %psa3e ston pinaka to temp me to 0.1
                if temp(k,5)==0.8
                    rr = k;
                end
              end
         end
     elseif cc==2
         if x(1,1)>0.9
            for k=1:size(temp,1) %psa3e ston pinaka to temp me to 0.1
                if temp(k,5)==0.1
                    rr = k;
                end
            end
         else
              for k=1:size(temp,1) %psa3e ston pinaka to temp me to 0.1
                if temp(k,5)==0.9
                    rr = k;
                end
              end
         end
     else
        for k=1:size(temp,1) %metraw posa state actions exoume 
            if temp(k,1)~=0
                rr = k;
            end
        end
     end
     
     %%calculate max
     for j=1:100
        if Q(j,1) == temp(rr,3)
            fl=1;
            cccc=cccc+1;
            if cccc==1
                max = Q(j,3);
            else
                if max<Q(j,3)% to max dn 8a einai >0 sta prwta iteration giauto e8esa to arxiko max san -2 opote logika lunw to problhma
                    max = Q(j,3);
                end
            end
        end
     end
    d=zeros(5,1);
    dd=0;
     if fl == 0
           for j=1:65
               if M(j,1) == temp(rr,3)
                   if isempty(find(d==M(j,2),1))
                      for i=1:100
                          if Q(i,1)==0 && Q(i,2)==0
                             Q(i,1)=  M(j,1);
                             Q(i,2)=  M(j,2);
                             dd=dd+1;
                             d(dd,1)= M(j,2);
                             break;
                          end
                      end
                   end
               end
           end  
           max=0;
     end
     %%end of max calculation
     %find state and action in Q matrix
     for l=1:65
        if Q(l,1) == temp(rr,1) && Q(l,2)==temp(rr,2)
            fla=1;
            m=l;
        end
     end  
     if fla == 0
         m=0; 
         for j=1:100
           if Q(j,1) == 0 && Q(j,2)== 0
              m=j;
              break;
           end
         end
         Q(m,1)= temp(rr,1);
         Q(m,2)= temp(rr,2);
     end   
     lamda(m,1)= temp(rr,1); %den to metraei swsta
     lamda(m,2)= temp(rr,2);
     Q(m,3)=Q(m,3)+lamda(m,4)*(temp(rr,4)+0.9*max-Q(m,3));% eleg3e pws skata to upologizw
     lamda(m,3) = lamda(m,3)+1;
     lamda(m,4) = 1/lamda(m,3);
     sstart=temp(rr,3);
     c=1;
     cc=0;
     cccc=0;
     ccc=0;
     fla=0;
     fl=0;
     flfl=0;
     for k=1:size(temp,1) 
        for n=1:5
             temp(k,n)=0;
        end
     end
end
end


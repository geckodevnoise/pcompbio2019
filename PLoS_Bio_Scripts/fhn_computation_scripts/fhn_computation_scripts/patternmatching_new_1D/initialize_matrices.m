function initialize_matrices()
global n  DDD DD  deltax  c1u c8u 


disp('Initializing matrices...');


DD=sparse(n^2,n^2);

for ii=2:n-1
    for jj=2:n-1
        DD(space_index(ii,jj),space_index(ii+1,jj))=1; 
        DD(space_index(ii,jj),space_index(ii-1,jj))=1;
        DD(space_index(ii,jj),space_index(ii,jj+1))=1;
        DD(space_index(ii,jj),space_index(ii,jj-1))=1;
    end
end

for ii=2:n-1 
        DD(space_index(ii,1),space_index(ii+1,1))=1;  %% no flux bdd cond
        DD(space_index(ii,1),space_index(ii-1,1))=1;
        DD(space_index(ii,1),space_index(ii,2))=2;

        DD(space_index(ii,n),space_index(ii+1,n))=1;  %% no flux bdd cond
        DD(space_index(ii,n),space_index(ii-1,n))=1;
        DD(space_index(ii,n),space_index(ii,n-1))=2;
        
        DD(space_index(1,ii),space_index(1,ii+1))=1;  %% no flux bdd cond
        DD(space_index(1,ii),space_index(1,ii-1))=1;
        DD(space_index(1,ii),space_index(2,ii))=2;

        DD(space_index(n,ii),space_index(n,ii+1))=1;  %% no flux bdd cond
        DD(space_index(n,ii),space_index(n,ii-1))=1;
        DD(space_index(n,ii),space_index(n-1,ii))=2;                
        
end


      DD(space_index(1,1),space_index(1,2))=2;  %% no flux bdd cond
      DD(space_index(1,1),space_index(2,1))=2;  %% no flux bdd cond
   
      DD(space_index(1,n),space_index(1,n-1))=2;  %% no flux bdd cond
      DD(space_index(1,n),space_index(2,n))=2;  %% no flux bdd cond
      
      DD(space_index(n,1),space_index(n,2))=2;  %% no flux bdd cond
      DD(space_index(n,1),space_index(n-1,1))=2;  %% no flux bdd cond
   
      DD(space_index(n,n),space_index(n,n-1))=2;  %% no flux bdd cond
      DD(space_index(n,n),space_index(n-1,n))=2;  %% no flux bdd cond

DD=(DD-4*speye(n^2))/deltax^2;

        
    




c1u=horzcat(speye(n^2), sparse(n^2,n^2));  %%% c1u projection matrix
c8u=horzcat(sparse(n^2,n^2), speye(n^2));


end


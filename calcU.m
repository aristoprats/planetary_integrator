function u_vec = calcU(objlocal, objref)
    u_vec = objlocal.Position - objref.Position;
    u_vec = u_vec/norm(u_vec);
end
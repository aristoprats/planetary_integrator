function Fmag = calcF(objref, objlocal)
    r = abs(norm(objref.Position - objlocal.Position));
    seconds_modifier = 7.4560E9;
    G = 6.67408E-11 * seconds_modifier; %N m^2 kg^-2
    % centripital acceleration force
    %   Fmag = objlocal.Mass * norm(objlocal.Velocity)^2/r; % N
    % Gravitational acceeration force
        
    Fmag = (G) * objref.Mass / r^2;
end
function main_code
    % Main call function for execution values
    clc; clear all; close all;
    fprintf('Reinitializing file: Main_Code\n#############################')
    
    % Constants
    G = 6.67408E-11; % m^3 kg^-1 s^-2
    
    %Data from Nasa
    % https://nssdc.gsfc.nasa.gov/planetary/factsheet/
    Mercury = Planet(.330E24, 4879 /2 *1000);
    Venus   = Planet(4.87E24, 12104/2*1000);
    Earth   = Planet(5.97E24, 12756/2*1000, [1.496E11, 0, 0], [0 29952 0]);
    Mars    = Planet(.642E24, 6792 /2*1000);
    % https://nssdc.gsfc.nasa.gov/planetary/factsheet/sunfact.html
    Sun     = Planet(1988500E24, 695700*1000, [0 0 0]);
    
    Planets_Array = [Mercury, Venus, Earth, Mars]
    
    sim_time = 365*24*60*60;
    transient_plot = zeros(4,sim_time/(24*60*60));
    day_ticker = 0;
    for second = 1:sim_time
        
        Earth.Position = Earth.Position + Earth.Velocity;
        
        u_vec = Sun.Position - Earth.Position;
        R = norm(u_vec);
        
        Earth.Velocity = Earth.Velocity + G*Sun.Mass/R^3*(u_vec/R);
        
        if mod(second, 24*60*60) == 0
            transient_plot(:,second) = [second, Earth.Position]';
            disp(day_ticker)
            day_ticker = day_ticker + 1;
        end
    end
    
    %transient_plot
    
    plot(transient_plot(2,:), transient_plot(3,:))
    
    
    
    
end
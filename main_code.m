function planets_array = main_code
    % Main call function for execution values
    clc; clear all; close all;
    fprintf('Reinitializing file: Main_Code\n#############################\n')
    
    % Constants
    G = 6.67408E-11; % m^3 kg^-1 s^-2
    
    % Simulation Parameters
    h_steps_per_day = 10;  
    years_to_simulate = 1000;
    number_of_plot_points = 100;
    
    %{
    %Data from Nasa
    % https://nssdc.gsfc.nasa.gov/planetary/factsheet/
    Mercury = Planet("Mercury", 3.285E23, 2439.7E3 , [6.5197E10 0] , [0 4.0919E9 0]);
    Venus   = Planet("Venus"  , 4.867E24, 6051.8E3 , [1.0774E11 0 0] , [0 3.0257E9 0]);
    Earth   = Planet("Earth"  , 5.97E24, 6371E3, [1.496E11 0 0] , [0 2.5680E9 0]);
    Mars    = Planet("Mars"   , 6.39E23, 3389.5E3, [2.2114E11 0 0] , [0 2.0736E9 0]);
    % https://nssdc.gsfc.nasa.gov/planetary/factsheet/sunfact.html
    Sun     = Planet(1988500E24, 695700*1000, [0 0 0]);
    %}
    %{
        %Planet definitions at average distance
    Mercury = Planet("Mercury", 3.285E23, 2439.7E3 , 'm.', [6.5197E10 0 0] , [0 4.0919E9 0]);
    Venus   = Planet("Venus"  , 4.867E24, 6051.8E3 , 'c.', [1.0774E11 0 0] , [0 3.0257E9 0]);
    Earth   = Planet("Earth"  , 5.97E24, 6371E3,     'r.', [1.496E11 0 0] , [0 2.5680E9 0]);
    Mars    = Planet("Mars"   , 6.39E23, 3389.5E3,   'g.', [2.2114E11 0 0] , [0 2.0736E9 0]);
    Sun     = Planet("Sun"    , 1988500E24, 695700*1000, [0 0 0]);
    
    %}
        %Planet distances at Perihelion (closest to sun)
    Mercury = Planet("Mercury", 3.285E23, 2439.7E3 , 'm.', [46E9    0 0] , [0 4.0919E9 0]);
    Venus   = Planet("Venus"  , 4.867E24, 6051.8E3 , 'c.', [107.5E9 0 0] , [0 3.0257E9 0]);
    Earth   = Planet("Earth"  , 5.97E24, 6371E3,     'r.', [147.1E9 0 0] , [0 2.5680E9 0]);
    Mars    = Planet("Mars"   , 6.39E23, 3389.5E3,   'g.', [206.6E9 0 0] , [0 2.0736E9 0]);
    Sun     = Planet("Sun"    , 1988500E24, 695700000, 'bo',     [0 0 0] , [0   0      0]);
    planets_array = [Sun, Mercury, Venus, Earth, Mars];
    
    % Mercury test point
        %test_point = Planet(3.285E23, 2439.7E3 , [6.5197E10 0] , [0 4.0919E9 0]);
    % Venus test point
        %test_point = Planet(4.867E24, 6051.8E3 , [1.0774E11 0 0] , [0 3.0257E9 0]);
    % Earth Test Point
        test_point = Planet("Earth",5.97E24, 6371E3, [1.496E11 0 0] , [0 2.5680E9 0]);
    % Mars Test Point
        %test_point = Planet(6.39E23, 3389.5E3, [2.2114E11 0 0] , [0 2.0736E9 0]);
    origin     = Planet("Sun",1988500E24  , 4   , 'go', [0  0 0],  [0 0    0]);
    
    hold on
    %test_point = Planet(5.97E24, 12756/2, [1.496E11, 0, 0], [0 29952 0]);
    %origin     = Planet(1988500E24, 695700, [0 0 0]);
    plot3(origin.Position(1),origin.Position(2), origin.Position(3),'o')
    
    %plot3(test_point.Position(1), test_point.Position(2), test_point.Position(3), 'x')
    

    days_to_span = round(years_to_simulate*365);
    dt = 1 / h_steps_per_day;
    total_time_span = days_to_span * h_steps_per_day;
    setglobalPlotPoints(number_of_plot_points);
    
    for step = 1:total_time_span
        
        if mod(step, round(total_time_span / 100)) == 0
            for planet_idx = 1:size(planets_array,2)
                %test_point.update_position(origin, dt);
                local_planet = planets_array(planet_idx);
                local_planet.store_position;
            end    
        end
        
        for planet_idx = 1:size(planets_array,2)
            %test_point.update_position(origin, dt);
            local_planet = planets_array(planet_idx);
            local_planet.update_position(dt, planets_array);
        end
        
    end
    
    for planet_idx = 1:size(planets_array,2)
            %test_point.update_position(origin, dt);
            local_planet = planets_array(planet_idx);
            plot3(local_planet.Position_History(:,1),local_planet.Position_History(:,2), local_planet.Position_History(:,3), local_planet.Color)
    end
    
    
    
    fprintf('############################# \nEnding Main_Run\n')
end
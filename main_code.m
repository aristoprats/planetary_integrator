function main_code
    % Main call function for execution values
    clc; clear all; close all;
    fprintf('Reinitializing file: Main_Code\n#############################')
    
    % Constants
    G = 6.67408E-11; % m^3 kg^-1 s^-2
    
    % Simulation Parameters
    h_steps_per_day = 10;  
    years_to_simulate = 1;
    
    %{
    %Data from Nasa
    % https://nssdc.gsfc.nasa.gov/planetary/factsheet/
    Mercury = Planet(.330E24, 4879 /2 *1000);
    Venus   = Planet(4.87E24, 12104/2*1000);
    Earth   = Planet(5.97E24, 12756/2*1000, [1.496E11, 0, 0], [0 29952 0]);
    Mars    = Planet(.642E24, 6792 /2*1000);
    % https://nssdc.gsfc.nasa.gov/planetary/factsheet/sunfact.html
    Sun     = Planet(1988500E24, 695700*1000, [0 0 0]);
    
    Planets_Array = [Mercury, Venus, Earth, Mars]
    %}

    % Mercury test point
        %test_point = Planet(3.285E23, 2439.7E3 , [6.5197E10 0] , [0 4.0919E9 0]);
    % Venus test point
        %test_point = Planet(4.867E24, 6051.8E3 , [1.0774E11 0 0] , [0 3.0257E9 0]);
    % Earth Test Point
        test_point = Planet(5.97E24, 6371E3, [1.496E11 0 0] , [0 2.5680E9 0]);
    % Mars Test Point
        %test_point = Planet(6.39E23, 3389.5E3, [2.2114E11 0 0] , [0 2.0736E9 0]);
    origin     = Planet(1988500E24  , 4   , [0  0 0],  [0 0    0]);
    
    
    %test_point = Planet(5.97E24, 12756/2, [1.496E11, 0, 0], [0 29952 0]);
    %origin     = Planet(1988500E24, 695700, [0 0 0]);
    plot3(origin.Position(1),origin.Position(2), origin.Position(3),'o')
    hold on
    plot3(test_point.Position(1), test_point.Position(2), test_point.Position(3), 'x')
    

    days_to_span = round(years_to_simulate*365);
    dt = 1 / h_steps_per_day;
    total_time_span = days_to_span * h_steps_per_day;

    for step = 1:total_time_span
        if mod(step, round(total_time_span / 100)) == 0
            % 2D plot for debug
            %plot(test_point.Position(1), test_point.Position(2),'.');
            plot3(test_point.Position(1), test_point.Position(2), test_point.Position(3),'k.');

            drawnow
            pause(.1);
        end
        dv_dt = calcU(origin, test_point) * calcF(origin, test_point);
        test_point.Velocity = test_point.Velocity + dv_dt * (dt);
        test_point.Position = test_point.Position + test_point.Velocity*dt;
    end
    
    test_point = Planet(6.39E23, 3389.5E3, [2.2114E11 0 0] , [0 2.0736E9 0]);
    
    for step = 1:total_time_span
        if mod(step, round(total_time_span / 100)) == 0
            % 2D plot for debug
            %plot(test_point.Position(1), test_point.Position(2),'.');
            plot3(test_point.Position(1), test_point.Position(2), test_point.Position(3),'m.');

            drawnow
            pause(.1);
        end
        dv_dt = calcU(origin, test_point) * calcF(origin, test_point);
        test_point.Velocity = test_point.Velocity + dv_dt * (dt);
        test_point.Position = test_point.Position + test_point.Velocity*dt;
    end
    
    test_point = Planet(4.867E24, 6051.8E3 , [1.0774E11 0 0] , [0 3.0257E9 0]);
    
    for step = 1:total_time_span
        if mod(step, round(total_time_span / 100)) == 0
            % 2D plot for debug
            %plot(test_point.Position(1), test_point.Position(2),'.');
            plot3(test_point.Position(1), test_point.Position(2), test_point.Position(3),'b.');

            drawnow
            pause(.1);
        end
        dv_dt = calcU(origin, test_point) * calcF(origin, test_point);
        test_point.Velocity = test_point.Velocity + dv_dt * (dt);
        test_point.Position = test_point.Position + test_point.Velocity*dt;
    end
    
    test_point = Planet(3.285E23, 2439.7E3 , [6.5197E10 0 0] , [0 4.0919E9 0]);
    for step = 1:total_time_span
        if mod(step, round(total_time_span / 100)) == 0
            % 2D plot for debug
            %plot(test_point.Position(1), test_point.Position(2),'.');
            plot3(test_point.Position(1), test_point.Position(2), test_point.Position(3),'c.');

            drawnow
            pause(.1);
        end
        dv_dt = calcU(origin, test_point) * calcF(origin, test_point);
        test_point.Velocity = test_point.Velocity + dv_dt * (dt);
        test_point.Position = test_point.Position + test_point.Velocity*dt;
    end
    fprintf('############################# \nEnding Main_Run\n')
end
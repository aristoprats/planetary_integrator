classdef Planet
    % Generic Planet Data Class
    properties
        Mass
        Radius
        Velocity = [0 0 0]
        Position = [0 0 0]
    end
    methods
        function obj = Planet(Mass,Radius,Position, Velocity) 
            obj.Mass = Mass;
            obj.Radius = Radius;

            if exist('Position', 'var')
                obj.Position = Position;
            end
            if exist('Velocity', 'var')
                obj.Velocity = Velocity;
            end
        end
    end
end
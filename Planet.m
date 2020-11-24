classdef Planet
    % Generic Planet Data Class
    properties
        Mass
        Radius
    end
    methods
        function obj = Planet(Mass,Radius) 
            obj.Mass = Mass;
            obj.Radius = Radius;
        end
    end
end
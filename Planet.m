classdef Planet < handle
    % Generic Planet Data Class
    properties
        Name
        Mass
        Radius
        Velocity = [0 0 0]
        Position = [0 0 0]
        Color 
    end
    methods
        function obj = Planet(Name, Mass,Radius,Color, Position, Velocity) 
            obj.Name = Name;
            obj.Mass = Mass;
            obj.Radius = Radius;
            obj.Color  = Color;

            if exist('Position', 'var')
                obj.Position = Position;
            end
            if exist('Velocity', 'var')
                obj.Velocity = Velocity;
            end
        end
        
        function update_position(obj, other_obj, dt)
           local_dv = calcU(other_obj, obj) * calcF( other_obj, obj);
           obj.Velocity = obj.Velocity + local_dv * dt;
           obj.Position = obj.Position + obj.Velocity*dt;
           
        end
    end
end
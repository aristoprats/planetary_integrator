classdef Planet < handle
    % Generic Planet Data Class
    properties
        Name
        Mass
        Radius
        Velocity = [0 0 0]
        Position = [0 0 0]
        Color 
        Position_History
    end
    methods
        function obj = Planet(Name, Mass,Radius,Color, Position, Velocity) 
            obj.Name = Name;
            obj.Mass = Mass;
            obj.Radius = Radius;
            obj.Color  = Color;
            
            global globalPlotPoints
            num_plot_points = globalPlotPoints;
            num_plot_points = 100;
            obj.Position_History = zeros(num_plot_points, 3);

            if exist('Position', 'var')
                obj.Position = Position;
            end
            if exist('Velocity', 'var')
                obj.Velocity = Velocity;
            end
        end
        
        function update_position(obj, dt, plt_array)
           local_dv = [0 0 0];
           for plt = 1:size(plt_array,2)
               obj_that = plt_array(plt);
               if norm(obj.Position - obj_that.Position) ~= 0
                    local_dv = local_dv + calcU(obj_that, obj) * calcF(obj_that, obj);
               end
           end
           
           obj.Velocity = obj.Velocity + local_dv * dt;
           obj.Position = obj.Position + obj.Velocity*dt;
           
        end
        
        function store_position(obj)
            location = [obj.Position(1), obj.Position(2), obj.Position(3)];
            obj.Position_History = [obj.Position_History(2:end, :); location];
        end
    end
end
function main_code
    % Main call function for execution values
    clc; clear all; close all;
    fprintf('Reinitializing file: Main_Code\n#############################')
    
    %Data from Nasa
    % https://nssdc.gsfc.nasa.gov/planetary/factsheet/
    Mercury = Planet(.330E24, 4879 /2 *1000);
    Venus   = Planet(4.87E24, 12104/2*1000);
    Earth   = Planet(5.97E24, 12756/2*1000);
    Mars    = Planet(.642E24, 6792 /2*1000);
    
    Planets_Array = [Mercury, Venus, Earth, Mars]
    
    
end
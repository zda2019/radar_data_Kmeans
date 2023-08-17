function displayParameters(tPulse, pulDur, bWidth,detFc, doa,d)

disp(['Pulse repetition interval = ', num2str(tPulse*1e6), ' microseconds']);
disp(['Pulse duration = ', num2str(pulDur*1e6), ' microseconds']);
disp(['Pulse bandwidth = ', num2str(bWidth*1e-6), ' MHz']);
disp(['Center frequency = ', num2str(detFc*1e-9), ' GHz']);
disp(['Azimuth angle of emitter = ', num2str(doa(1)), ' degrees']);
disp(['Elevation angle of emitter = ', num2str(doa(2)), ' degrees']);
disp(['Distance of the emitter = ', num2str(d), ' m']);

end
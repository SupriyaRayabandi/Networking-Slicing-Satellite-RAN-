clc;
clear;
close all;

%% ---------------- Scenario Setup ----------------
sc = satelliteScenario( ...
    datetime(2025,11,29,23,0,0), ...
    datetime(2025,11,30,23,0,0), ...
    10);  % Sample time in seconds

%% Ground Station: Cleveland, OH
gs = groundStation(sc, 41.5, -81.7, ...
    'Name', 'Cleveland GS', ...
    'MinElevationAngle', 0);

%% Orbit Parameters (LEO, Circular)
earthRadius_km = 6371;
altitude_km    = 700;
a_km           = earthRadius_km + altitude_km;
ecc            = 0;
inc_deg        = 55;
RAANs_deg      = [0, 60, 120];
trueAnoms_deg  = [0, 30, 60];

%% Slice Satellites: eMBB, URLLC, mMTC
sliceNames  = ["eMBB", "URLLC", "mMTC"];
sliceColors = {'red', 'green', 'blue'};
sliceSats   = cell(1,3);

for k = 1:3
    sliceSats{k} = satellite(sc, ...
        a_km * 1000, ecc, inc_deg, RAANs_deg(k), 0, trueAnoms_deg(k), ...
        'Name', char(sliceNames(k)));
end

%% Access Analysis
acc = cell(1,3);
for k = 1:3
    acc{k} = access(sliceSats{k}, gs);
end

%% ---------------- Access Interval Plots ----------------
figure('Name','Access Intervals','NumberTitle','off');
xStart = datenum(sc.StartTime);
xStop  = datenum(sc.StopTime);

for k = 1:3
    subplot(3,1,k);
    intv = accessIntervals(acc{k});
    if ~isempty(intv.StartTime)
        starts = datenum(intv.StartTime);
        stops  = datenum(intv.EndTime);
        hold on;
        for j = 1:numel(starts)
            rectangle('Position', [starts(j), 0.5, stops(j)-starts(j), 0.5], ...
                      'FaceColor', sliceColors{k}, 'EdgeColor', 'none');
        end
        xlim([xStart, xStop]);
        datetick('x','HH:MM','keeplimits');
        ylim([0 1.5]);
        ylabel(char(sliceNames(k)));
        title(sprintf('Access: %s → Cleveland GS', char(sliceNames(k))));
        grid on;
        set(gca, 'YTick', []);
    else
        xlim([xStart, xStop]);
        datetick('x','HH:MM','keeplimits');
        ylim([0 1.5]);
        ylabel(char(sliceNames(k)));
        title(sprintf('Access: %s → Cleveland GS', char(sliceNames(k))));
        grid on;
        set(gca, 'YTick', []);
        text(mean([xStart, xStop]), 0.75, ...
             'No access during scenario window', ...
             'HorizontalAlignment','center');
    end
end
sgtitle('Satellite-to-Ground Station Access Windows');
drawnow; pause(1);

%% ---------------- Network Slicing QoS Graphs ----------------
totalCap   = 20;                 % Mbps
share      = [0.6, 0.25, 0.15];  % eMBB, URLLC, mMTC
capacity   = totalCap * share;
latency_ms = [40, 15, 100];      % ms
pktLoss_pc = [1, 0.5, 3];        % %

figure('Name','NTN RAN Network Slicing Performance','NumberTitle','off');

% Throughput
subplot(3,1,1);
b = bar(categorical(sliceNames), capacity, 'FaceColor','flat');
b.CData = [1 0 0; 0 1 0; 0 0 1];
ylabel('Throughput (Mbps)');
title('Throughput per Slice');
grid on;

% Latency
subplot(3,1,2);
b = bar(categorical(sliceNames), latency_ms, 'FaceColor','flat');
b.CData = [1 0 0; 0 1 0; 0 0 1];
ylabel('Latency (ms)');
title('Latency per Slice');
grid on;

% Packet Loss
subplot(3,1,3);
b = bar(categorical(sliceNames), pktLoss_pc, 'FaceColor','flat');
b.CData = [1 0 0; 0 1 0; 0 0 1];
ylabel('Packet Loss (%)');
title('Packet Loss per Slice');
grid on;

sgtitle('NTN RAN Network Slicing KPIs (Illustrative)');
drawnow; pause(1);

%% ---------------- Satellite Scenario Viewer ----------------
viewer = satelliteScenarioViewer(sc, 'ShowDetails', true);
play(sc);

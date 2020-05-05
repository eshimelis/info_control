% Extract Solution.                       
solution = output.result.solution;
time = solution.phase.time;
state = solution.phase.state;
control = solution.phase.control;

%%
figure(1); clf; set(gcf, 'position', [1925, 1500, 1500, 1000]);
subplot(2, 2, 1); hold on; set(gca, 'DefaultLineLineWidth', 2);

% add obstacles
% plotRectObstacles(obstacles)
plotCircObstacles(obstacles)
% rectangle('Position', [obstacle.pos, obstacle.dim], 'FaceColor', [0 .5 .5], 'EdgeColor', 'k');

for i = 1:auxdata.numAgents
    plot(state(:, (4*i-3)), state(:, (4*i-2)), '-o', 'MarkerSize', 10);
end

format_plot(gca); axis equal; pbaspect([1 1 1]);
title("X-Y Path Trajectory");
xlabel("X Position (m)"); ylabel("Y Position (m)");

% plot map information
xlim(map.bounds.x); ylim(map.bounds.y);
plot(goal.pos(1), goal.pos(2), 'x', 'LineWidth', 3, 'MarkerSize', 15, 'Color', 'g');
plot(start.pos(1), start.pos(2), 'o', 'LineWidth', 3, 'MarkerSize', 15, 'Color', 'r');

legend("Path", "Goal", "Start");


%%
subplot(2, 2, 2); hold on; set(gca, 'DefaultLineLineWidth', 2);

for i = 1:auxdata.numAgents
    plot(time, control(:, 2*i-1), '-o');
    plot(time, control(:, 2*i), '-o');
%     plot(state(:, (4*i-3)), state(:, (4*i-2)), '-o', 'MarkerSize', 10);
end

format_plot(gca);
title("Control Input");
xlabel("Time (s)"); ylabel("Control Effort");
legend("X Control Effort", "Y Control Effort");

%%
subplot(2, 2, 3); hold on; set(gca, 'DefaultLineLineWidth', 2);

for i = 1:auxdata.numAgents
    plot(time, state(:, (4*i-3)), '-o');
    plot(time, state(:, (4*i-2)), '-o');

end
format_plot(gca);
title("Position Displacement with Time");
xlabel("Time (s)"); ylabel("Displacement (m)");
legend("X Displacement", "Y Displacement");

%%
subplot(2, 2, 4); hold on; set(gca, 'DefaultLineLineWidth', 2);
plot(time, state(:, 3), '-o');
plot(time, state(:, 4), '-o');
format_plot(gca);
title("Velocity with Time");
xlabel("Time (s)"); ylabel("Velocity (m/s)");
legend("X Velocity", "Y Velocity");

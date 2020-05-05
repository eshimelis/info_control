% Extract Solution.                       
solution = output.result.solution;
time = solution.phase.time;
state = solution.phase.state;
control = solution.phase.control;

%%
figure(2); clf; set(gcf, 'position', [0, 0, 1500, 1000]);
subplot(2, 2, 1); hold on; set(gca, 'DefaultLineLineWidth', 2);

% add obstacles
% plotRectObstacles(obstacles)
plotCircObstacles(obstacles)
% rectangle('Position', [obstacle.pos, obstacle.dim], 'FaceColor', [0 .5 .5], 'EdgeColor', 'k');

format_plot(gca); axis equal; pbaspect([1 1 1]);
title("X-Y Path Trajectory");
xlabel("X Position (m)"); ylabel("Y Position (m)");

% plot map information
xlim(map.bounds.x); ylim(map.bounds.y);
plot(goal.pos(1), goal.pos(2), 'x', 'LineWidth', 3, 'MarkerSize', 15, 'Color', 'g');
plot(start.pos(1), start.pos(2), 'o', 'LineWidth', 3, 'MarkerSize', 15, 'Color', 'r');

for i = 1:auxdata.numAgents
    h(i) = animatedline('color', 'r', 'linewidth', 5, 'MarkerSize', 10);
%     plot(state(:, (4*i-3)), state(:, (4*i-2)), '-o', 'MarkerSize', 10);
end

for i = 1:size(time, 1)
    for j = 1:auxdata.numAgents
        addpoints(h(j), state(i, (4*j-3)), state(i, (4*j-2)));
        drawnow;
        pause(0.1);
    end
end

legend("Path", "Goal", "Start");

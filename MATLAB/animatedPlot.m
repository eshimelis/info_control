% Extract Solution.                       
solution = output.result.solution;
time = solution.phase.time;
state = solution.phase.state;
control = solution.phase.control;

%%
figure(2); clf; set(gcf, 'position', [0, 0, 1100, 900]);
hold on; set(gca, 'DefaultLineLineWidth', 2);

% add obstacles
plotCircObstacles(obstacles)

format_plot(gca); axis equal; pbaspect([1 1 1]);
title("X-Y Path Trajectory");
xlabel("X Position (m)"); ylabel("Y Position (m)");

% plot map information
xlim(map.bounds.x); ylim(map.bounds.y);
plot(goal.pos(1), goal.pos(2), 'x', 'LineWidth', 5, 'MarkerSize', 25, 'Color', [0.4660, 0.6740, 0.1880]);
plot(start.pos(1), start.pos(2), 'o', 'LineWidth', 5, 'MarkerSize', 25, 'Color', [0.6350, 0.0780, 0.1840]);

h(1) = animatedline('color', [0, 0.4470, 0.7410], 'linewidth', 5, 'MarkerSize', 10);
h(2) = animatedline('color', [0.8500, 0.3250, 0.0980]	  , 'linewidth', 5, 'MarkerSize', 10);
h(3) = animatedline('color', [0.9290, 0.6940, 0.1250]	 , 'linewidth', 5, 'MarkerSize', 10);
h(4) = animatedline('color', [0.4940, 0.1840, 0.5560]	    , 'linewidth', 5, 'MarkerSize', 10);


legend("Goal", "Start", "Primary Agent", 'location', 'southeast');

for i = 1:size(time, 1)
    for j = 1:auxdata.numAgents
        addpoints(h(j), state(i, (4*j-3)), state(i, (4*j-2)));
        drawnow;
        pause(0.05);
    end
end

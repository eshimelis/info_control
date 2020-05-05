function output = maxSeparation(pos, radius)
%maxSeparation Constraint function to maintain max desired distance


centerAgent = pos(:, 1:2);
remAgents = pos(:, 3:end);

agents_N = size(remAgents, 2)/2;

centerAgent = repmat(centerAgent, 1, agents_N);

disp = remAgents - centerAgent;

output = zeros(size(centerAgent, 1), agents_N);

k = 1;
for i = 1:agents_N
    output(:, i) = sqrt(disp(:, k).^2 + disp(:, k+1).^2) - radius;
    k = k + 2;
end

end


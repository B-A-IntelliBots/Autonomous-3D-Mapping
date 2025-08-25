function state = gaCustomizedVisualizer(options, state, flag)
% GAFANCYVISUALIZER: Custom GA plot function for older MATLAB versions.
% Plots current population fitness and the evolution of best and mean fitness values.

persistent bestFitnessHistory meanFitnessHistory hFig

switch flag
    case 'init'
        % Initialize plot figure and histories
        hFig = figure('Name', 'GA Fitness Visualization', 'NumberTitle', 'off');
        bestFitnessHistory = [];
        meanFitnessHistory = [];

    case 'iter'
        % Get current generation data
        currentFitness = state.Score;
        currentBest = min(currentFitness);
        currentMean = mean(currentFitness);

        % Update histories
        bestFitnessHistory(end+1) = currentBest;
        meanFitnessHistory(end+1) = currentMean;

        % Draw subplots
        figure(hFig); clf;

        % --- Subplot 1: Current population fitness
        subplot(2,1,1);
        scatter(1:length(currentFitness), currentFitness, 'filled');
        title(sprintf('Population Fitness - Generation %d', state.Generation));
        xlabel('Individual Index');
        ylabel('Fitness Value');
        grid on;

        % --- Subplot 2: Best and Mean fitness over generations
        subplot(2,1,2);
        plot(1:length(bestFitnessHistory), bestFitnessHistory, 'b-', 'LineWidth', 1.5); hold on;
        plot(1:length(meanFitnessHistory), meanFitnessHistory, 'r--', 'LineWidth', 1.5);
        legend('Best Fitness', 'Mean Fitness', 'Location', 'northeast');
        title('Best & Mean Fitness Across Generations');
        xlabel('Generation');
        ylabel('Fitness Value');
        grid on;

    case 'done'
        % Optionally display a final message
        disp('GA plot completed.');
end
end

function X=Viabilidade(herois, viloes, NumGenes)

dataFolder = '../data/';

% Carrega as abilidades dos personagens
v = ListaAtributos(strcat(dataFolder, 'marvel_character.csv'));
v(:, 7) = [];

% Matriz com o PowerGrid dos herois e vilões
heroesP = zeros(NumGenes, 6);
viloesP = zeros(NumGenes, 6);

% Obtem os atributos dos herois
j = 0;
for i = 1:NumGenes
	if herois(i) > 0
		j = j +1;
		heroesP(j,:) = v(herois(i),:);
	end
end

numHerois = j;

% Obtem os atributos dos viloes
j = 0;
for i = 1:NumGenes
	if viloes(i) > 0
		j = j +1;
		viloesP(j,:) = v(viloes(i),:);
	end
end

% Verifica viabilidade de cada abilidade
scoreH = sum(heroesP);
scoreV = sum(viloesP);

viavel = 1;

for i = 1:6
	if scoreH(i) * NumGenes < scoreV(i) * numHerois
		viavel = -1;
		break
	end
end

finalScore = abs(sum(scoreH)/6 - sum(scoreV)/6) * viavel;

% Retorna a diferença entre o power grid médio dos heróis e o dos vilões.
% Caso a solução seja viável o valor é positivo, se não o valor será negativo.
X = finalScore;
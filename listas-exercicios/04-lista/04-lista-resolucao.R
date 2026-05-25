# Arquivo: 04-lista-resolucao.R
# Autor(a): GISLAINE ALVES
# Data: 19/05/2026
# Objetivo: Resolução da Lista de Exercícios 4

# Configurações globais --------------------------------------

# Configura o número de dígitos exibidos
options(digits = 5, scipen = 999)


# Exercício 2 ------------------------------------------------

# a)
# total de conjuntos diferentes de 20 números sorteados entre 100
total_resultados <- choose(100, 20)
total_resultados


# b)
# resultados favoráveis: os 20 números sorteados precisam estar
# dentro dos 50 números escolhidos na aposta
resultados_favoraveis <- choose(50, 20)
resultados_favoraveis


# c)
# probabilidade de acertar os 20 números
prob_acertar_20 <- resultados_favoraveis / total_resultados
prob_acertar_20

# forma alternativa de interpretação: uma chance em quantas apostas?
uma_chance_em <- 1 / 20
uma_chance_em


# d)
# Escreva sua interpretação como comentário.



# Exercício 3 ------------------------------------------------

# probabilidade teórica do evento A: obter 5 ou 6
prob_teorica <- 2 / 6
prob_teorica

# resultados possíveis do dado
dado <- 1:6

# número de lançamentos
n <- 100

# fixa a semente para reprodutibilidade
set.seed(123)

# simula os lançamentos
# dica: em um dado equilibrado, todas as faces têm a mesma probabilidade
lancamentos <- sample(
  x = dado,
  size = n,
  replace = TRUE,
  prob = rep(1 /6, 6)
)

# evento A: resultado maior ou igual a 5
evento_A <- lancamentos >= 5

# número de lançamentos favoráveis ao evento A
favoraveis <- sum(evento_A)
favoraveis

# frequência relativa do evento A
freq_relativa <- mean(evento_A)
freq_relativa

# Interpretação
# A probaade teorica é 2/6 = 1/3, aproximadamente 0,333.
# As frequencias relativas simuladas não precisam ser exatamente iguais
# A probabilidade teorica, especialmentequando n é pequeno
# Em geral, quando n aumenta, a frequencia relativa tende se aproximar da probabilidade rica




# Depois de completar para n = 100, altere n para 1000 e 10000.



# Exercício 5 ------------------------------------------------


# Cálculo do valor esperado com R

# parâmetros do modelo
prob_incendio <- 0.01
indenizacao <- 150000
carregamento <- 0.25

# valor esperado de indenização por residência
valor_esperado <- prb_incendio * indenizacao

# exibe o resultado
valor_esperado

# prêmio anual por residência com acréscimo
premio <- valor_esperado * (1 + carregamento)

# exibe o resultado
premio


# a) o valor esperado de indenização é R$ 1.500 por dencia por ano. Ele representa
# a média teorica das indenizaçoes por residencias em carteira grande de riscos semelhantes.


# b) o valor esperado não significa que toda residencias traz indenização de R$1.500
# Para uma residencia individual, a indenizacao será R$ 0 se não houver incendio ou 
# R$ 150.000houver incendio


# c) o calculo é simplificado. Ele ignora despesas administrativas, impostos,
# corretagem, inadimplencia, capital regulatorio, reseguro, eventos extern e possiveis
# erros na estimativa da probabilidade de incendio.



# Exercício 6 ------------------------------------------------

# fixa a semente para obter os mesmos resultados ao reexecutar
set.seed(2)

# tamanho da carteira de residências seguradas
n <- 100

# simula a indenização de cada residência: 0 ou valor total da indenização
indenizacoes <- sample(
  x = c(0, indenizacao),
  size =n,
  replace = TRUE,
  prob = c(1 - prob_incendio, prob_incendio)
)

# média das indenizações por residência na carteira simulada
media_indenizacoes <- mean(indenizacoes)
media_indenizacoes

# total de indenizações pagas pela seguradora
total_indenizacoes <- sum(indenizacoes)
total_indenizacoes

# total arrecadado com os prêmios cobrados
total_premios <- n * premio
total_premios

# resultado simplificado da carteira: prêmios recebidos menos indenizações pagas
resultado_carteira <- total_premios - total_indenizacoes
resultado_carteira

# Depois de completar para n = 100, altere n para 10000 e 100000.

# a) Quando n aumenta, a média das indenizacoes por residencias tende a ficar mais
# proxima do valor esperado teorico, conforme previsto pela lei dos grandes numeros.


# b) a média das indenizacoes tende a se aproximar de R$ 1.500, que  valor esperado
# de indenizacao por residencia.


# c) Uma carteira maior tende a tornar a média das indenizacoes mais previsivel porque
# a frequencia relativa de incendio tende a se aproximar da probabilidade teorica de 1%.
# Isso é ua aplicacao ei em grandes numeros.


# d) o risco nao desaparece completamente. A seguradora ainda pode ser afetada por ventos
# extermos,depedencia entre riscos, erro na estimativa da probabilidade de incendio e custos 
# que nao foram incluidos neste modelo simples.












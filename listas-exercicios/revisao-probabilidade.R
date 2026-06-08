# Arquivo: revisao-probabilidade.R
# Autor: GISLAINE A
# Data: 08/06/2026
# Objetivos:
# Exercícios de revisão para a avaliação 2

# Configurações globais -------------------------------------------

# exibe números sem notação científica
options(digits = 5, scipen = 999)

# Orientação:
# Nos Exercícios 1, 2 e 3, escreva as respostas como comentários.
# No Exercício 4, complete e execute o código em R.


# Exercício 1 -----------------------------------------------------
# Experimento, evento e variável aleatória

# a) s={COMPRA, NÃO-COMPRA}


# b) A = {COMPRA}


# c) P(A) OU P(COMPRA)


# d) Não, Porque os resultados possiveis são categorias (COMPRA e NÃ0-COMPRA) e
# não numeros 



# e) x = {O, SE O CLIENTE REALIZOU A NÃO-COMPRA}
#    x = {1, SE O CLIENTE REALIZOU A COMPRA}


# Exercício 2 -----------------------------------------------------
# Valor esperado em uma decisão simples

# a) Valores possíveis de X1 E: R$ 0, senão houver garantia
#                         x2 E: R$ 500,00 se a garantia for acionada

# b) P(X = 500) = 0.04


# c) P(X = 0) = P(x0)
# 1-P(x=500.000) = 1 - 0.04 = 0.96


# d) E(X) = (0 * 0.96) + (500.00 * 0.04)
# E(X) = 0 + 20
# E(X) = 20


# e) Interpretação do valor esperado:
#  VALOR ESPERADO DE R$ 20.00 SIGNIFICA QUE, EM MÉDIA, A EMPRESA GASTA R$ 20.00
# COM CUSTOS DE GARANTIA PARA CADA PRODUTO VENDIDO.
# NA PRATICA, ISSO NÃO SIGNIFICA QUE UM UNICO CLIENTE VAI CUSTAR R$ 20.00
# ( OU ELE CUSTA R$ 0 OU CUSTA R$500).
# MAS AO VENDER MILHARES DE PRODUTOS, O CUSTO TOTAL COM REPAROS DIVIDIDO PELO
# TOTAL DE PRODUTOS VENDIDOS VAI SE APROXIMAR DE R$ 20.00 POR UNIDADE.
# ESSA INFORMAÇÃO É VITAL PARA EMPRESA DECIDIR, POR EXEMPLO, QUAL O PREÇO 
# MINIMO QUE ELA DEVE COBRAR PARA VENDER ESSA GARANTIA ESTENDIDA SEM TER PREJUIZO


# Exercício 3 -----------------------------------------------------
# Escolha de distribuição de probabilidade

# a) Obsservar se um cliente realizou ou não uma compra apos receber uma campanha.
# Modelo: BERNOULLI
# justificativa: A variavel observada é qualitativa binária, possuindo apenas 
# dois resultados possiveis (sucesso ou fracasso) em uma unica tentativa.

# b) Contar quantos clientes converteram entre 300 clientes contratados.
# Modelo: Binomial
# Justificativa: a variavel conta o numero total de sucessos (conversoes)
# em um numero fixo e conhecido de tentadivas indepedentes ( $n=300$)

# c) Contar quantos clientes chegam a uma unidade de atendimento em uma hora de pico
# Modelo: Poisson
# Justificativa: a variavel é uma contagem de eventos discreto que ocorem de forma 
# indepennte ao longo de um intervalo continuo de tempo determinado ( uma hora)


# d) Modelar a variação percentual mensal de um custo em relação ao orçamento,
# assumindo valores aproximadamente simetricos em torno de uma média.
# Modelo: Normal
# justificativa: a variavel observada é continua e apresenta um distribuição
# simetrica formato de sino concentrando a maior frequencia de dados ao redor
# da média.


# Exercício 4 -----------------------------------------------------
# Simulação com distribuição de Poisson
# escreva, complete e execute o código fornecido
# fixa a semente para reprodutibilidade
set.seed(123)

# define os parâmetros da simulação
lambda <- 12
capacidade <- 15
n_simulacoes <- 1000

# item a) simula 1.000 realizações de X
# cada valor é uma contagem de clientes em uma hora de pico

clientes <- rpois(n = n_simulacoes, lambda = lambda)
# exibe as primeiras contagens simuladas de clientes
head(clientes)

# item b) calcula a média simulada de clientes por hora de pico
media_simulada <- mean(clientes)
media_simulada

# item c) calcula a proporção de simulações em que a capacidade
# de 15 clientes foi excedida pela contagem de clientes
prop_acima_capacidade <- mean(clientes > capacidade)
prop_acima_capacidade

# item d) calcula o percentil 95 da contagem de clientes por hora de pico
percentil_95 <- quantile(clientes, 0.95)
percentil_95

# e) Interpretação da capacidade atual

# A média simulada ficou próxima de 12 clientes por hora, como esperado
# pelo modelo Poisson(lambda = 12).
#
# A capacidade de 15 clientes foi excedida em cerca de 14,4% dos valores
# simulados. Portanto, em uma hora de pico sob esse modelo, a unidade ficaria
# acima da capacidade com alguma frequência.
#
# O percentil 95 foi igual a 18. Nesta simulação, isso indica que uma
# capacidade de 18 clientes por hora cobriria cerca de 95% das simulações.
#
# Assim, se a prioridade for reduzir saturação no horário de pico,
# a capacidade atual de 15 clientes por hora parece limitada. Se a unidade
# aceitar alguma espera em parte das horas de pico, essa capacidade ainda
# pode ser defendida, mas com risco operacional visível.





























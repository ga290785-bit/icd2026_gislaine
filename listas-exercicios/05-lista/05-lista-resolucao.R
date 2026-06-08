# Arquivo: 05-lista-resolucao.R
# Autor(a): Gislaine
# Data:25/05/2026
# Objetivo: Resolução da Lista de Exercícios 5

# Configurações globais --------------------------------------

options(digits = 5, scipen = 999)

# carrega os pacotes usados
library(tidyverse)


# Exercício 1 ------------------------------------------------
# Campanha de marketing por e-mail

# Parâmetros do modelo:
# n_emails é o número de contatos realizados em cada semana.
# prob_conversao é a probabilidade histórica de conversão de cada contato.
# n_semanas é o número de semanas simuladas no computador.
n_emails <- 600
prob_conversao <- 0.7
n_semanas <- 500

# Fixa a semente para reprodutibilidade
set.seed(123)

# Simula o número de conversões em cada semana.
# Cada valor do vetor conversoes representa uma semana simulada.
conversoes <- rbinom(
  n = n_semanas,       # use n_semanas
  size = n_emails,    # use n_emails
  prob = prob_conversao     # use prob_conversao
)

# Mostra os dez primeiros valores simulados.
head(conversoes, 10)

# Média das conversões simuladas.
mean(conversoes)

# desvio-padrão das conversões simuladas
sd(conversoes)


# quantis/percentis 5% e 95%: faixa central de aproximadamente 90% das semanas.
faixa_central_conversoes <- quantile(conversoes, c(0.05,0.95))
faixa_central_conversoes

# Proporção de semanas com baixo desempenho.
# A expressão conversoes < limite retorna TRUE/FALSE; mean() calcula a proporção.
prob_baixo_desempenho <- mean(conversoes < 35)
prob_baixo_desempenho

# Proporção de semanas com desempenho alto.
prob_alto_desempenho <- mean(conversoes >= 55)
prob_alto_desempenho

# Interpretação:
# Escreva aqui se uma semana com menos de 35 conversões parece variação
# plausível do processo ou sinal forte de problema.

# Interpretação: Com os parametros usados, a média simulada fica proxima a 42 conversoes
# por semana, que é o valor teorico 600*(0.07).
# Na simulação, uma semana com menos de 35 conversõesocorrem em 12% das semanas.
# Portanto, uma unica semana abaixo desse limite ainda parece uma variação plausivel do
# processo, não um sinal forte de problemapor si só.
# Semanas com 55 conversões ou mais são menos frequentes (cerca de 3%), mas também podem
# ocorrer dentro  da variabilidade esperada.
# O resultado ficaria mais preocupante se o baixo desempenho se repetisse várias semanas
# ou viesse acaompanhado de evidencias externas.

# Exercício 2 ------------------------------------------------
# Atendimento em hora de pico

# Parâmetros do modelo:
# lambda é o número médio de clientes por hora de pico.
# capacidade é o número de clientes que a unidade consegue atender por hora.
# n_horas é o número de horas de pico simuladas.
lambda <- 18
capacidade <- 22
n_horas <- 10000

# Fixa a semente para que a simulação possa ser reproduzida.
set.seed(456)

# Simula o número de clientes em cada hora de pico.
# Cada valor do vetor clientes representa uma hora simulada.
# use n_horas
# use lambda
clientes <- rpois(
  n = n_horas,         
  lambda = lambda      
)

# Mostra os dez primeiros valores simulados.
head(clientes, 10)


# Média e variância simuladas.
# Na distribuição de Poisson, média e variância teóricas são iguais a lambda.
mean(clientes)
var(clientes)


# Proporção de horas em que a demanda excede a capacidade.
prob_saturacao_atual <- mean(clientes > capacidade)
prob_saturacao_atual

# Capacidade que cobre aproximadamente 95% das horas simuladas.
capacidade_95 <- quantile(clientes, 0.95)
capacidade_95

# Observação:
# se o quantil não for inteiro, a capacidade operacional deve ser
# arredondada para cima, pois não é possível atender uma fração de cliente.

# Clientes excedentes médios por hora.
# if_else() calcula o excedente quando há saturação e zero caso contrário.
excedente_medio_atual <- mean(
  if_else(clientes > capacidade, clientes - capacidade, 0)
)

# exibe o resultado
excedente_medio_atual

# Comparação de políticas de capacidade.
capacidades <- c(20, 22, 25)

# Proporção de horas em que cada capacidade fica saturada.
prob_saturacao <- c(
  mean(clientes > 20),
  mean(clientes > 22),
  mean(clientes > 25)
)

# Clientes acima da capacidade, considerando todas as horas simuladas.
excedente_medio <- c(
  mean(if_else(clientes > 20, clientes - 20, 0)),
  mean(if_else(clientes > 22, clientes - 22, 0)),
  mean(if_else(clientes > 25, clientes - 25, 0))
)

# Capacidade ociosa, considerando todas as horas simuladas.
ociosidade_media <- c(
  mean(if_else(clientes < 20, 20 - clientes, 0)),
  mean(if_else(clientes < 22, 22 - clientes, 0)),
  mean(if_else(clientes < 25, 25 - clientes, 0))
)

# Organiza os resultados em uma tabela.
politicas_capacidade <- tibble(
  capacidade = capacidades,
  prob_saturacao = prob_saturacao,
  excedente_medio = excedente_medio,
  ociosidade_media = ociosidade_media
)

# exibe o resultado
politicas_capacidade

# Interpretação:
# Escreva aqui qual capacidade parece mais razoável, considerando saturação
# e ociosidade.

# Interpretação : a capacidade de 20 clientespor hora reduz teem um menor ociosidade,
# mais gera saturação elevada : cerca de 27% das horas simuladasficam acima da 
# capacidade.A capacidade atual de 22 clientespor hora reduz a saturação, mais ainda
# deixa cerca de 15% das horas simuladas acima de capacidade.
# A capacidade de 25 clientes por hora reduz a saturação para cerca de 5%, mas 
# aumentaa capacidade ociosa média.
# Além disso, 25 clientes por hora coincide com o quantil de 95% da simulação, ou seja
# atende aproximadamente 95% da horas simuladas.
# Se a prioridade for reduz espera e preservar a qualidade do atendimento mo pico,
# a capacidade de 25 parece mais adequada. Se o custo da ociosidade pesar mais e a 
# unidade aceitar mais saturação, a capacidade atual de 22 também pode ser definida.
# A simulação não decide sozinha: ela quantifica  o trade-off.


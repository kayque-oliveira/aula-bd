SELECT q.titulo as titulo, quest.enunciado as enunciado 
FROM questionario q, associa ac, questao quest
WHERE (q.cod = ac.questionarioCod) 
AND (quest.cod = ac.questaoCod)
AND (q.dataCriacao > '2019-03-20');
SELECT quest.titulo as titulo, count(ac.questaocod) as quantQuestoes 
FROM questionario quest INNER JOIN associa ac
ON (quest.cod = ac.questionariocod)
GROUP BY titulo;
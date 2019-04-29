SELECT u.login as login,
	   q.titulo as titulo,
	   quest.enunciado as enunciado,
	   r.resposta as resposta,
	   e.email as email
FROM usuario u, questionario q, questao quest, responde r, email e
WHERE (u.cod = r.respondenteCod)
AND (quest.cod = r.questaoCod)
AND (q.cod = r.questionarioCod)
AND (u.cod = e.usuarioCod)
AND (u.cod = 3);

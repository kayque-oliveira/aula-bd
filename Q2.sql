SELECT u.login as login, count(resp.questionariocod) as quantQuestionarios 
FROM usuario u INNER JOIN responde resp
ON (resp.respondentecod = u.cod) 
GROUP BY login
HAVING (count(resp.questionariocod) > 5);
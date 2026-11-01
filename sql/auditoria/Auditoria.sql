-- ---------------- AUDITORIA ----------------- --
SELECT
    cp.id_pagamento, cp.tipo, cp.status AS status_conta, cp.dt_vencimento, cp.dt_pagamento, cp.valor 
    AS valor_conta, pg.valor AS valor_registrado, CASE WHEN cp.status = 'Pago'
    
   AND pg.id_pagamento IS NULL
   THEN 'Conta marcada como paga, mas sem registro em PAGAMENTO' WHEN cp.status IN ('Pendente', 'Atrasado')
   AND pg.id_pagamento IS NOT NULL
   THEN 'Existe registro de pagamento, mas a conta nao esta paga' WHEN cp.status = 'Pago'
   AND cp.dt_pagamento IS NULL
   THEN 'Conta paga sem data de pagamento' WHEN pg.id_pagamento IS NOT NULL
   AND cp.valor <> pg.valor
   THEN 'Divergencia entre os valores registrados' WHEN pg.id_pagamento IS NOT NULL
   AND cp.dt_pagamento <> pg.data_pagamento
   THEN 'Divergencia entre as datas de pagamento' END AS inconsistencia FROM CONTAS_PAGAR AS cp ADD

LEFT JOIN PAGAMENTO AS pg ON cp.id_pagamento = pg.id_pagamento

WHERE (cp.status = 'Pago' AND pg.id_pagamento IS NULL)
OR (cp.status IN ('Pendente', 'Atrasado') AND pg.id_pagamento IS NOT NULL)
OR (cp.status = 'Pago' AND cp.dt_pagamento IS NULL)
OR (pg.id_pagamento IS NOT NULL AND cp.valor <> pg.valor)
OR (pg.id_pagamento IS NOT NULL AND cp.dt_pagamento <> pg.data_pagamento);

SELECT a.rgm, p.nome AS nome_aluno, a.status_al, c.id_contrato, c.status AS status_contrato
FROM ALUNO AS a INNER JOIN PESSOA AS p ON a.cpf = p.cpf
LEFT JOIN CONTRATO AS c ON a.rgm = c.rgm AND c.status = 'A' AND CURDATE() BETWEEN c.dt_i AND c.dt_f
WHERE a.status_al = 'A' AND c.id_contrato IS NULL;
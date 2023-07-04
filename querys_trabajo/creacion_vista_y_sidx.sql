USE tech_repair
GO
CREATE VIEW tecnicos_ocupados
AS
SELECT nombres, rut_tecnico 
FROM tecnicos
WHERE tecnico_id IN (SELECT tecnico_id FROM ordenes WHERE estado_id = 2 OR estado_id = 1)
GO

-- DROP VIEW tecnicos_ocupados

CREATE INDEX idx_num_serie
ON telefonos (numero_serie);
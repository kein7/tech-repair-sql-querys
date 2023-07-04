USE tech_repair
GO
-- Antes importar datos de los csv de colors, marcas, modelos y modelos_marcas

BEGIN 
	-- Create a table to store the unique random numbers
	CREATE TABLE RandomNumbers (
		ID INT IDENTITY(1,1) PRIMARY KEY,
		RandomNumber AS 'K' + RIGHT('000000000' + CAST(ID AS VARCHAR(9)), 9) UNIQUE
	)

	DECLARE @counter INT
	DECLARE @iterations INT

	SET @iterations = 10000 -- Set the number of iterations here

	SET @counter = 1
	WHILE @counter <= @iterations
	BEGIN
		-- Your code to execute for each iteration goes here
		-- Insert a row to generate the first unique random number
		INSERT INTO RandomNumbers DEFAULT VALUES
		-- Increment the counter
		SET @counter = @counter + 1
	END
	-- Retrieve the generated unique random number
	SELECT RandomNumber FROM RandomNumbers
END

-- 1224 filas deben ser

-- Declare the cursor
DECLARE cursor1 CURSOR FOR
SELECT modelos
FROM modelos_marcas
GO

BEGIN
	DECLARE @modelosColumn varchar(100)
	DECLARE @marcaID int
	DECLARE @randomValue VARCHAR(10)
	DECLARE @randomColor varchar(15)
	DECLARE @randomGamaID int
	
	-- Open the cursor
	OPEN cursor1
	-- Fetch the first row
	FETCH NEXT FROM cursor1 INTO @modelosColumn 

	-- Loop through the result set and process rows
	WHILE @@FETCH_STATUS = 0
	BEGIN
		-- Perform operations on the current row
		-- obteniendo el id de la marca correspondiente al modelo
		DECLARE @success BIT = 0;
		
		-- buscar id de la marca
		SELECT @marcaID = marca_id
		FROM marcas,modelos_marcas
		WHERE marcas.marca_telefono = modelos_marcas.marcas AND modelos = @modelosColumn 

		-- selecciona un color al azar
		SELECT TOP 1 @randomColor = Color
		FROM colors
		ORDER BY NEWID()
		
		-- selecciona una gama al azar
		SELECT TOP 1 @randomGamaID = gama_id
		FROM gamas
		ORDER BY NEWID()

		WHILE @success = 0
		BEGIN
			BEGIN TRY
				BEGIN TRANSACTION

				SELECT TOP 1 @randomValue = RandomNumber
				FROM RandomNumbers
				ORDER BY NEWID()

				INSERT INTO telefonos VALUES (1,@marcaID,@randomValue,@modelosColumn,@randomColor)
				SET @success = 1;
				COMMIT TRANSACTION
			END TRY
			BEGIN CATCH
				PRINT 'An error occurred: ' + ERROR_MESSAGE();
				ROLLBACK TRANSACTION;
			END CATCH
		END
		-- Fetch the next row
		FETCH NEXT FROM cursor1 INTO @modelosColumn
	END;

	-- Close and deallocate the cursor
	CLOSE cursor1
	DEALLOCATE cursor1
END;
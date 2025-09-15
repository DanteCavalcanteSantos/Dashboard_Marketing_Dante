/*Seleciando o banco atual*/

SELECT DB_NAME() AS banco_atual;

/*Conecta ao banco*/
USE WideWorldImporters;
GO


/*Tipo de produto*/
/*Colunas para utilizar: StockItemName (Nome do Produto), UnitPrice, ValidFrom (Data Validade)*/
select * from Warehouse.StockItems

select ValidFrom As data_Validade,
StockItemId As IdDoItem,
StockItemName as Nome_Do_Item_Estoque,
UnitPrice as Preço_Unitario
from Warehouse.StockItems

/*Quantidade de items*/
select Count(StockItemID) AS QuantidadeIds
From Warehouse.StockItems

Select * from Warehouse.StockGroups


/*Perfil Clientes e Localidade*/
Select * from Application.Countries

select Count(CountryName) as QuantidadePaises
From Application.Countries

Select * from Application.Cities



/*Clientes*/
Select * FROM Sales.Customers

select * from sales.CustomerCategories

select * from Application.People

select * from Application.People_Archive


/**/



/*Colunas sobre pessoas separadas*/
select p.ValidFrom AS Data_Registro,
	'PER' + Cast(p.PersonID AS VARCHAR) ID_Pessoa,
	pa.FullName AS nome_completo,
	CASE
		WHEN p.isSystemUser = 1 THEN 'Usuário de Sistema'
		WHEN p.isEmployee = 1 THEN 'Funcionário'
		WHEN p.isSalesPerson = 1 THEN 'Vendedor'
		ELSE 'Outro'
	END AS Tipo_Usuario
from Application.People p
	left join Application.People_Archive pa on p.PersonID = pa.PersonID







/*Vendas*/

select * from Sales.Invoices

/*Colunas que utilizarei da Sales.Invoices*/
select InvoiceDate as Data_Fatura,
InvoiceID as ID_Invoice,
OrderID AS Pedido_ID,
BillToCustomerID As Fatura_ID_Cliente,
SalespersonPersonID AS ID_Vendedor,
CustomerPurchaseorderNumber as Numero_Pedido_Compra_Cliente
From Sales.Invoices


/*Complemento da SalesInvoices*/
select * from Sales.InvoiceLines

select InvoiceID as ID_Invoice,
StockItemID as ID_Estoque,
Quantity as Quantidade,
UnitPrice as Preço_Unitario,
TaxAmount as Montante_Imposto,
LineProfit as Lucro_Linha,
ExtendedPrice AS Preço_Total
from Sales.InvoiceLines



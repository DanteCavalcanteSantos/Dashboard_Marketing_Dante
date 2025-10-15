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
/*'PER' + Cast(p.PersonID AS VARCHAR) ID_Pessoa, */
select InvoiceDate as Data_Fatura,
'INV_' + Cast(InvoiceID as varchar) ID_Invoice,
'ORD_' + Cast(OrderID AS varchar) Pedido_ID,
'INV_'+ Cast(BillToCustomerID As varchar) Fatura_ID_Cliente,
'SALES_' + Cast(SalespersonPersonID AS varchar) ID_Vendedor,
'Pedido_' + Cast(CustomerPurchaseorderNumber as varchar) Numero_Pedido_Compra_Cliente
From Sales.Invoices


/*Complemento da SalesInvoices*/
select * from Sales.InvoiceLines

SELECT TOP 100
  'INV_' + Cast(InvoiceID as varchar) ID_Invoice,
  StockItemID AS ID_Estoque,
  Quantity AS Quantidade,
  UnitPrice AS Preço_Unitario,
  TaxAmount AS Montante_Imposto,
  LineProfit AS Lucro_Linha,
  ExtendedPrice AS Preço_Total
FROM Sales.InvoiceLines;



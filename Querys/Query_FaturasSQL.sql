/*Seleciando o banco atual*/

SELECT DB_NAME() AS banco_atual;

/*Conecta ao banco*/
USE WideWorldImporters;
GO


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

select
MIN(InvoiceDate) as Data_Fatura_Antiga, /*Data mais Antiga 01/01/2013*/
MAX(invoiceDate) as Data_Fatura_Recente /*Data Mais recente 31/05/2016*/
from Sales.Invoices

/*Juntando as tabelas*/
select
i.InvoiceDate as Data_Fatura,
i.OrderID AS Pedido_ID,
i.BillToCustomerID As Fatura_ID_Cliente,
i.SalespersonPersonID AS ID_Vendedor,
i.CustomerPurchaseorderNumber as Numero_Pedido_Compra_Cliente,
il.StockItemID as ID_Estoque,
il.Quantity as Quantidade,
il.UnitPrice as Preço_Unitario,
il.TaxAmount as Montante_Imposto,
il.LineProfit as Lucro_Linha,
il.ExtendedPrice AS Preço_Total
from Sales.Invoices i
LEFT JOIN Sales.InvoiceLines il on i.InvoiceID = il.InvoiceID;



/*INSERINDO IDENTIFICADORES NOS ID*/

/*Tabela de Faturas*/
select
i.InvoiceDate as Data_Fatura,
'ORD' + Cast(i.OrderID AS VARCHAR) Pedido_ID,
'ORDC' + Cast(i.BillToCustomerID As VARCHAR) Fatura_ID_Cliente,
'VEN' + Cast(i.SalespersonPersonID AS VARCHAR) ID_Vendedor,
'STOCK' + Cast(il.StockItemID AS VARCHAR) ID_Estoque,
i.CustomerPurchaseorderNumber AS Numero_Pedido_Compra_Cliente,
il.Quantity as Quantidade,
il.UnitPrice as Preço_Unitario,
il.TaxAmount as Montante_Imposto,
il.LineProfit as Lucro_Linha,
il.ExtendedPrice AS Preço_Total
from Sales.Invoices i
LEFT JOIN Sales.InvoiceLines il on i.InvoiceID = il.InvoiceID;







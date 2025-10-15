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
/*'PER' + Cast(p.PersonID AS VARCHAR) ID_Pessoa,
select InvoiceDate as Data_Fatura,
'INV_' + Cast(InvoiceID as varchar) ID_Invoice,
'ORD_' + Cast(OrderID AS varchar) Pedido_ID,
'INV_'+ Cast(BillToCustomerID As varchar) Fatura_ID_Cliente,
'SALES_' + Cast(SalespersonPersonID AS varchar) ID_Vendedor,
'Pedido_' + Cast(CustomerPurchaseorderNumber as varchar) Numero_Pedido_Compra_Cliente
*/
select
i.InvoiceDate as Data_Fatura,
'ORD_' + Cast(i.OrderID AS varchar) Pedido_ID,
'INVC_' + Cast(i.BillToCustomerID As varchar) Fatura_ID_Cliente,
'SALES_'+ Cast(i.SalespersonPersonID AS varchar) ID_Vendedor,
'Pedido_' + cast(i.CustomerPurchaseorderNumber as varchar) Numero_Pedido_Compra_Cliente,
'IDSTOCK_'+ cast(il.StockItemID as varchar) ID_Estoque,
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
'ORD_' + Cast(i.OrderID AS VARCHAR) Pedido_ID,
'INV_' + Cast(i.BillToCustomerID As VARCHAR) Fatura_ID_Cliente,
'SALES_' + Cast(i.SalespersonPersonID AS VARCHAR) ID_Vendedor,
'STOCK_' + Cast(il.StockItemID AS VARCHAR) ID_Estoque,
	i.CustomerPurchaseorderNumber AS Numero_Pedido_Compra_Cliente,
	il.Quantity as Quantidade,
	il.UnitPrice as Preço_Unitario,
	il.TaxAmount as Montante_Imposto,
	il.LineProfit as Lucro_Linha,
	il.ExtendedPrice AS Preço_Total
from Sales.Invoices i
LEFT JOIN Sales.InvoiceLines il on i.InvoiceID = il.InvoiceID;







#Projeto em Marketing Digital

##KPI'S

## Erro de conexão Power Bi x SQL Server (System. EnterpriseServices)

Durante o projeto, durante o carregamento dos dados no Power Bi para teste, ocorreu o erro -> "Detalhes: "Falha ao carregar o arquivo do assembly ''System.EnterpriseServices, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a'' para o tipo de fonte de dados ''SQL''""

Este erro ocorre quando o Power Bi não está atualizado e estão executando em versões anteriores do gateway de dados.

Com auxilio da inteligência artificial e pesquisas na internet encontrei a seguinte solução:

1 - Atualização do .Net Framework 4.8 

![.netframework](C:\Users\dante\OneDrive\Documentos\9. Meus Projetos\Projetos Power Bi\Dashboard Marketing\Erros\.NetFramework.png)

Fonte: [Microsoft Learn — Error launching Power BI Desktop](https://learn.microsoft.com/pt-br/power-bi/connect-data/desktop-error-launching-desktop)

Por que atualizar .Net Framework?

Porque o Power Bi precisa de componentes do .NET Framework para inicializar conectores, assemblies e bibliotecas para acessar o SQL Server

2 - Atualização no Power Bi

A minha versão do Power bi também estava comprometendo a conexão com o banco de dados, portanto, utilizei o microsoft store para desinstalar e instalar novamente.

Versão anterior: 2.142.928.0 64 bit (abril de 2025)

Versão atual: 2.149.1429.0 64-bit (novembro de 2025)

Links uteis: https://serverfault.com/questions/1142336/system-enterpriseservices-error-when-trying-to-connect-excel-or-powerbi-to-a-sql
https://clickup.com/pt-BR/blog/474043/engajamento-com-o-conteudo
https://convertanaweb.com.br/calculadora-de-cpc-custo-por-clique/
https://agencianovaacao.com.br/dicionario-de-marketing/o-que-e-impressao-no-marketing-digital/
https://www.ekyte.com/guide/pt-br/conceitos/custo-por-visita-cpv-no-marketing-digital-como-calcular-e-usar/
https://blog.aqui.eletromidia.com.br/o-que-e-cpm/
https://sebrae.com.br/sites/PortalSebrae/o-que-e-ctr-no-marketing-digital-e-como-melhorar,bd09941d02597810VgnVCM1000001b00320aRCRD
https://support.google.com/analytics/answer/12159447?hl=pt-BR
https://www.docusign.com/pt-br/blog/ltv?msockid=2b3232bc532e6728001f261c522e6641
https://genyo.com.br/lei-de-pareto/

Lifetime value sofreu uma adaptação para marketing, pois não temos a informação "cliente", porém, temos a informação de "transações"

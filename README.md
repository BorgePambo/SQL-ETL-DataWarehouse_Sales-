# SQL-ETL-DataWarehouse_Sales-
TRANSFORMACAO-DADOS-DATAWAHOUSE

Data Warehouse Sistema de Integração de Dados Dimensional

Descrição
Este projeto visa a integração e análise de dados de vendas através de um modelo dimensional. Utilizando uma abordagem de ETL (Extract, Transform, Load), ele processa e organiza dados de vendas em um banco de dados relacional, utilizando o SQL Server para armazenar e manipular as informações. O projeto é estruturado em tabelas de dimensão e tabelas de fato, facilitando a análise e geração de relatórios em ferramentas como Power BI.

Fluxo do Projeto
1° Entrada de Dados: A tabela SalesRecords recebe dados de vendas, incluindo informações como produto, categoria, vendedor, quantidade, preço unitário, método de pagamento e data da venda.

2° Procedures de Integração:
          prc_insertDimension: Preenche as tabelas de dimensões com dados únicos extraídos da tabela SalesRecords, garantindo que não haja duplicação de categorias, produtos, vendedores,             ormas de pagamento e dados do calendário.
          prc_inserSalesFact: Insere os dados da tabela SalesRecords na tabela de fato SaleFact, associando as vendas às dimensões corretas (produto, categoria, vendedor, etc.).

3° Estrutura do Banco de Dados
  Tabelas de Dimensão:
    1- DimCategory: Contém as categorias dos produtos vendidos.
    2 - DimProduct: Contém os produtos vendidos.
    3 - DimPayment: Contém os métodos de pagamento utilizados nas vendas.
    4 - DimSeller: Contém os vendedores responsáveis pelas vendas.
    5 - DimCalendar: Contém informações sobre a data da venda, incluindo o ano, mês, dia, e nome do dia da semana.



4° Tabela Fato:
      SaleFact: Contém as transações de vendas, com links para as dimensões e medidas como preço unitário, quantidade vendida e valor total da venda.
   Objetivos
      Organizar e estruturar os dados de vendas de maneira eficiente.
      Criar uma base de dados otimizada para análise de vendas.
      Preencher automaticamente as tabelas de dimensão e a tabela fato com dados consistentes e sem duplicação.
      Facilitar a criação de relatórios e dashboards analíticos com base nos dados de vendas.


5° Tecnologias Utilizadas
    SQL Server: Banco de dados utilizado para armazenar os dados de vendas e criar as tabelas de dimensão e fato.
    T-SQL: Linguagem SQL utilizada para criar as stored procedures que realizam a inserção de dados nas tabelas de dimensão e fato.
    Power BI (opcional): Ferramenta recomendada para a criação de relatórios analíticos baseados nos dados estruturados.



Como Executar
  1° Configuração do Banco de Dados:
    -Crie um banco de dados no SQL Server, por exemplo, AdventureDb.
    -Importe as tabelas de dimensão (DimCategory, DimProduct, DimPayment, DimSeller, DimCalendar) e a tabela fato (SaleFact).
    
  2° Importação dos Dados:
    Insira os dados de vendas na tabela SalesRecords.
    Execução das Stored Procedures:
         Execute a stored procedure prc_insertDimension para preencher as tabelas de dimensão.
         Execute a stored procedure prc_inserSalesFact para inserir os dados da tabela SalesRecords na tabela fato.
         Relatórios:
         Conecte o banco de dados a uma ferramenta de BI, como o Power BI, e crie visualizações baseadas nas dimensões e na tabela fato.



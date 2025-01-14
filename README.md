# cursosql
PARA AVALIAÇÃO DA EQUIP DO DIO

Datalhando
 - u root                    usuário
 -p                          para solicitar senha
 --single-transaction        cria um poto de verificação para dar consistencia no backup
 -- routines                 para fazer backups de procedimentos e funções do BD
 -- triggers                 para fazer backup dos gatilhos
 o nome do banco de dados
EXEMPLO: mysqldump -u root -p ecommerce_entrega > D:\PASTABACKUP\backup.sql

Caminho:

1 - C:\Users\55719>cd C:\Program Files\MySQL\MySQL Server 9.1\bin
2 - mysql -u root -p Enter password: **********
3 - show databases;

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| company            |
| companydb          |
| ecommerce_entrega  |
| estudo_exemplo     |
| firstexample       |
| igreja             |
| information_schema |
| livraria           |
| mat_ed_especial    |
| mydb               |
| mysql              |
| oficina            |
| oficina mecânica   |
| oficina_mecânica   |
| performance_schema |
| sbd                |
| sys                |
+--------------------+

4 - mysql> use ecommerce_entrega;
Database changed

5 - show tables;
+-----------------------------+
| Tables_in_ecommerce_entrega |
+-----------------------------+
| client                      |
| departamentos               |
| disponibilizando_produto    |
| estoque                     |
| estoque_de_produto          |
| fornecedor                  |
| funcionarios                |
| gerentes                    |
| pedido                      |
| produto                     |
| produto_por_vendedor        |
| terceito_vendedor           |
+-----------------------------+

6 - abri novamente o prompt

7 - C:\Users\55719>cd C:\Program Files\MySQL\MySQL Server 9.1\bin

6 - mysqldump -u root -p ecommerce_entrega > D:\PASTABACKUP\backup.sql


FAZENDO RECOVERY

1 - create schema ecommerceNews;

2 - abri uma nova prompt de comando

3 - cd C:\Program Files\MySQL\MySQL Server 9.1\bin

4 - mysql -u root -p ecommerceNews < D:\PASTABACKUP\backup.sql

Tudo Feito!

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| company            |
| companydb          |
| ecommerce_entrega  |
| ecommercenews      |
| estudo_exemplo     |
| firstexample       |
| igreja             |
| information_schema |
| livraria           |
| mat_ed_especial    |
| mydb               |
| mysql              |
| oficina            |
| oficina mecânica   |
| oficina_mecânica   |
| performance_schema |
| sbd                |
| sys                |
+--------------------+

mysql> use ecommercenews;
Database changed
mysql> show tables;
+--------------------------+
| Tables_in_ecommercenews  |
+--------------------------+
| client                   |
| departamentos            |
| disponibilizando_produto |
| estoque                  |
| estoque_de_produto       |
| fornecedor               |
| funcionarios             |
| gerentes                 |
| pedido                   |
| produto                  |
| produto_por_vendedor     |
| terceito_vendedor        |
+--------------------------+

mysql> select * from departamentos;
+----------------+------------+-------------+
| idDepartamento | Nome       | Localização |
+----------------+------------+-------------+
|              1 | Financeiro | Bahia       |
|              2 | ADM        | Bahia       |
|              3 | TI         | Bahia       |
|              4 | Transporte | Bahia       |
|              5 | Suporte    | Bahia       |
|              6 | Estoque    | Bahia       |
|              7 | Vendas     | São Paulo   |
+----------------+------------+-------------+

mysql> select * from funcionarios;
+---------------+-------------+---------+-----------------+-------------------+
| idFuncionario | Nome        | Salario | Departamento_id | Gerente_idGerente |
+---------------+-------------+---------+-----------------+-------------------+
|             1 | Ronson      | 2500.00 |               1 |              NULL |
|             2 | Elem        | 1900.00 |               2 |              NULL |
|             3 | Roberto     | 2200.00 |               3 |              NULL |
|             4 | Afonso      | 1800.00 |               4 |              NULL |
|             5 | Crodoaldo   | 2400.00 |               5 |              NULL |
|             6 | Cristiano   | 1600.00 |               6 |              NULL |
|             7 | Alencar     | 1900.00 |               1 |              NULL |
|             8 | Frascivaldo | 2150.00 |               1 |              NULL |
|             9 | Florisvaldo | 1950.00 |               1 |                 1 |
|            10 | Ronivaldo   | 3500.00 |               4 |                 4 |
+---------------+-------------+---------+-----------------+-------------------+

mysql> delete from funcionarios where idFuncionario = 7;
Query OK, 1 row affected (0.00 sec)

mysql> select * from funcionarios;
+---------------+-------------+---------+-----------------+-------------------+
| idFuncionario | Nome        | Salario | Departamento_id | Gerente_idGerente |
+---------------+-------------+---------+-----------------+-------------------+
|             1 | Ronson      | 2500.00 |               1 |              NULL |
|             2 | Elem        | 1900.00 |               2 |              NULL |
|             3 | Roberto     | 2200.00 |               3 |              NULL |
|             4 | Afonso      | 1800.00 |               4 |              NULL |
|             5 | Crodoaldo   | 2400.00 |               5 |              NULL |
|             6 | Cristiano   | 1600.00 |               6 |              NULL |
|             8 | Frascivaldo | 2150.00 |               1 |              NULL |
|             9 | Florisvaldo | 1950.00 |               1 |                 1 |
|            10 | Ronivaldo   | 3500.00 |               4 |                 4 |
+---------------+-------------+---------+-----------------+-------------------+

mysql> UPDATE funcionarios SET salario = 4900.00  WHERE idFuncionario = 1;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from funcionarios;
+---------------+-------------+---------+-----------------+-------------------+
| idFuncionario | Nome        | Salario | Departamento_id | Gerente_idGerente |
+---------------+-------------+---------+-----------------+-------------------+
|             1 | Ronson      | 4900.00 |               1 |              NULL |
|             2 | Elem        | 1900.00 |               2 |              NULL |
|             3 | Roberto     | 2200.00 |               3 |              NULL |
|             4 | Afonso      | 1800.00 |               4 |              NULL |
|             5 | Crodoaldo   | 2400.00 |               5 |              NULL |
|             6 | Cristiano   | 1600.00 |               6 |              NULL |
|             8 | Frascivaldo | 2150.00 |               1 |              NULL |
|             9 | Florisvaldo | 1950.00 |               1 |                 1 |
|            10 | Ronivaldo   | 3500.00 |               4 |                 4 |
+---------------+-------------+---------+-----------------+-------------------+

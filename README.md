Descripción 
A partir del diagrama de clases, realizado en el primer producto, realizaremos la adaptación del diseño orientado a objetos al modelo relacional. A partir de esta adaptación implementaremos, en lenguaje Java utilizando JDBC, la persistencia en una base de datos relacional. 

Objetivos 
El objetivo principal de la actividad es: 
Aplicar la persistencia en bases de datos usando los patrones de diseño DAO y Factory. 

1. Crear la estructura en la base de datos, a partir del Modelo Relacional, es decir: tablas, claves primarias y foráneas, atributos, relaciones, etc., con base de datos relacional MySQL. 
2. Realizar un programa en Java en modo de consola que almacene la información en una base de datos relacional utilizando JDBC en lugar de estructuras dinámicas como ArrayList. 
3. En este producto se debe cambiar la forma de almacenar los datos, de forma que en lugar de almacenarlos en ArrayLists se almacenarán en una base de datos, todo ello manteniendo el patrón de diseño MVC, de esta forma, solo es necesario modificar o adaptar la implementación realizada en la capa del Modelo. 
4. Además, para separar la persistencia de los datos del resto de funcionalidades del sistema se deberá utilizar el patrón de diseño DAO (Data Access Object). Uno de los beneficios de DAO es la independencia del almacén de datos, así pues, el cambio de motor de base de datos solo afectará al DAO y no a las clases encargadas de la lógica de negocio o de presentación. o el cambio de motor de base de datos. 
5. Con el objeto de conseguir la independencia del almacén de datos se usará el patrón Factory para instanciar los DAOs. 
6. Utilizar el SGBD MySQL para realizar la persistencia. 
7. Utilizar una clase utilidad para controlar las conexiones a la Base de datos. 
8. Utilizar JDBC de forma adecuara para evitar los ataques SQL Injection. 
9. Aplicar transacciones y procedimientos almacenados en todas las operaciones DML que así lo requieran. 

Procedimientos almacenados y funciones almacenadas.

Un procedimiento almacenado es un conjunto de instrucciones SQL predefinidas que se almacenan y ejecutan dentro de la base de datos. Estos procedimientos permiten encapsular operaciones repetitivas en un solo bloque de código que se puede ejecutar cuando sea necesario.

Características:
No devuelve un valor: Un procedimiento almacenado no está diseñado para devolver un valor directamente. En su lugar, puede realizar operaciones en la base de datos (como insertar, actualizar o eliminar datos) y, si es necesario, devolver valores a través de parámetros de salida.
Puede ejecutar múltiples sentencias SQL: Un procedimiento almacenado puede contener múltiples instrucciones SQL, como SELECT, INSERT, UPDATE, DELETE, y llamadas a otros procedimientos almacenados.
Tiene parámetros de entrada y salida: Un procedimiento puede aceptar parámetros de entrada (para recibir valores al momento de la ejecución) y parámetros de salida (para devolver resultados o mensajes).
Ejecutado explícitamente: Para ejecutar un procedimiento almacenado, se debe llamar explícitamente desde una aplicación, script SQL o desde la propia consola de la base de datos.
 
Funciones Almacenadas
Una función almacenada es un bloque de código SQL predefinido que, al igual que un procedimiento, se almacena en la base de datos, pero a diferencia de los procedimientos, las funciones están diseñadas para devolver un valor al momento de su ejecución.

Características:
Devuelve un valor: A diferencia de un procedimiento, una función almacenada siempre devuelve un valor, ya sea un único valor o un conjunto de datos. El valor que retorna debe estar especificado por el tipo de datos que se define al crear la función.
Puede ser utilizada dentro de una consulta SQL: Las funciones almacenadas pueden ser utilizadas en consultas SELECT, INSERT, UPDATE, o WHERE, ya que siempre devuelven un valor que puede ser utilizado como parte de la operación.
No tiene parámetros de salida: A diferencia de los procedimientos, las funciones solo tienen parámetros de entrada.
Generalmente no tiene efectos secundarios: Las funciones deben ser idempotentes (es decir, no deben alterar el estado de la base de datos, aunque algunas bases de datos permiten efectos secundarios en funciones).

Cuándo usar cada uno?
Se usa procedimientos almacenados cuando necesitas realizar acciones como insertar, actualizar, borrar, o gestionar transacciones, y no necesitas que la operación devuelva un valor directo.
Se usa funciones almacenadas cuando necesites hacer cálculos o transformaciones de datos y devolver un valor que luego pueda ser utilizado directamente en una consulta.
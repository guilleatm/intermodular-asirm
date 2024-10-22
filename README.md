# Instalación
Para que el proyecto funcione necesitamos tener una base de datos operativa, hemos preparado una SQLite ya que almacena los datos en un fichero de texto plano.

Instalamos PHP `apt-get install php`
Instalamos SQLite `apt-get install sqlite3`
Instalamos módulo SQLite de PHP `apt-get install php-sqlite3`
Editamos configuración PHP `nano /etc/php/{version}/apache2/php.ini` descomentamos la línea `extension=pdo_sqlite` para habilitar el módulo.


# Ejecutar
Podemos ejecutar nuestro servidor web desde el propio VS Code utilizando los plugins Live Server y PHP Server


> Proyecto base: https://github.com/jrpellicer/proyectoasir
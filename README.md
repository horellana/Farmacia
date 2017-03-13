Farmacias Herrera
-----------------

Software
--------

* Version ruby: 2.4.0
* base de datos: postgresql


Como instalar
-------------

1) clonar el repositorio
2) definir la variable de entorno RAILS_ENV=production y exportarla con export RAILS_ENV
3) definir la variable de entorno FARMACIA_DATABASE_PASSWORD y exportarla con export FARMACIA_DATABASE_PASSWORD
3) hacer bundle install
4) hacer bundle exec rails assets:precompile
5) hacer bundle exec rails db:migrate
6) hacer bundle exec rails db:fixtures:load


Configuracion base de datos
---------------------------

1) puerto: 5432
2) nombre base de datos: Farmacia_production
3) nombre de usuario base de datos: Farmacia
4) la contraseña de la base de datos tiene que estar definida en la variable de entorno FARMACIA_DATABASE_PASSWORD
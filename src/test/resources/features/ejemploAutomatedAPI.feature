#language:es
@EjemploDeAutomatizacionAPIs
Característica: Automatización de APIs
  Como un estudiante de escuela
  Quiero redactar y automatizar APIs
  Para obtener valores y respuestas de las solicitudes enviadas

  #--1--
#  @Restfull-Booker @CrearTokenDinamicoHappyPath
#  Escenario: Crear token dinamico correctamente
#    Dado que configuro el body del servicio: "crearToken"
#      | key      | valor       |
#      | username | admin       |
#      | password | password123 |
#    Y configuro las cabeceras
#      | cabeceras    | valor            |
#      | Content-Type | application/json |
#    Cuando ejecuto el servicio con la configuracion del body y cabeceras
#      | servicio           | tipo                                 | url   | metodo | formato |
#      | Auth - CreateToken | https://restful-booker.herokuapp.com | /auth | POST   | txt     |
#    Entonces valido que el codigo de respuesta sea "200"
#    Y guardo la respuesta de la ejecucion
#
#  @Restfull-Booker @CrearTokenDinamicoHappyPath
#  Escenario: Crear token dinamico correctamente
#    Dado que configuro el body del servicio: "crearToken"
#      | key      | valor       |
#      | username | admin       |
#      | password | password123 |
#    Y configuro las cabeceras
#      | cabeceras    | valor            |
#      | Content-Type | application/json |
#    Cuando ejecuto el servicio con la configuracion del body y cabeceras
#      | servicio           | tipo                                 | url   | metodo | formato |
#      | Auth - CreateToken | https://restful-booker.herokuapp.com | /auth | POST   | txt     |
#    Entonces valido que el codigo de respuesta sea "200"
#    Y guardo la respuesta de la ejecucion
#  @Restfull-Booker @CrearTokenDinamicoHappyPath
#  Escenario: Obtener ID's de libros correctamente
#    Cuando ejecuto el servicio sin configuraciones
#      | servicio | tipo | url | metodo | formato |
#      | Obtener-ID-Libros | https://restful-booker.herokuapp.com | /booking | get | json |
#    Entonces valido que el codigo de respuesta sea "200"
#    Y guardo la respuesta de la ejecucion
#
#  @Restfull-Booker @CrearTokenDinamicoHappyPath
#  Escenario: Obtener ID's de libros incorrectamente
#    Cuando ejecuto el servicio sin configuraciones
#      | servicio | tipo | url | metodo | formato |
#      | Obtener-ID-Libros | https://restful-booker.herokuapp.com | /booking | post | json |
#    Entonces valido que el codigo de respuesta sea "500"
#  @Restfull-Booker @CrearTokenDinamicoHappyPath
# Esquema del escenario: Obtener un libro por un ID en especifico
#   Cuando ejecuto el servicio sin configuraciones
#     | servicio | tipo | url | metodo | formato |
#     | Obtener-Libros-ID | https://restful-booker.herokuapp.com | /booking/<id> | get | json |
#   Entonces valido que el codigo de respuesta sea "200"
#   Y guardo la respuesta de la ejecucion
#   Ejemplos:
#     | id |
#     | 3 |
#     | 4 |
#     | 9500 |



#El plus se encuentra en un mensaje en el codigo de respuesta si es 200 manda mensaje correcto si no es procede a ser respuesta erronea

  @Restfull-Booker @TareaParte1
  Escenario: Crear un libro
    Dado que configuro el body del servicio: "Post"
      | key             | valor         |
      | firstname       | Jim           |
      | lastname        | Brown         |
      | totalprice      | 111           |
      | depositpaid     | true          |
      | bookingdates.checkin         | 2018-01-01    |
      | bookingdates.checkout        | 2019-01-01    |
      | additionalneeds | Breakfast     |
    Y configuro las cabeceras
      | cabeceras       | valor                    |
      | Content-Type   | application/json         |
    Cuando ejecuto el servicio con la configuracion del body y cabeceras
      | servicio                 | tipo                                 | url       | metodo | formato |
      | Booking - CreateBooking  | https://restful-booker.herokuapp.com | /booking  | POST   | json    |
    Entonces valido que el codigo de respuesta sea "200"


  @Restfull-Booker @TareaParte1
  Escenario: Crear un libro
    Dado que configuro el body del servicio: "Post"
      | key             | valor         |
      | firstname       | Jim           |
      | lastname        | Brown         |
      | totalprice      | 111           |
      | depositpaid     | dsasdad         |
      | bookingdates.checkin         | 2018-01-01    |
      | bookingdates.checkout        | 2019-01-01    |
      | additionalneeds | Breakfast     |

    Y configuro las cabeceras
      | cabeceras       | valor                    |
      | Content-Type   | application/json         |
    Cuando ejecuto el servicio con la configuracion del body y cabeceras
      | servicio                 | tipo                                 | url       | metodo | formato |
      | Booking - CreateBooking  | https://reful-booker.herokuapp.com | /booking  | POST   | text    |
     Entonces valido que el codigo de respuesta sea "404"

    @Restfull-Booker @TareaParte1
  Escenario: Eliminar Un Libro Correctamente
    Dado configuro las cabeceras
      | cabeceras           | valor                          |
      | Cookie              | token=<token_value>            |
      | Authorization       | Basic YWRtaW46cGFzc3dvcmQxMjM= |
    Y ejecuto el servicio con la configuracion del body y cabeceras
      | servicio   | tipo                                 | url          | metodo   | formato  |
      | Booking - DeleteBooking     | https://restful-booker.herokuapp.com | /booking/18  | DELETE   | json     |
    Entonces valido que el codigo de respuesta sea "201"
    Y guardo la respuesta de la ejecucion

  @Restfull-Booker @TareaParte1
  Escenario: Eliminar Un Libro incorrectamente
    Cuando ejecuto el servicio sin configuraciones
      | servicio | tipo | url | metodo | formato |
      | DeleteToken | https://restful-booker.herokuapp.com| /booking/1 | DELETE | json |
    Y configuro las cabeceras
      | cabeceras    | valor            |
      | Content-Type | application/json |
      | Cookie       |     token=abc123                          |
    Entonces valido que el codigo de respuesta sea "403"



#  @Restfull-Booker @PATCH1
#  Escenario: Actualizar una parte del libro
#    Dado que configuro el body del servicio: "Pacho"
#      | key        | valor   |
#      | firstname  | Henry   |
#      | lastname   | Lozada   |
#
#    Y configuro las cabeceras
#      | cabecera        | valor                    |
#      | Content-Type    | application/json         |
#      | Accept          | application/json         |
#      | Cookie   | token=abc123 |
#      | Authorization   | Basic YWRtaW46cGFzc3dvcmQxMjM= |
#
#    Cuando ejecuto el servicio con la configuracion del body y cabeceras
#      | servicio                 | tipo                                 | url          | metodo | formato |
#      | Booking - UpdateBooking  | https://restful-booker.heokuapp.com | /booking/1  | PATCH    | json    |
#
#    Entonces valido que el codigo de respuesta sea "200"
    #
#  @Restfull-Booker @CrearTokenDinamicoHappyPath
#  Escenario: Actualizar un libro
#    Dado que configuro el body del servicio: "crearToken"
#      | key        | valor   |
#      | firstname  | Hnery   |
#      | lastname   | Brown   |
#
#    Y configuro las cabeceras
#      | cabecera        | valor                    |
#      | Content-Type    | application/json         |
#      | Cookie          | token=<token_value>      |
#      | Authorization   | Basic YWRtaW46cGFzc3dvcmQxMjM= |
#
#    Cuando ejecuto el servicio con la configuracion del body y cabeceras
#      | servicio                 | tipo                                 | url          | metodo | formato |
#      | Booking - UpdateBooking  | https://restful-booker.heokuapp.com | /booking/1  | PUT    | json    |
#
#    Entonces valido que el codigo de respuesta sea "200"
#    Y guardo la respuesta de la ejecucion






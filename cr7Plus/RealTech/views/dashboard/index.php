<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="../../resources/css/materialize.css">
    <link rel="stylesheet" href="../../resources/css/icons.css">
    <link rel="stylesheet" href="../../resources/css/estilos.css">
</head>

<body>
    <!--Agregar efectos al boton-->
    <!--este div lo puse yo-->
    <div class="form-login">
        <div class="row">
            <div class="col s12 l4 offset-l4">
                <div class="card">
                    <div class="card-action blue white-text">
                        <h4 class="center">Formulario de Login</h4>
                    </div>

                    <div class="card-content">

                        <div class="input-field">
                            <input type="text" id="username">
                            <label for="username">Nombre de Usuario</label>
                        </div> <br>

                        <div class="input-field">
                            <input type="password" id="password">
                            <label for="password">Contraseña</label>
                        </div> <br>

                        <div class="form-field">
                            <label for="remember">
                                <input type="checkbox" id="remember">
                                <span>Recordar</span>
                            </label>
                        </div> <br>

                        <div class="form-field">
                            <a href="#">¿Olvidastes tu Contraseña?</a>
                        </div>

                        <br>

                        <div class="form-field center">
                            <a class="btn-large blue" href="tablaProductos.php">Iniciar
                                Sesión</a>
                        </div> <br>

                    </div>
                </div>
            </div>
        </div>
    </div>



    <script src="../../resources/js/jquery-3.3.1.min.js"></script>
    <script src="../../resources/js/materialize.js"></script>
</body>

</html>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="TrabajoPFconcesionaria4.login" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <title>Iniciar Sesión</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            height: 100vh;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-container {
            background: white;
            border-radius: 16px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
            padding: 40px 35px;
            width: 100%;
            max-width: 400px;
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
            color: #2a5298;
        }

        .form-group {
            margin-bottom: 20px;
        }
        
        /* Contenedor del botón, solo para separación */
        .form-group-button {
            margin-top: 30px; 
        }

        .form-control {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            outline: none;
            font-size: 15px;
            transition: border 0.3s ease;
        }

        .form-control:focus {
            border-color: #2a5298;
        }

        /* CLASE DEL BOTÓN: Mantenemos estilos y propiedades de tamaño */
        #btnIngresar, .btn-login {
            /* Estilos Visuales Forzados */
            background: #2a5298 !important; 
            color: white !important;
            padding: 12px !important;
            border: none !important;
            border-radius: 8px !important;
            font-size: 16px !important;
            font-weight: 600 !important;
            transition: background 0.3s ease;
            
            /* Propiedades de tamaño */
            width: 60% !important; 
            max-width: 250px !important;
        }

        #btnIngresar:hover, .btn-login:hover {
            background: #1e3c72 !important;
        }

        .mensaje {
            text-align: center;
            color: red;
            margin-top: 10px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Iniciar Sesión</h2>

            <div class="form-group">
                <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" placeholder="Usuario" />
            </div>

            <div class="form-group">
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Contraseña" />
            </div>

            <div class="form-group form-group-button">
                <center>
                    <asp:Button ID="btnIngresar" 
                        runat="server"
                        Text="Ingresar"
                        CssClass="btn-login" 
                        OnClick="btnLogin_Click" />
                </center>
            </div>
            <asp:Label ID="lblMensaje" runat="server" ForeColor="Red" CssClass="mensaje" />
        </div>
    </form>
</body>
</html>
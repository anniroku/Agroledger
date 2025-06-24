<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Agroledger.Login" %>


<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>inicio de sesion</title>

    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('image/gallinitas.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.95);
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
        }

        .logo {
            text-align: center;
            margin-bottom: 20px;
        }

        .logo img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #ffffff;
        }

        h2 {
            text-align: center;
            color: #000000;
            margin-bottom: 10px;
        }

        .form-section {
            display: none;
        }

        .form-section.active {
            display: block;
        }

        label {
            display: block;
            margin-top: 12px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .asp-button {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background-color: #ec5b5b;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        .asp-button:hover {
            background-color: #e25b5b;
        }

        .volver {
            text-align: center;
            margin-top: 15px;
        }

        .volver a {
            text-decoration: none;
            color: #1d5e20;
            display: block;
            margin-top: 8px;
        }
    </style>
</head>
<body>
     <form id="form1" runat="server">
           <div class="container">
               <div class="logo">
                    <img src="image/logo_empresa.jpg" alt="Logo Agroledger" />
                   </div>
                  <!-- LOGIN -->
                 <div id="login" class="form-section active animate_animated animate_fadeIn">
                      <h2>Iniciar Sesión</h2>
                      <asp:ValidationSummary ID="ValidationSummaryLogin" runat="server" 
                           ValidationGroup="LoginGroup" ForeColor="Red" HeaderText="Errores:" />
                     <asp:Label ID="lbl_nombre_usuario" runat="server" Text="nombre usuario" CssClass="badge" Font-Size="Large" ForeColor="black"></asp:Label>
                     <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" placeholder="abc..."></asp:TextBox>
                      <asp:RequiredFieldValidator ID="valUsuario" runat="server"
                           ControlToValidate="txtUsuario"
                           ErrorMessage="El nombre de usuario es obligatorio."
                          ForeColor="Red" Display="Dynamic" />

                     <asp:Label ID="lbl_ClaveLogin" runat="server" Text="contraseña" CssClass="badge" Font-Size="Large" ForeColor="black"></asp:Label>
                      <asp:TextBox ID="txtClave" runat="server" CssClass="form-control" placeholder="123..."></asp:TextBox>
                      <asp:RequiredFieldValidator ID="valClave" runat="server"
                           ControlToValidate="txtClave"
                           ErrorMessage="La contraseña es obligatoria."
                           ForeColor="Red" Display="Dynamic" />
                      </div>
               <asp:Button ID="btnEntrar" runat="server" Text="Entrar" CssClass="asp-button" 
                   ValidationGroup="LoginGroup" OnClick="btnEntrar_Click" />
               <div id="divMensaje" runat="server" visible="false" class="alert alert-danger" role="alert">
                     
            </div>
                  <div class="volver">
                       <a href="#" onclick="mostrarFormulario('recuperar', event)">¿Olvidaste tu contraseña?</a>
                      </div>
                <!-- RECUPERAR -->
               <div id="recuperar" class="form-section">
                   <h2>Recuperar Contraseña</h2>
                   <asp:ValidationSummary ID="ValidationSummaryRecuperar" runat="server" 
                        ValidationGroup="RecuperarGroup" ForeColor="Red" HeaderText="Errores:" />
                   <asp:Label ID="lblCorreoRecuperar" runat="server" Text="Email:" AssociatedControlID="txtCorreoRecuperar" />
                    <asp:TextBox ID="txtCorreoRecuperar" runat="server" TextMode="Email" />
                   <asp:RequiredFieldValidator ID="rfvCorreoRecuperar" runat="server" ControlToValidate="txtCorreoRecuperar"
                        ErrorMessage="El correo es obligatorio." ValidationGroup="RecuperarGroup" ForeColor="Red" />
                     <asp:RegularExpressionValidator ID="revCorreoRecuperar" runat="server" ControlToValidate="txtCorreoRecuperar"
                          ErrorMessage="Formato de correo inválido."
                         ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" ValidationGroup="RecuperarGroup" ForeColor="Red" />
                   <asp:Button ID="btnRecuperar" runat="server" Text="Enviar enlace de recuperación" CssClass="asp-button" 
                       ValidationGroup="RecuperarGroup" OnClick="btnRecuperar_Click" />
                    <div class="volver">
                         <a href="#" onclick="mostrarFormulario('login', event)">Volver a iniciar sesión</a>
                         </div>
                   </div>
               <div class="volver">
                   <a href="Index.aspx">← Volver al inicio</a>
                    </div>
                </div>

        
    </form>

    <script>
        function mostrarFormulario(id, event) {
            event.preventDefault();

            const secciones = document.querySelectorAll('.form-section');
            secciones.forEach(sec => {
                sec.classList.remove('active', 'animate_animated', 'animate_fadeIn');
                sec.style.display = 'none';
            });

            const seccion = document.getElementById(id);
            seccion.style.display = 'block';
            setTimeout(() => {
                seccion.classList.add('active', 'animate_animated', 'animate_fadeIn');
            }, 10);
        }
    </script>
</body>
</html>

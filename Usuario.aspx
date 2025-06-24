<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="Agroledger.Usuario" %>


<!DOCTYPE html>

<html lang="es">
<head runat="server">
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Registrar Usuario</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: url('gallinitas.jpg.png') no-repeat center center fixed;
      background-size: cover;
      padding: 20px;
    }

    .container {
      max-width: 500px;
      margin: auto;
      background: rgba(255, 255, 255, 0.95);
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      text-align: center;
    }

    .logo {
      width: 200px;
      margin-bottom: 15px;
      border-radius: 50%;
      object-fit: cover;
      border: 3px solid #ffffff;
    }

    h2 {
      margin-bottom: 25px;
    }

    label {
      font-weight: bold;
      margin-top: 15px;
      display: block;
      text-align: left;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"],
    select {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      border: 1px solid #ccc;
      border-radius: 5px;
      box-sizing: border-box;
    }

    .asp-button {
      width: 100%;
      margin-top: 20px;
      background-color: #e66262;
      color: white;
      padding: 12px;
      border: none;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
    }

    .asp-button:hover {
      background-color: #1e7431;
    }

    .mensaje {
      margin-top: 20px;
      font-weight: bold;
      text-align: center;
    }

    .error {
      color: red;
    }

    .exito {
      color: green;
    }
  </style>
</head>
<body>
  <form id="form1" runat="server">
    <div class="container">
      <img src="logogallina.jpg.jpeg" alt="Logo del sistema" class="logo" />
      <h2>Registrar Usuario</h2>

      <label for="txtNombre">Nombre:</label>
      <asp:TextBox ID="txtNombre" runat="server" />

      <label for="txtApellido">Apellido:</label>
      <asp:TextBox ID="txtApellido" runat="server" />

      <label for="txtEmail">Correo Electrónico:</label>
      <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" />

      <label for="txtContrasena">Contraseña:</label>
      <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password" />

      <label for="ddlRol">Rol:</label>
      <asp:DropDownList ID="ddlRol" runat="server">
        <asp:ListItem Text="Selecciona un rol" Value="" />
        <asp:ListItem Text="Administrador" Value="Administrador" />
        <asp:ListItem Text="Supervisor" Value="Supervisor" />
        <asp:ListItem Text="Cajero" Value="Cajero" />
      </asp:DropDownList>

      <asp:Button ID="btnRegistrar" runat="server" Text="Registrar Usuario" CssClass="asp-button" OnClick="btnRegistrar_Click" />

      <asp:Label ID="lblMensaje" runat="server" CssClass="mensaje"></asp:Label>
    </div>
  </form>
</body>
</html>

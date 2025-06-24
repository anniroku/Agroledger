<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="Agroledger.Clientes" %>


<!DOCTYPE html>
<html lang="es">
<head runat="server">
  <meta charset="UTF-8" />
  <title>Registrar cliente</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-image: url('image/gallinitas.jpg');
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      margin: 0;
      padding: 20px;
    }

    .form-container {
      max-width: 600px;
      margin: auto;
      background: rgba(255, 255, 255, 0.95);
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 0 15px rgba(0,0,0,0.2);
      text-align: center;
    }

    .form-container img {
      width: 150px;
      margin-bottom: 20px;
      border-radius: 50%;
      object-fit: cover;
      border: 3px solid #ffffff;
    }

    .form-container h2 {
      color: #000000;
      margin-bottom: 25px;
    }

    label {
      display: block;
      margin-top: 15px;
      font-weight: bold;
      text-align: left;
    }

    input[type="text"],
    input[type="tel"],
    input[type="email"],
    .asp-button {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      border: 1px solid #ccc;
      border-radius: 6px;
      box-sizing: border-box;
    }

    .asp-button {
      width: 100%;
      padding: 12px;
      margin-top: 25px;
      background-color: #e66262;
      color: white;
      font-size: 16px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
    }

    .asp-button:hover {
      background-color: #3e7e3e;
    }

    .mensaje {
      margin-top: 10px;
      font-weight: bold;
    }

    .error {
      color: red;
      font-size: 13px;
      text-align: left;
      display: block;
      margin-top: 5px;
    }
  </style>
</head>
<body>
  <form id="form1" runat="server">
    <div class="form-container">
      <img src="image/logo_empresa.jpg" alt="Logo de la empresa" />
      <h2>Registrar cliente</h2>

      <asp:Label ID="lblMensaje" runat="server" CssClass="mensaje" Visible="false"></asp:Label>

      <label for="txtNombre">Nombre:</label>
      <asp:TextBox ID="txtNombre" runat="server" />
      <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre"
          ErrorMessage="El nombre es obligatorio." CssClass="error" Display="Dynamic" />

      <label for="txtApellido">Apellido:</label>
      <asp:TextBox ID="txtApellido" runat="server" />
      <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido"
          ErrorMessage="El apellido es obligatorio." CssClass="error" Display="Dynamic" />

      <label for="txtTelefono">Teléfono:</label>
      <asp:TextBox ID="txtTelefono" runat="server" TextMode="Phone" />
      <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono"
          ErrorMessage="El teléfono es obligatorio." CssClass="error" Display="Dynamic" />

      <label for="txtDireccion">Dirección:</label>
      <asp:TextBox ID="txtDireccion" runat="server" />
      <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion"
          ErrorMessage="La dirección es obligatoria." CssClass="error" Display="Dynamic" />

      <label for="txtEmail">Correo Electrónico:</label>
      <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" />
      <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
          ErrorMessage="El correo es obligatorio." CssClass="error" Display="Dynamic" />
      <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
          ErrorMessage="Correo no válido." CssClass="error"
          ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" Display="Dynamic" />

      <asp:Button ID="btnGuardar" runat="server" Text="Guardar Datos" CssClass="asp-button" OnClick="btnGuardar_Click" />
    </div>
  </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="Agroledger.Proveedores" %>


<!DOCTYPE html>
<html lang="es">
<head runat="server">
  <meta charset="UTF-8" />
  <title>Registro de Proveedor</title>
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
      margin: 80px auto;
      padding: 2rem;
      border-radius: 15px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
      text-align: center;
    }

    .logo {
      width: 150px;
      margin: 0 auto 1rem;
      border-radius: 50%;
      object-fit: cover;
      border: 3px solid #ffffff;
    }

    h2 {
      color: #000000;
      margin-bottom: 1.5rem;
    }

    form {
      text-align: left;
    }

    label {
      display: block;
      margin-top: 1rem;
      font-weight: bold;
    }

    input[type="text"],
    input[type="email"],
    input[type="tel"] {
      width: 100%;
      padding: 0.6rem;
      margin-top: 0.3rem;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .asp-button {
      margin-top: 1.5rem;
      width: 100%;
      padding: 0.8rem;
      background-color: #e66262;
      color: white;
      font-size: 1rem;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease-in-out;
    }

    .asp-button:hover {
      background-color: #1a252f;
    }
  </style>
</head>
<body>
  <form id="form1" runat="server">
    <div class="container">
      <img src="image/logo_empresa.jpg" alt="Logo" class="logo" />
      <h2>Registrar proveedor</h2>

      <label for="txtNombre">Nombre:</label>
      <asp:TextBox ID="txtNombre" runat="server" required="required" />

      <label for="txtTelefono">Teléfono:</label>
      <asp:TextBox ID="txtTelefono" runat="server" TextMode="Phone" required="required" />

      <label for="txtDireccion">Dirección:</label>
      <asp:TextBox ID="txtDireccion" runat="server" required="required" />

      <label for="txtEmail">Correo Electrónico:</label>
      <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" required="required" />

      <asp:Button ID="btnRegistrar" runat="server" Text="Registrar Proveedor" CssClass="asp-button" OnClick="btnRegistrar_Click" />
    </div>
  </form>
</body>
</html>

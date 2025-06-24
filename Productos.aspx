<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Agroledger.Productos" %>


<html lang="es">
<head runat="server">
  <meta charset="UTF-8" />
  <title>Registro de Producto</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-image: url('image/gallinitas.jpg');
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
      margin: 0;
      padding: 0;
    }

    .container {
      background-color: rgba(255, 255, 255, 0.95);
      max-width: 550px;
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

    label {
      display: block;
      margin-top: 1rem;
      font-weight: bold;
      text-align: left;
    }

    input[type="text"],
    input[type="number"],
    textarea,
    select,
    .asp-button {
      width: 100%;
      padding: 0.6rem;
      margin-top: 0.3rem;
      border: 1px solid #ccc;
      border-radius: 5px;
      box-sizing: border-box;
    }

    .asp-button {
      margin-top: 1.5rem;
      background-color: #e66262;
      color: white;
      font-size: 1rem;
      border: none;
      cursor: pointer;
      transition: background-color 0.3s ease-in-out;
    }

    .asp-button:hover {
      background-color: #1a252f;
    }

    .error {
      color: red;
      font-size: 0.9rem;
      margin-top: 0.2rem;
      text-align: left;
    }
  </style>
</head>
<body>
  <form id="form1" runat="server">
    <div class="container">
      <img src="image/logo_empresa.jpg" alt="Logo" class="logo" />
      <h2>Registro de Producto</h2>

      <label for="txtNombre">Nombre del Producto:</label>
      <asp:TextBox ID="txtNombre" runat="server" />
      <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre"
          ErrorMessage="* El nombre es obligatorio" CssClass="error" Display="Dynamic" />

      <label for="txtDescripcion">Descripción:</label>
      <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Rows="3" />

      <label for="txtPrecio">Precio ($):</label>
      <asp:TextBox ID="txtPrecio" runat="server" TextMode="Number" />
      <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" ControlToValidate="txtPrecio"
          ErrorMessage="* El precio es obligatorio" CssClass="error" Display="Dynamic" />
      <asp:RegularExpressionValidator ID="revPrecio" runat="server" ControlToValidate="txtPrecio"
          ValidationExpression="^\d+(\.\d{1,2})?$" ErrorMessage="* Precio inválido" CssClass="error" Display="Dynamic" />

      <label for="txtStock">Stock:</label>
      <asp:TextBox ID="txtStock" runat="server" TextMode="Number" />
      <asp:RequiredFieldValidator ID="rfvStock" runat="server" ControlToValidate="txtStock"
          ErrorMessage="* El stock es obligatorio" CssClass="error" Display="Dynamic" />
      <asp:RegularExpressionValidator ID="revStock" runat="server" ControlToValidate="txtStock"
          ValidationExpression="^\d+$" ErrorMessage="* Stock inválido" CssClass="error" Display="Dynamic" />

      <label for="ddlProveedor">Proveedor:</label>
      <asp:DropDownList ID="ddlProveedor" runat="server">
        <asp:ListItem Text="Seleccione un proveedor" Value="" />
        <asp:ListItem Text="Proveedor 1" Value="1" />
        <asp:ListItem Text="Proveedor 2" Value="2" />
      </asp:DropDownList>
      <asp:RequiredFieldValidator ID="rfvProveedor" runat="server" ControlToValidate="ddlProveedor"
          InitialValue="" ErrorMessage="* Debe seleccionar un proveedor" CssClass="error" Display="Dynamic" />

      <asp:Button ID="btnRegistrar" runat="server" Text="Registrar Producto" CssClass="asp-button" OnClick="btnRegistrar_Click" />
    </div>
  </form>
</body>
</html>


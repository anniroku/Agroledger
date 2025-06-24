<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistroFacturas.aspx.cs" Inherits="Agroledger.RegistroFacturas" %>

<!DOCTYPE html>

<html lang="es">
<head runat="server">
  <meta charset="UTF-8">
  <title>Registro de Factura - AgroLedger</title>
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
      background-image: url('image/gallinitas.jpg');
      background-size: cover;
      background-position: center;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }

    .form-container {
      background: white;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 0 12px rgba(0, 0, 0, 0.2);
      width: 350px;
      text-align: center;
    }

     .logo {
      width: 200px;
      margin-bottom: 15px;
      border-radius: 50%; /* HACE EL LOGO REDONDO */
            object-fit: cover;
            border: 3px solid #ffffff;
    }

    .form-container img {
      width: 100px;
      margin-bottom: 15px;
    }

    h2 {
      margin-bottom: 20px;
    }

    label {
      display: block;
      text-align: left;
      margin-top: 10px;
      font-weight: bold;
    }

    input {
      width: 100%;
      padding: 8px;
      margin-top: 4px;
      border: 1px solid #ccc;
      border-radius: 6px;
    }

    .asp-button {
      margin-top: 1.5rem;
      background-color: #e66262;
      color: white;
      font-size: 1rem;
      border: none;
      cursor: pointer;
      transition: background-color 0.3s ease-in-out;
      width: 100%;
      padding: 0.6rem;
      border-radius: 5px;
    }

    .asp-button:hover {
      background-color: #1a252f;
    }
    
    .validation-error {
      color: red;
      font-size: 12px;
      text-align: left;
      margin-top: 2px;
    }
  </style>
</head>
<body>
  <form id="form1" runat="server">
    <div class="form-container">
      <asp:Image ID="imgLogo" runat="server" ImageUrl="image/logo_empresa.jpg" CssClass="logo" AlternateText="Logo AgroLedger" />
      <h2>Registro de Factura</h2>
      
      <asp:Label AssociatedControlID="txtNumFactura" runat="server">Número de Factura:</asp:Label>
      <asp:TextBox ID="txtNumFactura" runat="server" required="true"></asp:TextBox>
      <asp:RequiredFieldValidator ID="rfvNumFactura" runat="server" 
          ControlToValidate="txtNumFactura" ErrorMessage="El número de factura es requerido" 
          CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>

      <asp:Label AssociatedControlID="txtFechaFactura" runat="server">Fecha:</asp:Label>
      <asp:TextBox ID="txtFechaFactura" runat="server" TextMode="Date" required="true"></asp:TextBox>
      <asp:RequiredFieldValidator ID="rfvFechaFactura" runat="server" 
          ControlToValidate="txtFechaFactura" ErrorMessage="La fecha es requerida" 
          CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>

      <asp:Label AssociatedControlID="txtCliente" runat="server">Cliente:</asp:Label>
      <asp:TextBox ID="txtCliente" runat="server" required="true"></asp:TextBox>
      <asp:RequiredFieldValidator ID="rfvCliente" runat="server" 
          ControlToValidate="txtCliente" ErrorMessage="El cliente es requerido" 
          CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>

      <asp:Label AssociatedControlID="txtTotal" runat="server">Total (S/):</asp:Label>
      <asp:TextBox ID="txtTotal" runat="server" TextMode="Number" min="0.01" step="0.01" required="true"></asp:TextBox>
      <asp:RequiredFieldValidator ID="rfvTotal" runat="server" 
          ControlToValidate="txtTotal" ErrorMessage="El total es requerido" 
          CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
      <asp:CompareValidator ID="cvTotal" runat="server" 
          ControlToValidate="txtTotal" Operator="DataTypeCheck" Type="Double"
          ErrorMessage="Ingrese un valor numérico válido" CssClass="validation-error" Display="Dynamic"></asp:CompareValidator>

      <asp:Label AssociatedControlID="txtDetalleId" runat="server">ID Detalle Venta:</asp:Label>
      <asp:TextBox ID="txtDetalleId" runat="server" required="true"></asp:TextBox>
      <asp:RequiredFieldValidator ID="rfvDetalleId" runat="server" 
          ControlToValidate="txtDetalleId" ErrorMessage="El ID de detalle es requerido" 
          CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>

      <asp:Button ID="btnRegistrar" runat="server" Text="Registrar Factura" 
          OnClick="btnRegistrar_Click" CssClass="asp-button" CausesValidation="true"/>
    </div>
  </form>
</body>
</html>

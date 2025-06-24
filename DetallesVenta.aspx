<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetallesVenta.aspx.cs" Inherits="Agroledger.DetallesVenta" %>


<!DOCTYPE html>

<html lang="es">
<head runat="server">
  <meta charset="UTF-8">
  <title>Detalle de Venta - AgroLedger</title>
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
      padding: 50px;
      border-radius: 12px;
      box-shadow: 0 0 12px rgba(0, 0, 0, 0.2);
      width: 350px;
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
      margin-bottom: 20px;
    }

    label {
      display: block;
      text-align: left;
      margin-top: 20px;
      font-weight: bold;
    }

    input {
      width: 100%;
      padding: 8px;
      margin-top: 4px;
      border: 1px solid #ccc;
      border-radius: 6px;
    }

    button, .asp-button {
      margin-top: 20px;
      background-color: #e66262;
      color: white;
      border: none;
      padding: 10px 20px;
      width: 100%;
      border-radius: 6px;
      font-size: 16px;
      cursor: pointer;
    }

    .asp-button:hover {
      background-color: #c0392b;
    }

    .error {
      color: red;
      font-size: 12px;
      text-align: left;
      display: block;
    }

    .mensaje {
      margin-top: 15px;
      font-weight: bold;
    }
  </style>
</head>
<body>
  <form id="form1" runat="server">
    <div class="form-container">
      <asp:Image ID="imgLogo" runat="server" ImageUrl="image/logo_empresa.jpg" AlternateText="Logo AgroLedger" CssClass="logo" />
      <h2>Detalle de Venta</h2>

      <asp:Label ID="lblMensaje" runat="server" CssClass="mensaje" Visible="false"></asp:Label>

      <label for="txtIdVenta">ID Venta:</label>
      <asp:TextBox ID="txtIdVenta" runat="server" />
      <asp:RequiredFieldValidator ID="rfvIdVenta" runat="server" ControlToValidate="txtIdVenta"
          ErrorMessage="El ID de venta es obligatorio." CssClass="error" Display="Dynamic" />

      <label for="txtProducto">Producto:</label>
      <asp:TextBox ID="txtProducto" runat="server" Text="Gallinas crudas" />
      <asp:RequiredFieldValidator ID="rfvProducto" runat="server" ControlToValidate="txtProducto"
          ErrorMessage="El producto es obligatorio." CssClass="error" Display="Dynamic" />

      <label for="txtCantidad">Cantidad (unidades):</label>
      <asp:TextBox ID="txtCantidad" runat="server" TextMode="Number" oninput="calcularSubtotal()" />
      <asp:RequiredFieldValidator ID="rfvCantidad" runat="server" ControlToValidate="txtCantidad"
          ErrorMessage="La cantidad es obligatoria." CssClass="error" Display="Dynamic" />
      <asp:RangeValidator ID="rvCantidad" runat="server" ControlToValidate="txtCantidad"
          MinimumValue="1" MaximumValue="10000" Type="Integer"
          ErrorMessage="Cantidad debe ser al menos 1." CssClass="error" Display="Dynamic" />

      <label for="txtPrecioUnitario">Precio Unitario (S/):</label>
      <asp:TextBox ID="txtPrecioUnitario" runat="server" TextMode="Number" oninput="calcularSubtotal()" />
      <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" ControlToValidate="txtPrecioUnitario"
          ErrorMessage="El precio unitario es obligatorio." CssClass="error" Display="Dynamic" />
      <asp:RangeValidator ID="rvPrecio" runat="server" ControlToValidate="txtPrecioUnitario"
          MinimumValue="0,01" MaximumValue="100000" Type="Double"
          ErrorMessage="El precio debe ser mayor a 0." CssClass="error" Display="Dynamic" />

      <label for="txtSubtotal">Subtotal (S/):</label>
      <asp:TextBox ID="txtSubtotal" runat="server" ReadOnly="true" />

      <asp:Button ID="btnGuardar" runat="server" Text="Guardar Detalle" CssClass="asp-button" OnClick="btnGuardar_Click" />
    </div>
  </form>

  <script>
      function calcularSubtotal() {
          const cantidad = parseFloat(document.getElementById('<%= txtCantidad.ClientID %>').value) || 0;
          const precio = parseFloat(document.getElementById('<%= txtPrecioUnitario.ClientID %>').value) || 0;
      document.getElementById('<%= txtSubtotal.ClientID %>').value = (cantidad * precio).toFixed(2);
      }
  </script>
</body>
</html>
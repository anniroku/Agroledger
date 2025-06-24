<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="Agroledger.Ventas" %>


<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Registrar Venta - AgroLedger</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('image/gallinitas.jpg') no-repeat center center fixed;
            background-size: cover;
            padding: 20px;
        }

        .form-container {
            max-width: 700px;
            margin: auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center;
        }

        .logo {
            width: 200px;
            margin-bottom: 10px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #ffffff;
        }

        h2 {
            margin-top: 10px;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            text-align: left;
        }

        select, input[type="number"], input[type="text"], .asp-button {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        .asp-button {
            background-color: #e66262;
            color: white;
            font-weight: bold;
            cursor: pointer;
            border: none;
        }

        .asp-button:hover {
            background-color: #3e7e3e;
        }

        .error {
            color: red;
            font-size: 13px;
            text-align: left;
            display: block;
            margin-top: 5px;
        }

        .mensaje {
            margin-top: 10px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <img src="image/logo_empresa.jpg" alt="Logo AgroLedger" class="logo" />
            <h2>Registrar Nueva Venta</h2>

            <asp:Label ID="lblMensaje" runat="server" CssClass="mensaje" Visible="false"></asp:Label>

            <!-- Cliente -->
            <label for="ddlCliente">Cliente:</label>
            <asp:DropDownList ID="ddlCliente" runat="server">
                <asp:ListItem Value="">Seleccione un cliente</asp:ListItem>
                <asp:ListItem Value="1">Juan Pérez</asp:ListItem>
                <asp:ListItem Value="2">Ana Gómez</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvCliente" runat="server" ControlToValidate="ddlCliente"
                InitialValue="" ErrorMessage="Seleccione un cliente." CssClass="error" Display="Dynamic" />

            <!-- Producto -->
            <label for="ddlProducto">Producto:</label>
            <select id="ddlProducto" runat="server" onchange="actualizarPrecio()" required>
                <option value="">Seleccione un producto</option>
                <option value="1" data-precio="18000">Gallina entera - $18.000</option>
                <option value="2" data-precio="9500">Pechuga - $9.500</option>
            </select>
            <!-- Nota: No hay RequiredFieldValidator directo para este control sin convertirlo a DropDownList ASP.NET -->

            <!-- Cantidad -->
            <label for="txtCantidad">Cantidad:</label>
            <asp:TextBox ID="txtCantidad" runat="server" TextMode="Number" oninput="calcularTotal()" />
            <asp:RequiredFieldValidator ID="rfvCantidad" runat="server" ControlToValidate="txtCantidad"
                ErrorMessage="La cantidad es obligatoria." CssClass="error" Display="Dynamic" />

            <!-- Precio Unitario -->
            <label for="txtPrecio">Precio Unitario (COP):</label>
            <asp:TextBox ID="txtPrecio" runat="server" ReadOnly="True" />

            <!-- Total -->
            <label for="txtTotal">Total (COP):</label>
            <asp:TextBox ID="txtTotal" runat="server" ReadOnly="True" />

            <!-- Botón -->
            <asp:Button ID="btnRegistrarVenta" runat="server" Text="Registrar Venta" CssClass="asp-button" OnClick="btnRegistrarVenta_Click" />
        </div>
    </form>

    <script>
        function actualizarPrecio() {
            const producto = document.getElementById("ddlProducto");
            const precio = producto.options[producto.selectedIndex].getAttribute("data-precio");
            document.getElementById("<%= txtPrecio.ClientID %>").value = precio;
            calcularTotal();
        }

        function calcularTotal() {
            const precio = parseFloat(document.getElementById("<%= txtPrecio.ClientID %>").value) || 0;
            const cantidad = parseInt(document.getElementById("<%= txtCantidad.ClientID %>").value) || 0;
            document.getElementById("<%= txtTotal.ClientID %>").value = precio * cantidad;
        }
    </script>
</body>
</html>


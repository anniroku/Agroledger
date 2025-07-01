<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Agroledger.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard - Módulos del Sistema</title>
    <style>

        .btn-outline-custom {
        border: 2px solid #e2615e;
        color: #e2615e;
        background-color: transparent;
        transition: all 0.3s ease-in-out;
        font-weight: bold;
        padding: 10px 20px;
        border-radius: 8px;
    }

    .btn-outline-custom:hover {
        background-color: #e2615e;
        color: white;
        transform: scale(1.05);
    }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        .header {
            background-color: #2e6e2e;
            padding: 20px;
            text-align: center;
            color: white;
        }

        .header img {
            width: 100px;
            border-radius: 50%;
        }

        .title {
            font-size: 24px;
            margin-top: 10px;
        }

        .dashboard-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 50px;
        }

        .card {
            background-color: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .card button {
            display: block;
            width: 150px;
            margin: 10px auto;
            padding: 10px;
            background-color: #e57373;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .card button:hover {
            background-color: #d84343;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <br />
          
            <img src="image/logo_empresa.jpg" alt="Logo" />
            <div class="title">Dashboard - Módulos del Sistema</div>
        </div>

        <div class="dashboard-container">
            <div class="card">
                <asp:Button ID="btnVentas" runat="server" Text="Ventas" OnClick="btnVentas_Click"  CssClass="btn-outline-custom" />
                <asp:Button ID="btnRegistroFacturas" runat="server" Text="RegistroFacturas" OnClick="btnRegistroFacturas_Click" CssClass="btn-outline-custom" />
                <asp:Button ID="btnClientes" runat="server" Text="Clientes" OnClick="btnClientes_Click" CssClass="btn-outline-custom" />
                     <asp:Button ID="Registro" runat="server" Text="Registro" OnClick="btnRegistro_Click" CssClass="btn-outline-custom" />
            </div>
            <asp:GridView ID="gvFacturas" runat="server" AutoGenerateColumns="False" 
                BorderColor="#003300" BorderStyle="Double"  DataKeyNames="id,id_factura">

                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="btn_select" runat="server" CausesValidation="False" CommandName="Select" Text="ver" CssClass="btn btn-info" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="btn_Borrar" runat="server" CausesValidation="False" CommandName="Delete" Text="Borrar" CssClass="btn btn-danger" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_factura" HeaderText="Factura #" />
                    <asp:BoundField DataField="fecha_factura" HeaderText="Fecha" DataFormatString="{0:yyyy-MM-dd}"  />
                    <asp:BoundField DataField="nombre_cliente" HeaderText="Cliente" />
                    <asp:BoundField DataField="apellido_cliente" HeaderText="Apellido" />
                    <asp:BoundField DataField="email" HeaderText="Correo" />
                    <asp:BoundField DataField="producto" HeaderText="Producto" />
                    <asp:BoundField DataField="cantidad" HeaderText="Cantidad" />
                    <asp:BoundField DataField="precio_unitario" HeaderText="Precio Unitario" />
                    <asp:BoundField DataField="subtotal" HeaderText="Subtotal" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="total_factura" HeaderText="Total"  DataFormatString="{0:C}" />
                </Columns>
                <PagerTemplate>
                    tabla vacia
                </PagerTemplate>
            </asp:GridView>
              
        </div>
        

    </form>
</body>

  

</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Agroledger.Index" %>


<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="UTF-8">
    <title>AgroLedger - Inicio</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> // probando cambios
    <style>
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        body {
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
            background-image: url('image/gallinitas.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: white;
        }

        .container {
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            animation: fadeIn 1.5s ease-out;
        }

        h1 {
            color: #2d572c;
            font-size: 6rem;
            margin: 0;
        }

        p {
            color: #000000;
            font-size: 3rem;
            margin-top: 10px;
            animation: fadeIn 2s ease-out;
        }

        .btn {
            margin-top: 20px;
            padding: 12px 24px;
            font-size: 1.5rem;
            background-color: #e65b5b;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s ease;
            animation: fadeIn 2.5s ease-out;
        }

        .btn:hover {
            background-color: #3c8a3c;
            transform: scale(1.05);
        }




    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>AgroLedger</h1>
            <p>Donde la gallina es natural, el sabor es especial.</p>
            <asp:Button ID="btnLogin" runat="server" Text="Ingresar" CssClass="btn" OnClick="btnLogin_Click" />
        </div>
        

    </form>
</body>
</html>


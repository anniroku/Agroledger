<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error404.aspx.cs" Inherits="Agroledger.Error404" %>
<!DOCTYPE html>
<html lang="es">
<head runat="server">
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Error 404 - Página no encontrada</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

  <!-- Animate.css -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f5f1f1;
      background-size: cover;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .container {
      max-width: 600px;
      margin: auto;
      padding: 20px;
      background-color: #ffffff;
      border-radius: 10px;
      box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
      text-align: center;
    }

    h1 {
      font-size: 60px;
      margin-bottom: 10px;
      color: #358b35;
    }

    p {
      font-size: 18px;
      margin: 10px 0;
    }

    img {
      width: 100%;
      max-width: 280px;
      margin: 20px auto;
    }

    a.button {
      display: inline-block;
      margin-top: 25px;
      padding: 12px 25px;
      background-color: #2a8327;
      color: white;
      text-decoration: none;
      border-radius: 6px;
      font-weight: bold;
      transition: background-color 0.3s ease;
    }

    a.button:hover {
      background-color: #ec971f;
    }
  </style>
</head>
<body>
  <form id="form1" runat="server">
    <div class="container animate__animated animate__fadeIn">
      <img src="image/error404.jpg" alt="Error 404 - Página no encontrada" class="animate__animated animate__zoomIn" />
      <p class="animate__animated animate__fadeInUp">Lo sentimos, la página que buscas no existe.</p>
      <p class="animate__animated animate__fadeInUp animate__delay-1s">Por favor, verifica la URL o regresa a la página principal.</p>
             <a href="Login.aspx" class="btn mt-3 mi-boton-personal">
      Volver al Login
   </a>

    </div>
  </form>

  <!-- Bootstrap JS Bundle -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


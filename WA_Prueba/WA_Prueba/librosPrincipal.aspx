<%@ Page Title="" Language="C#" MasterPageFile="~/BiblioMaster.Master" AutoEventWireup="true" CodeBehind="librosPrincipal.aspx.cs" Inherits="WA_Prueba.librosPrincipal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
    Listado de libros
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContenido" runat="server">
     <style>
        .main-container {
            display: flex;
            justify-content: space-between; /* Distribuir el espacio entre los elementos */
            margin-top: 20px;
        }

        .left-container {
            width: 100%; /* El título ocupará todo el espacio de la fila */
            display: flex;
            flex-direction: column; /* Alinear el título a la izquierda */
            align-items: center; /* Espacio debajo del título */
        }

        h2 {
            font-size: 36px;
            font-weight: bold;
        }

        .table-container {
            width: 100%; /* Ajusta el tamaño de la tabla */
            margin-top: 20px; /* Centra la tabla horizontalmente */
        }

        .stats-container {
            width: 175%; /* Ajusta el tamaño del contenedor */
            margin-left: 20px; /* Espacio entre la tabla y los contadores */
            background-color: #ffffff; /* Fondo blanco para coincidir con el fondo general */
            padding: 20px;
            border-radius: 8px;
            font-size: 22px; /* Aumenta el tamaño de la fuente */
            line-height: 1.6; /* Aumenta el espaciado entre líneas */
            display: flex; /* Habilita Flexbox */
            flex-direction: column; /* Organiza los elementos verticalmente */
            justify-content: center; /* Centra los elementos verticalmente */
            align-items: center; /* Centra los elementos horizontalmente */
            text-align: center; /* Asegura que el texto esté centrado */
        }

        .stats-container p {
            margin: 10px 0; /* Espaciado entre los párrafos */
        }

        th {
            background-color: #2c6b3e; /* Verde */
            color: white; /* Cambia el texto a blanco para que contraste con el verde */
            padding: 10px; /* Agrega espacio dentro de las celdas */
            text-align: center; /* Centra el texto en el encabezado */
            border: none;
        }

        table {
            width: 100%; /* Hace que la tabla ocupe todo el ancho del contenedor */
            border-collapse: collapse; /* Elimina los espacios entre las celdas de la tabla */
        }

        th:nth-child(1), th:nth-child(2) {
            background-color: #2c6b3e; /* Verde para estas dos columnas */
            color: white; /* Texto blanco */
        }

        th, td {
            padding: 10px; /* Espaciado dentro de las celdas */
            border: 1px solid #ddd; /* Asegura un borde claro en las celdas de la tabla */
        }
    </style>
    <div class="main-container">
        <div class="left-container">
                <h2>Biblioteca digital</h2>
    <div class="table-container">
        <asp:Gridview ID="dgvLibros" runat="server" AllowPaging="false" AutoGenerateColumns="false" CssClass="table table-hover table-responsive table-striped">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="idMaterial" />
                <asp:BoundField HeaderText="INVENTARIO" DataField="titulo" />
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:HyperLink 
                            ID="hlVerDetalle" 
                            runat="server" 
                            Text="Ver detalle"
                            NavigateUrl='<%# Eval("idMaterial", "librodetalle.aspx?id={0}") %>'
                            CssClass="btn btn-info btn-sm" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:Gridview>
    </div>
            </div>
    <div class="stats-container">
            <p><strong>CANTIDAD TOTAL DE OBRAS PRESENTES</strong></p>
            <p>003</p>

            <p><strong>CANTIDAD TOTAL DE EJEMPLARES</strong></p>
            <p>003</p>

            <p><strong>USUARIOS EN LÍNEA</strong></p>
            <p>123</p>
        </div>
        </div>
</asp:Content>
    
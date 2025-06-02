<%@ Page Title="" Language="C#" MasterPageFile="~/BiblioMaster.Master" AutoEventWireup="true" CodeBehind="librosPrincipal.aspx.cs" Inherits="WA_Prueba.librosPrincipal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
    Listado de libros
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContenido" runat="server">
    <style>
        .main-container {
            display: flex;
            justify-content: space-between; /* Alinea los contenedores a los extremos de la pantalla */
            margin-top: 20px;
            width: 100%;
            height: 100vh;
        }

        .left-container {
            width: 60%; /* Ajustado para la tabla */
            display: flex;
            flex-direction: column;
            align-items: flex-start; /* Mantiene la tabla alineada a la izquierda */
            overflow-y: auto;
            height: 100vh;
        }

        h2 {
            font-size: 36px;
            font-weight: bold;
        }

        .table-container {
            width: 100%;
            margin-top: 20px;
        }

        .detallesContainer {
            width: 80%; /* Ajusta el tamaño de la sección de detalles */
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            font-size: 18px;
            line-height: 1.8;
            display: flex; /* Usamos flexbox para alinearlos */
            flex-direction: column; /* Alineamos los elementos en fila */
            justify-content: flex-start; /* Alinea el contenido en el inicio */
            align-items: flex-start; /* Alinea los items al inicio (parte superior) */
        }

        .detalle-texto {
            flex: 70%; /* El área de texto toma el 70% del espacio */
            margin-right: 20px; /* Añadimos un espacio entre los detalles y los botones */
        }

        .button-container {
            display: flex;
            flex-direction: row;  /* Los botones estarán en fila */
            justify-content: flex-start;
            align-items: center; /* Alinea los botones al centro */
            width: 100%; /* Ocupa todo el espacio disponible */
            gap: 10px; /* Añade espacio entre los botones */
        }

        .action-button {
            padding: 10px;
            margin: 10px 0;
            background-color: #2c6b3e;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
            text-align: center;
        }

        .action-button:hover {
            background-color: #1f4b28;
        }

        .detalle-texto p {
            margin: 15px 0;
            font-size: 18px;
            line-height: 2.0; /* Ajustamos el espaciado entre líneas */
        }

        .stats-container {
            width: 80%;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            font-size: 22px;
            line-height: 1.8;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        th {
            background-color: #2c6b3e; /* Verde */
            color: white; /* Contraste con el fondo verde */
            padding: 10px;
            text-align: center;
            border: none;
        }

        table {
            width: 100%; /* Hace que la tabla ocupe todo el ancho del contenedor */
            border-collapse: collapse;
            margin: 0 auto;
        }

        th:nth-child(1), th:nth-child(2) {
            background-color: #2c6b3e;
            color: white;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }
    </style>

            <div class="main-container">
            <!-- Contenedor de la tabla -->
            <div class="left-container">
                <h2>Biblioteca digital</h2>
                <div class="table-container">
                    <asp:GridView ID="dgvLibros" runat="server" AllowPaging="false" AutoGenerateColumns="false" CssClass="table table-hover table-responsive table-striped" OnRowCommand="dgvLibros_RowCommand">
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="idMaterial" />
                            <asp:BoundField HeaderText="INVENTARIO" DataField="titulo" />
                            <asp:TemplateField HeaderText="" ItemStyle-Width="50px">
                                <ItemTemplate>
                                    <asp:Button ID="btnVerDetalle" runat="server" Text="➡️" CommandName="VerDetalles" CommandArgument='<%# Eval("idMaterial") %>' OnClientClick="mostrarDetalles(); return false;" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <!-- Sección de detalles del libro -->
            <div id="detallesContainer" class="detallesContainer" style="display: none;">
                <div class="detalle-texto">
                    <h3>Detalles del Libro</h3>
                    <p><strong>Título:</strong> <span id="detalleTitulo"></span></p>
                    <p><strong>Año de publicación:</strong> <span id="detalleAnio"></span></p>
                    <p><strong>Categorías:</strong> <span id="detalleCategorias"></span></p>
                    <p><strong>Autor:</strong> <span id="detalleAutor"></span></p>
                    <p><strong>Editorial:</strong> <span id="detalleEditorial"></span></p>
                    <p><strong>Descripción:</strong> <span id="detalleDescripcion"></span></p>
                    <button onclick="volverDetalles();">Volver a la lista</button>
                </div>
        
                <div class="button-container">
                    <button class="action-button">Editar Material</button>
                    <button class="action-button">Eliminar Material</button>
                    <button class="action-button">Ver Ejemplares</button>
                </div>
            </div>

            <!-- Sección de estadísticas (visible inicialmente) -->
            <div id="statsContainer" class="stats-container">
                <p><strong>CANTIDAD TOTAL DE OBRAS PRESENTES</strong></p>
                <p>003</p>

                <p><strong>CANTIDAD TOTAL DE EJEMPLARES</strong></p>
                <p>003</p>

                <p><strong>USUARIOS EN LÍNEA</strong></p>
                <p>123</p>
            </div>
        </div>

    <!-- Script de JavaScript para manejar la visibilidad y mostrar los detalles -->
    <script>
        function mostrarDetalles() {
            // Ocultar la sección de estadísticas
            document.getElementById("statsContainer").style.display = "none";

            // Mostrar la sección de detalles
            document.getElementById("detallesContainer").style.display = "block";

            // Mostrar los detalles en la nueva sección
            document.getElementById("detalleTitulo").innerText = "Libro Ejemplo"; // Cambiar dinámicamente
            document.getElementById("detalleAnio").innerText = "2025"; // Cambiar dinámicamente
            document.getElementById("detalleCategorias").innerText = "Categoría Ejemplo"; // Cambiar dinámicamente
            document.getElementById("detalleAutor").innerText = "Autor Ejemplo"; // Cambiar dinámicamente
            document.getElementById("detalleEditorial").innerText = "Editorial Ejemplo"; // Cambiar dinámicamente
            document.getElementById("detalleDescripcion").innerText = "Descripción Ejemplo"; // Cambiar dinámicamente
        }
        function volverDetalles() {
            // Mostrar la sección de estadísticas
            document.getElementById("statsContainer").style.display = "block";

            // Ocultar la sección de detalles
            document.getElementById("detallesContainer").style.display = "none";
        }
    </script>
</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usados.aspx.cs" Inherits="TrabajoPFconcesionaria4.Usados" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Autos Usados</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            overflow-x: hidden; 
        }
        .contenedor {
            margin: 100px auto 50px auto;
            width: 90%;
            max-width: 1200px;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            position: relative;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .btn-volver {
            background-color: #6c757d;
            color: white;
            padding: 8px 16px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .tabla-ingreso {
            margin-top: 25px;
            width: 100%;
        }
        .tabla-ingreso input {
            width: 95%;
            padding: 8px;
            margin: 3px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .btn-agregar {
            background-color: #007bff;
            color: white;
            padding: 10px 18px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            font-weight: bold;
            margin-top: 10px;
        }
        .grid {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            table-layout: fixed; 
        }
        .grid th {
            background-color: #007bff;
            color: white;
            padding: 10px;
            text-align: center;
        }
        .grid td {
            padding: 8px;
            text-align: center;
            border-bottom: 1px solid #ccc;
            overflow: hidden;
        }
        .grid td input {
            width: 100%;
            box-sizing: border-box;
        }
        .btn-editar { background-color: #28a745; }
        .btn-eliminar { background-color: #dc3545; }
        .btn { padding: 6px 12px; border-radius: 6px; color: white; border: none; cursor: pointer; }
    </style>

    <script>
        function confirmarEliminacion() {
            return confirm("¿Seguro que deseas eliminar este auto?");
        }
    </script>

</head>

<body>
    <form id="form1" runat="server">
        <div class="contenedor">

            

            <h2>Autos Usados Disponibles</h2>

            
            <table class="tabla-ingreso">
                <tr>
                    <td><asp:TextBox ID="txtNombre" runat="server" Placeholder="Nombre del auto"></asp:TextBox></td>
                    <td><asp:TextBox ID="txtMarca" runat="server" Placeholder="Marca"></asp:TextBox></td>
                    <td><asp:TextBox ID="txtColor" runat="server" Placeholder="Color"></asp:TextBox></td>
                    <td><asp:TextBox ID="txtAnio" runat="server" Placeholder="Año"></asp:TextBox></td>
                    <td><asp:TextBox ID="txtCombustible" runat="server" Placeholder="Combustible"></asp:TextBox></td>
                    <td><asp:TextBox ID="txtMotor" runat="server" Placeholder="Motor"></asp:TextBox></td>
                    <td><asp:TextBox ID="txtPrecio" runat="server" Placeholder="Precio"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="7" style="text-align:center;">
                        <asp:Button ID="btnAgregar" runat="server" Text="Agregar Auto" CssClass="btn-agregar"
                            OnClick="btnAgregar_Click" />
                    </td>
                </tr>
            </table>

           
            <asp:GridView ID="gvAutos" runat="server" CssClass="grid" AutoGenerateColumns="False"
                DataKeyNames="AutoID"
                OnRowEditing="gvAutos_RowEditing"
                OnRowUpdating="gvAutos_RowUpdating"
                OnRowCancelingEdit="gvAutos_RowCancelingEdit"
                OnRowDeleting="gvAutos_RowDeleting">

                <Columns>
                    <asp:BoundField DataField="AutoID" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="NombreAuto" HeaderText="Nombre" />
                    <asp:BoundField DataField="Marca" HeaderText="Marca" />
                    <asp:BoundField DataField="Color" HeaderText="Color" />
                    <asp:BoundField DataField="AnioFabricacion" HeaderText="Año" />
                    <asp:BoundField DataField="Combustible" HeaderText="Combustible" />
                    <asp:BoundField DataField="TipoMotor" HeaderText="Motor" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" />

                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEditar" runat="server" CommandName="Edit" Text="Editar" CssClass="btn btn-editar" />

                            <asp:LinkButton ID="btnEliminar" runat="server" CommandName="Delete" Text="Eliminar"
                                CssClass="btn btn-eliminar"
                                OnClientClick="return confirmarEliminacion();" />
                        </ItemTemplate>

                        <EditItemTemplate>
                            <asp:LinkButton ID="btnGuardar" runat="server" CommandName="Update" Text="Guardar" CssClass="btn btn-editar" />
                            <asp:LinkButton ID="btnCancelar" runat="server" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-eliminar" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>

    </form>
</body>
</html>

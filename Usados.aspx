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
        }
        .contenedor {
            margin: 100px auto 50px auto;
            width: 90%;
            max-width: 1200px;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .grid {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
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
            vertical-align: middle;
        }
        .grid tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .grid tr:hover {
            background-color: #eef6ff;
        }
        .btn {
            border: none;
            padding: 6px 12px;
            border-radius: 6px;
            cursor: pointer;
            color: white;
            font-weight: bold;
        }
        .btn-editar { background-color: #28a745; }
        .btn-eliminar { background-color: #dc3545; }
        .btn-guardar { background-color: #007bff; }
        .btn-cancelar { background-color: #6c757d; }
        .btn:hover { opacity: 0.9; }
        .tabla-contenedor { overflow-x: auto; }

        
        .toast {
            position: fixed;
            top: 20px;
            right: 20px;
            background: #333;
            color: white;
            padding: 12px 18px;
            border-radius: 8px;
            font-family: Arial, sans-serif;
            opacity: 0;
            transform: translateY(-20px);
            transition: opacity 0.4s ease, transform 0.4s ease;
            z-index: 9999;
        }
        .toast.show {
            opacity: 1;
            transform: translateY(0);
        }
        .toast.success { background: #28a745; }
        .toast.error { background: #dc3545; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="contenedor">
        <h2>🚗 Autos Usados Disponibles</h2>
        <div class="tabla-contenedor">
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
                            <asp:LinkButton 
                                ID="btnEditar" 
                                runat="server" 
                                CommandName="Edit" 
                                Text="✏️ Editar" 
                                CssClass="btn btn-editar" />

                            <asp:LinkButton 
                                ID="btnEliminar" 
                                runat="server" 
                                Text="🗑️ Eliminar"
                                CommandName="Delete"
                                CssClass="btn btn-eliminar"
                                OnClientClick="return confirmarEliminacion(this);" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <script>
   
    function mostrarToast(mensaje, tipo) {
        const toast = document.createElement('div');
        toast.className = 'toast ' + tipo;
        toast.textContent = mensaje;
        document.body.appendChild(toast);
        setTimeout(() => toast.classList.add('show'), 100);
        setTimeout(() => {
            toast.classList.remove('show');
            setTimeout(() => document.body.removeChild(toast), 300);
        }, 3000);
    }
    </script>

   
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
    function confirmarEliminacion(boton) {
        Swal.fire({
            title: '¿Estás seguro?',
            text: "Esta acción eliminará el auto permanentemente.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Sí, eliminar',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                __doPostBack(boton.name, '');
            }
        });
        return false; // evita el postback automático
    }
    </script>
    </form>
</body>
</html>
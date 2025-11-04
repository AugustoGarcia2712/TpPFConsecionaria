<%@ Page Title="Autos Usados" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="Usados.aspx.cs" Inherits="TrabajoPFconcesionaria4.Usados" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- Aquí puedes agregar contenido al head
</asp:Content>--%>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Listado de Autos Usados Disponibles</h2>

    <asp:GridView 
        ID="gvAutos" 
        runat="server"
        AutoGenerateColumns="false"  
        CssClass="table table-striped table-bordered" 
        EmptyDataText="No hay autos disponibles en este momento.">
        
        <Columns>
            <%-- Definimos las columnas manualmente --%>
            <asp:BoundField DataField="NombreAuto" HeaderText="Modelo" />
            <asp:BoundField DataField="Marca" HeaderText="Marca" />
            <asp:BoundField DataField="Color" HeaderText="Color" />
            <asp:BoundField DataField="AnioFabricacion" HeaderText="Año" />
            <asp:BoundField DataField="Combustible" HeaderText="Combustible" />
            <asp:BoundField DataField="TipoMotor" HeaderText="Motor (Lts)" />
            
            <%-- Formato de Moneda para el Precio --%>
            <asp:BoundField 
                DataField="Precio" 
                HeaderText="Precio"
                DataFormatString="{0:C0}" 
                HtmlEncode="false" />
            
        </Columns>
    </asp:GridView>
</asp:Content>  
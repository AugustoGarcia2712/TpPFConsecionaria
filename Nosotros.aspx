 <%@ Page Title="Nosotros" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="Nosotros.aspx.cs" Inherits="TrabajoPFconcesionaria4.Nosotros" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <section style="padding: 50px 20px;">
        <div class="container">
            <h2 class="mb-4 text-center">Sobre Nosotros</h2>

            <div class="row align-items-center">
                <div class="col-md-6">
                    <img src="FotosConcesionaria/concesionaria1.JPG" alt="Concesionaria Morón" class="img-fluid rounded shadow-sm" />
                </div>
                <div class="col-md-6">
                    <p>
                        En <strong>FVG Automotores</strong> somos una agencia dedicada a la venta de vehículos 0 KM y usados seleccionados.  
                        Nos destacamos por ofrecer <strong>asesoramiento personalizado</strong>, <strong>financiación flexible</strong> y una atención orientada a generar confianza y satisfacción en cada cliente.
                    </p>
                    <p>
                        Nuestro compromiso es garantizar <strong>transparencia</strong>, <strong>seguridad</strong> y <strong>excelencia en el servicio</strong>, acompañándote antes, durante y después de la compra.
                    </p>
                </div>
            </div>

            <div class="row mt-5">
                <div class="col-md-12">
                    <h3>Nuestra Misión</h3>
                    <p>
                        Brindar vehículos confiables, con respaldo técnico, atención profesional y un proceso de compra claro y seguro.
                    </p>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-md-12">
                    <h3>Por qué elegirnos</h3>
                    <ul>
                        <li>✔ Amplia experiencia en el rubro automotor.</li>
                        <li>✔ Vehículos garantizados y certificados.</li>
                        <li>✔ Financiación a medida.</li>
                        <li>✔ Trámites rápidos y seguros.</li>
                        <li>✔ Atención postventa personalizada.</li>
                    </ul>
                </div>
            </div>

            <div class="text-center mt-5">
                <a href="Contacto.aspx" class="btn btn-primary btn-lg">Contáctanos</a>
            </div>
        </div>
    </section>

</asp:Content>

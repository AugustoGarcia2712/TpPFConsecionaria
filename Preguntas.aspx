<%@ Page Title="Preguntas Frecuentes" Language="C#" MasterPageFile="~/home.Master"
    AutoEventWireup="true" CodeBehind="Preguntas.aspx.cs" Inherits="TrabajoPFconcesionaria4.Preguntas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="container" style="margin-top: 40px; margin-bottom: 40px;">

        <h1 class="text-center mb-4">Preguntas Frecuentes</h1>
        <p class="text-center mb-5">Resolvemos las dudas más comunes sobre nuestros autos usados, financiación, documentación y garantía.</p>

        <div style="border: 1px solid #ccc; border-radius: 6px; margin-bottom: 15px;">
            <input type="checkbox" id="faq1" style="display:none;">
            <label for="faq1" style="display:block; padding: 15px; font-size:18px; font-weight:bold; cursor:pointer; background:#f7f7f7;">
                ¿Los autos están verificados y con informe?
            </label>
            <div style="padding: 15px; display:none;" class="faq-content">
                Todos nuestros vehículos pasan por un control riguroso y se entregan con informe de dominio e informe técnico para tu tranquilidad.
            </div>
        </div>

        <div style="border: 1px solid #ccc; border-radius: 6px; margin-bottom: 15px;">
            <input type="checkbox" id="faq2" style="display:none;">
            <label for="faq2" style="display:block; padding: 15px; font-size:18px; font-weight:bold; cursor:pointer; background:#f7f7f7;">
                ¿Puedo entregar mi auto usado como parte de pago?
            </label>
            <div style="padding: 15px; display:none;" class="faq-content">
                Sí. Tomamos tu vehículo al mejor precio del mercado y podés usarlo como parte del pago para facilitar la operación.
            </div>
        </div>

        <div style="border: 1px solid #ccc; border-radius: 6px; margin-bottom: 15px;">
            <input type="checkbox" id="faq3" style="display:none;">
            <label for="faq3" style="display:block; padding: 15px; font-size:18px; font-weight:bold; cursor:pointer; background:#f7f7f7;">
                ¿Ofrecen financiación?
            </label>
            <div style="padding: 15px; display:none;" class="faq-content">
                Contamos con financiación en cuotas fijas en pesos con entidades bancarias, pudiendo financiar hasta el 80% del valor del vehículo.
            </div>
        </div>

        <div style="border: 1px solid #ccc; border-radius: 6px; margin-bottom: 15px;">
            <input type="checkbox" id="faq4" style="display:none;">
            <label for="faq4" style="display:block; padding: 15px; font-size:18px; font-weight:bold; cursor:pointer; background:#f7f7f7;">
                ¿Qué documentación necesito para comprar un auto?
            </label>
            <div style="padding: 15px; display:none;" class="faq-content">
                Solo necesitás DNI, comprobante de domicilio y constancia de CUIL. Nosotros nos encargamos del resto con nuestros gestores matriculados.
            </div>
        </div>

        <div style="border: 1px solid #ccc; border-radius: 6px; margin-bottom: 15px;">
            <input type="checkbox" id="faq5" style="display:none;">
            <label for="faq5" style="display:block; padding: 15px; font-size:18px; font-weight:bold; cursor:pointer; background:#f7f7f7;">
                ¿Los autos tienen garantía?
            </label>
            <div style="padding: 15px; display:none;" class="faq-content">
                Sí, ofrecemos garantía mecánica por escrito según el tipo de vehículo y el año/modelo.
            </div>
        </div>

    </section>
    
    <section class="container py-5">
        <h2 class="text-center mb-4">¿Tienes otra pregunta? Contáctanos</h2>
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                
                <div class="mb-3">
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Placeholder="Tu Nombre Completo" required="true"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Tu Correo Electrónico" TextMode="Email" required="true"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:TextBox ID="txtMensaje" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" Placeholder="Escribe tu pregunta o mensaje aquí..." required="true"></asp:TextBox>
                </div>

                <div class="d-grid gap-2">
                    <asp:Button ID="btnEnviar" runat="server" Text="Enviar Pregunta" CssClass="btn btn-primary btn-lg" OnClick="btnEnviar_Click" />
                </div>

            </div>
        </div>
    </section>
    <script type="text/javascript">
        var labels = document.querySelectorAll("label[for^='faq']");
        labels.forEach(function (lbl) {
            lbl.addEventListener("click", function () {
                var id = lbl.getAttribute("for");
                var content = document.querySelector("#" + id).parentNode.querySelector(".faq-content");
                content.style.display = (content.style.display === "block") ? "none" : "block";
            });
        });
    </script>
</asp:Content>
<%@ Page Title="Preguntas Frecuentes" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="Preguntas.aspx.cs" Inherits="TrabajoPFconcesionaria4.Preguntas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section class="container" style="margin-top: 40px; margin-bottom:40px;">

        <h1 class="text-center mb-4">Preguntas Frecuentes</h1>
        <p class="text-center mb-5">Resolvemos las dudas más comunes sobre nuestros autos usados, financiación, documentación y garantía.</p>

        <!-- FAQ 1 -->
        <div style="border: 1px solid #ccc; border-radius: 6px; margin-bottom: 15px;">
            <input type="checkbox" id="faq1" style="display:none;">
            <label for="faq1" style="display:block; padding: 15px; font-size:18px; font-weight:bold; cursor:pointer; background:#f7f7f7;">
                ¿Los autos están verificados y con informe?
            </label>
            <div style="padding: 15px; display:none;" class="faq-content">
                Todos nuestros vehículos pasan por un control riguroso y se entregan con informe de dominio e informe técnico para tu tranquilidad.
            </div>
        </div>

        <!-- FAQ 2 -->
        <div style="border: 1px solid #ccc; border-radius: 6px; margin-bottom: 15px;">
            <input type="checkbox" id="faq2" style="display:none;">
            <label for="faq2" style="display:block; padding: 15px; font-size:18px; font-weight:bold; cursor:pointer; background:#f7f7f7;">
                ¿Puedo entregar mi auto usado como parte de pago?
            </label>
            <div style="padding: 15px; display:none;" class="faq-content">
                Sí. Tomamos tu vehículo al mejor precio del mercado y podés usarlo como parte del pago para facilitar la operación.
            </div>
        </div>

        <!-- FAQ 3 -->
        <div style="border: 1px solid #ccc; border-radius: 6px; margin-bottom: 15px;">
            <input type="checkbox" id="faq3" style="display:none;">
            <label for="faq3" style="display:block; padding: 15px; font-size:18px; font-weight:bold; cursor:pointer; background:#f7f7f7;">
                ¿Ofrecen financiación?
            </label>
            <div style="padding: 15px; display:none;" class="faq-content">
                Contamos con financiación en cuotas fijas en pesos con entidades bancarias, pudiendo financiar hasta el 80% del valor del vehículo.
            </div>
        </div>

        <!-- FAQ 4 -->
        <div style="border: 1px solid #ccc; border-radius: 6px; margin-bottom: 15px;">
            <input type="checkbox" id="faq4" style="display:none;">
            <label for="faq4" style="display:block; padding: 15px; font-size:18px; font-weight:bold; cursor:pointer; background:#f7f7f7;">
                ¿Qué documentación necesito para comprar un auto?
            </label>
            <div style="padding: 15px; display:none;" class="faq-content">
                Solo necesitás DNI, comprobante de domicilio y constancia de CUIL. Nosotros nos encargamos del resto con nuestros gestores matriculados.
            </div>
        </div>

        <!-- FAQ 5 -->
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

    <!-- Pequeño script interno para mostrar/ocultar -->
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

using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TrabajoPFconcesionaria4
{
    public partial class Usados : System.Web.UI.Page
    {
        // 🔗 Cadena de conexión a tu base de datos real
        private string connectionString = "Data Source=DESKTOP-1HTEND1;Initial Catalog=Concesionaria4PF;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("Login.aspx");
                }

                CargarAutos();
            }
        }

        // 🧱 CARGAR TABLA
        private void CargarAutos()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM AutosUsados ORDER BY Marca, NombreAuto", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvAutos.DataSource = dt;
                gvAutos.DataBind();
            }
        }

        // ✏️ EDITAR FILA
        protected void gvAutos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvAutos.EditIndex = e.NewEditIndex;
            CargarAutos();
        }

        // 💾 GUARDAR CAMBIOS
        protected void gvAutos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvAutos.Rows[e.RowIndex];
            int id = Convert.ToInt32(gvAutos.DataKeys[e.RowIndex].Value);

            string nombreActual = row.Cells[1].Text;
            string marcaActual = row.Cells[2].Text;
            string colorActual = row.Cells[3].Text;
            string anioActual = row.Cells[4].Text;
            string combustibleActual = row.Cells[5].Text;
            string motorActual = row.Cells[6].Text;
            string precioActual = row.Cells[7].Text;

            string nombreNuevo = ((TextBox)row.Cells[1].Controls[0]).Text.Trim();
            string marcaNuevo = ((TextBox)row.Cells[2].Controls[0]).Text.Trim();
            string colorNuevo = ((TextBox)row.Cells[3].Controls[0]).Text.Trim();
            string anioTexto = ((TextBox)row.Cells[4].Controls[0]).Text.Trim();
            string combustibleNuevo = ((TextBox)row.Cells[5].Controls[0]).Text.Trim();
            string motorTexto = ((TextBox)row.Cells[6].Controls[0]).Text.Trim();
            string precioTexto = ((TextBox)row.Cells[7].Controls[0]).Text.Trim();

            string nombre = string.IsNullOrEmpty(nombreNuevo) ? nombreActual : nombreNuevo;
            string marca = string.IsNullOrEmpty(marcaNuevo) ? marcaActual : marcaNuevo;
            string color = string.IsNullOrEmpty(colorNuevo) ? colorActual : colorNuevo;
            string combustible = string.IsNullOrEmpty(combustibleNuevo) ? combustibleActual : combustibleNuevo;

            int anio;
            if (!int.TryParse(anioTexto, out anio))
                int.TryParse(anioActual, out anio);

            decimal motor;
            if (!decimal.TryParse(motorTexto.Replace(',', '.'), System.Globalization.NumberStyles.Any,
                System.Globalization.CultureInfo.InvariantCulture, out motor))
                decimal.TryParse(motorActual.Replace(',', '.'), System.Globalization.NumberStyles.Any,
                System.Globalization.CultureInfo.InvariantCulture, out motor);

            decimal precio;
            if (!decimal.TryParse(precioTexto.Replace(',', '.'), System.Globalization.NumberStyles.Any,
                System.Globalization.CultureInfo.InvariantCulture, out precio))
                decimal.TryParse(precioActual.Replace(',', '.'), System.Globalization.NumberStyles.Any,
                System.Globalization.CultureInfo.InvariantCulture, out precio);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"UPDATE AutosUsados 
                         SET NombreAuto=@Nombre, Marca=@Marca, Color=@Color, 
                             AnioFabricacion=@Anio, Combustible=@Combustible, 
                             TipoMotor=@Motor, Precio=@Precio 
                         WHERE AutoID=@ID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Nombre", nombre);
                cmd.Parameters.AddWithValue("@Marca", marca);
                cmd.Parameters.AddWithValue("@Color", color);
                cmd.Parameters.AddWithValue("@Anio", anio);
                cmd.Parameters.AddWithValue("@Combustible", combustible);
                cmd.Parameters.AddWithValue("@Motor", motor);
                cmd.Parameters.AddWithValue("@Precio", precio);
                cmd.Parameters.AddWithValue("@ID", id);

                try
                {
                    con.Open();
                    int filas = cmd.ExecuteNonQuery();

                    if (filas > 0)
                        ScriptManager.RegisterStartupScript(this, GetType(), "toastSuccess",
                            "mostrarToast('✅ Registro actualizado correctamente', 'success');", true);
                    else
                        ScriptManager.RegisterStartupScript(this, GetType(), "toastWarn",
                            "mostrarToast('⚠️ No se realizaron cambios', 'warning');", true);
                }
                catch (SqlException ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "toastError",
                        "mostrarToast('❌ Error al actualizar: " + ex.Message.Replace("'", "\\'") + "', 'error');", true);
                }
                finally
                {
                    con.Close();
                }
            }

            gvAutos.EditIndex = -1;
            CargarAutos();
        }

        // 🔴 CANCELAR EDICIÓN
        protected void gvAutos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvAutos.EditIndex = -1; // sale del modo edición
            CargarAutos(); // recarga los datos
        }

        // 🗑️ ELIMINAR FILA
       protected void gvAutos_RowDeleting(object sender, GridViewDeleteEventArgs e)
{
    int id = Convert.ToInt32(gvAutos.DataKeys[e.RowIndex].Value);

    using (SqlConnection con = new SqlConnection(connectionString))
    {
        SqlCommand cmd = new SqlCommand("DELETE FROM AutosUsados WHERE AutoID=@ID", con);
        cmd.Parameters.AddWithValue("@ID", id);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    CargarAutos();

    // 🔴 Mostrar toast rojo
    ClientScript.RegisterStartupScript(this.GetType(), "toast",
        "mostrarToast('Auto eliminado correctamente', 'error');", true);
}

        // 🔴 Toast rojo elegante (arriba a la derecha)
        string script = @"
            const toast = document.createElement('div');
            toast.textContent = '🗑️ Auto eliminado correctamente';
            toast.style.position = 'fixed';
            toast.style.top = '20px';
            toast.style.right = '20px';
            toast.style.backgroundColor = '#dc3545';
            toast.style.color = 'white';
            toast.style.padding = '12px 20px';
            toast.style.borderRadius = '8px';
            toast.style.boxShadow = '0 2px 10px rgba(0,0,0,0.3)';
            toast.style.zIndex = '9999';
            toast.style.fontFamily = 'Segoe UI, sans-serif';
            toast.style.transition = 'opacity 0.5s ease';
            toast.style.opacity = '1';
            document.body.appendChild(toast);
            setTimeout(() => { toast.style.opacity = '0'; setTimeout(()=>toast.remove(), 500); }, 2500);
        ";
        ClientScript.RegisterStartupScript(this.GetType(), "toast", script, true);

        CargarAutos();
    }
    catch (Exception ex)
    {
        string scriptError = $@"
            const toast = document.createElement('div');
            toast.textContent = '⚠️ Error al eliminar: {ex.Message.Replace("'", "\\'")}';
            toast.style.position = 'fixed';
            toast.style.top = '20px';
            toast.style.right = '20px';
            toast.style.backgroundColor = '#343a40';
            toast.style.color = 'white';
            toast.style.padding = '12px 20px';
            toast.style.borderRadius = '8px';
            toast.style.boxShadow = '0 2px 10px rgba(0,0,0,0.3)';
            toast.style.zIndex = '9999';
            toast.style.fontFamily = 'Segoe UI, sans-serif';
            document.body.appendChild(toast);
            setTimeout(() => toast.remove(), 3000);
        ";
        ClientScript.RegisterStartupScript(this.GetType(), "toastError", scriptError, true);
    }
}
}
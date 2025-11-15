using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TrabajoPFconcesionaria4
{
    public partial class Usados : System.Web.UI.Page
    {
        private string connectionString = "Data Source=DESKTOP-1HTEND1;Initial Catalog=Concesionaria4PF;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CargarAutos();
        }

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

        // AGREGAR NUEVO AUTO
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"INSERT INTO AutosUsados 
                                (NombreAuto, Marca, Color, AnioFabricacion, Combustible, TipoMotor, Precio)
                                VALUES (@Nombre, @Marca, @Color, @Anio, @Combustible, @Motor, @Precio)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Nombre", txtNombre.Text);
                    cmd.Parameters.AddWithValue("@Marca", txtMarca.Text);
                    cmd.Parameters.AddWithValue("@Color", txtColor.Text);
                    cmd.Parameters.AddWithValue("@Anio", int.Parse(txtAnio.Text));
                    cmd.Parameters.AddWithValue("@Combustible", txtCombustible.Text);
                    cmd.Parameters.AddWithValue("@Motor", decimal.Parse(txtMotor.Text));
                    cmd.Parameters.AddWithValue("@Precio", decimal.Parse(txtPrecio.Text));

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            // limpiar
            txtNombre.Text = "";
            txtMarca.Text = "";
            txtColor.Text = "";
            txtAnio.Text = "";
            txtCombustible.Text = "";
            txtMotor.Text = "";
            txtPrecio.Text = "";

            CargarAutos();
        }


        // EDITAR
        protected void gvAutos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvAutos.EditIndex = e.NewEditIndex;
            CargarAutos();
        }

        // CANCELAR
        protected void gvAutos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvAutos.EditIndex = -1;
            CargarAutos();
        }

        // ACTUALIZAR
        protected void gvAutos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvAutos.Rows[e.RowIndex];
            int id = Convert.ToInt32(gvAutos.DataKeys[e.RowIndex].Value);

            string nombre = ((TextBox)row.Cells[1].Controls[0]).Text;
            string marca = ((TextBox)row.Cells[2].Controls[0]).Text;
            string color = ((TextBox)row.Cells[3].Controls[0]).Text;
            int anio = int.Parse(((TextBox)row.Cells[4].Controls[0]).Text);
            string combustible = ((TextBox)row.Cells[5].Controls[0]).Text;
            decimal motor = decimal.Parse(((TextBox)row.Cells[6].Controls[0]).Text);
            decimal precio = decimal.Parse(((TextBox)row.Cells[7].Controls[0]).Text);

            string query = @"UPDATE AutosUsados SET 
                            NombreAuto=@Nombre,
                            Marca=@Marca,
                            Color=@Color,
                            AnioFabricacion=@Anio,
                            Combustible=@Combustible,
                            TipoMotor=@Motor,
                            Precio=@Precio
                            WHERE AutoID=@ID";

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@Nombre", nombre);
                cmd.Parameters.AddWithValue("@Marca", marca);
                cmd.Parameters.AddWithValue("@Color", color);
                cmd.Parameters.AddWithValue("@Anio", anio);
                cmd.Parameters.AddWithValue("@Combustible", combustible);
                cmd.Parameters.AddWithValue("@Motor", motor);
                cmd.Parameters.AddWithValue("@Precio", precio);
                cmd.Parameters.AddWithValue("@ID", id);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            gvAutos.EditIndex = -1;
            CargarAutos();
        }

        // ELIMINAR
        protected void gvAutos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvAutos.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("DELETE FROM AutosUsados WHERE AutoID=@ID", con))
            {
                cmd.Parameters.AddWithValue("@ID", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            CargarAutos();
        }
       

    }
}


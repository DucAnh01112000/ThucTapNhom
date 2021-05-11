using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace AppQuanLyThuVien
{
    public partial class ThongKeDocGiaQuaHan : Form
    {
        SqlConnection connect = new SqlConnection(ConnectionString.str);
        public ThongKeDocGiaQuaHan()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void ThongKeDocGiaQuaHan_Load(object sender, EventArgs e)
        {
            var cmd = new SqlCommand("tkdocgiamuonquahan", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter data = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            data.Fill(table);
            dgv_ThongKeDocGiaQuaHan.DataSource = table;
        }
    }
}

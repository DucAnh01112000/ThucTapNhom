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
using AppQuanLyThuVien.KetNoi;

namespace AppQuanLyThuVien
{
    public partial class ThongKeDocGiaDangMuon : Form
    {
        SqlConnection connect = new SqlConnection(ConnectionString.str);
        public ThongKeDocGiaDangMuon()
        {
            InitializeComponent();
        }

        private void ThongKeDocGiaDangMuon_Load_1(object sender, EventArgs e)
        {
            var cmd = new SqlCommand("tkdocgiadangmuon", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter data = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            data.Fill(table);
            dgv_DocGiaDangMuon.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgv_DocGiaDangMuon.DataSource = table;
        }
    }
}

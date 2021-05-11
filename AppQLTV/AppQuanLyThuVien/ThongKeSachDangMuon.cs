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
    public partial class ThongKeSachDangMuon : Form
    {
        SqlConnection connect = new SqlConnection(ConnectionString.str);
        DataBaseThuVien dt = new DataBaseThuVien();
        public ThongKeSachDangMuon()
        {
            InitializeComponent();
        }

        private void ThongKeSachDangMuon_Load(object sender, EventArgs e)
        {
            var cmd = new SqlCommand("tksachdangmuon", connect);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter data = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            data.Fill(table);
            dgv_SachDangMuon.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgv_SachDangMuon.DataSource = table;
        }
    }
}

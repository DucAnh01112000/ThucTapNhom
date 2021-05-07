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
    public partial class TimKiemDocGia : Form
    {
        DataBaseThuVien alo = new DataBaseThuVien();

        public TimKiemDocGia()
        {
            InitializeComponent();
        }
        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void btn_Tim_Click(object sender, EventArgs e)
        {
            string query = txb_TimKiemDocGia.Text;
            //dgv_DocGia.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            //dgv_DocGia.DataSource = ds;
            if (rbtn_TimKiemMaDocGia.Checked == true)
            { 
                var ds = alo.DocGias.SqlQuery("SELECT* FROM DocGia WHERE maDG = '"+query+ "' ").ToList();
                dgv_DocGia.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
                dgv_DocGia.DataSource = ds;
            }
            else
            {
                var ds1 = alo.DocGias.SqlQuery("SELECT* FROM DocGia WHERE tenDG = N'" + query + "' ").ToList();
                dgv_DocGia.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
                dgv_DocGia.DataSource = ds1;
            }
            
        }

        private void btn_Thoat_Click(object sender, EventArgs e)
        {
            DialogResult tb;
            tb = MessageBox.Show("Bạn có muốn thoát ?", "Thông Báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (tb == DialogResult.OK)
            {
                this.Close();
            }
            this.Show();
        }
    }
}

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
    public partial class TimKiemSach : Form
    {
        DataBaseThuVien alo1 = new DataBaseThuVien();
        public TimKiemSach()
        {
            InitializeComponent();
        }

        private void txb_TimKiemSach_TextChanged(object sender, EventArgs e)
        {
           
        }

        private void btn_Tim_Click(object sender, EventArgs e)
        {
            string tr = txb_TimKiemSach.Text;
            int a;
            if (rbtn_TimKiemMaSach.Checked == true)
            {
                if(int.TryParse(tr, out a) == true && tr.Length == 10)
                {
                    SqlConnection connect = new SqlConnection(ConnectionString.str);
                    try
                    {
                        connect.Open();
                        string tr1 = "SELECT* FROM TuaSach WHERE maTS = '" + tr + "' ";
                        var cmd = new SqlCommand(tr1, connect);
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read() == true)
                        {
                            MessageBox.Show("Tìm kiếm thành công");
                            var ds = alo1.TuaSaches.SqlQuery("SELECT* FROM TuaSach WHERE maTS = '" + tr + "' ").ToList();
                            dgv_Sach.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
                            dgv_Sach.DataSource = ds;
                        }
                        else MessageBox.Show("Không tìm thấy kết quả");
                        connect.Close();
                    }
                    catch
                    {
                        MessageBox.Show("Kết nối thất bại");
                    }
                    
                    
                }
                else
                    MessageBox.Show("Mã sách phải gồm có 10 số !! Mời bạn nhập lại ");

            }
            else
            {
                var ds1 = alo1.TuaSaches.SqlQuery("SELECT* FROM TuaSach WHERE tenTS = N'" + tr + "' ").ToList();
                dgv_Sach.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
                dgv_Sach.DataSource = ds1;
            }
        }

        private void btn_Thoat_Click(object sender, EventArgs e)
        {
            DialogResult tb;
            tb = MessageBox.Show("Bạn có muốn thoát ?", "Thông Báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if(tb == DialogResult.OK)
            {
                this.Close();
            }this.Show();
        }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QLKS_NHOM1.DAO;

namespace QLKS_NHOM1.GUI
{
    public partial class fRegister : Form
    {
        public fRegister()
        {
            InitializeComponent();
        }

        private void btnXacNhan_Click(object sender, EventArgs e)
        { 
            string UserName = txtUserName.Text;
            string PassWord = txtMatKhau.Text;

            try
            {
                if (UserName == "" || PassWord == "")
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin");
                    return;
                }
                else if (MessageBox.Show("Bạn có thật sự muốn tạo tài khoản này!", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                {
                    AccountDAO.Instance.Insert(UserName, PassWord);
                    MessageBox.Show("Tạo tài khoản thành công");
                    fLogin frm = new fLogin();
                    this.Hide();
                    frm.ShowDialog();
                    this.Show();
                }
                else
                {
                    MessageBox.Show("Thông tin tài khoản này đã tồn tại!");
                    return;
                }
            }
            catch (Exception err)
            {
                MessageBox.Show("Có lỗi xảy ra" + err.ToString());
            }
        }
    }
}

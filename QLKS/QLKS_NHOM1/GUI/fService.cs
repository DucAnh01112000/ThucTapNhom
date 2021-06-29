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
    public partial class fService : Form
    {
        BindingSource ServiceList = new BindingSource();
        public fService()
        {
            InitializeComponent();
            LoadData();
            BindingDataToForm();
        }

        private void BindingDataToForm()
        {
            txtTenDichVu.DataBindings.Add(new Binding("Text", dgvService.DataSource, "NameService", true, DataSourceUpdateMode.Never));
            textGiaTien.DataBindings.Add(new Binding("Text", dgvService.DataSource, "Price", true, DataSourceUpdateMode.Never));
            
        }

        private void LoadData()
        {
            dgvService.DataSource = ServiceList;
            LoadListService();
            EditDataGridViewHeader();
        }
        private void EditDataGridViewHeader()
        {
            dgvService.Columns["ServiceId"].HeaderText = "ID Dịch Vụ";
            dgvService.Columns["NameService"].HeaderText = "Tên dịch vụ";
            dgvService.Columns["Price"].HeaderText = "Giá Tiền";
        }
        private void LoadListService()
        {
            ServiceList.DataSource = ServiceDAO.Instance.GetAll();
        }

        private void btnLamTrong_Click(object sender, EventArgs e)
        {
            txtTenDichVu.Text = "";
            textGiaTien.Text = "";
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            string NameService = txtTenDichVu.Text;
            int Price = -1;
            Int32.TryParse(textGiaTien.Text, out Price);

            try
            {
                if (NameService == "" || Price == -1)
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin");
                    return;
                }
                else if (MessageBox.Show("Bạn có thật sự muốn thêm dịch vụ này!", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                { 
                    ServiceDAO.Instance.Insert(NameService, Price);
                    MessageBox.Show("Thêm thành công");
                    LoadData();
                }
            }
            catch (Exception err)
            {
                MessageBox.Show("Có lỗi xảy ra" + err.ToString());
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            int row = dgvService.CurrentCell.RowIndex;
            int ServiceId;
            Int32.TryParse(dgvService.Rows[row].Cells[0].Value.ToString().Trim(), out ServiceId);
            string NameService = txtTenDichVu.Text;
            int Price = -1;
            Int32.TryParse(textGiaTien.Text, out Price);

            try
            {
                if (ServiceId == -1 || NameService == "" || Price == -1)
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin");
                    return;
                }
                else if (MessageBox.Show("Bạn có thật sự muốn sửa dịch vụ này!", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                {
                    ServiceDAO.Instance.Update(ServiceId, NameService, Price);
                    MessageBox.Show("Cập nhật thành công");
                    LoadData();
                }

            }
            catch (Exception err)
            {
                MessageBox.Show("Có lỗi xảy ra" + err.ToString());
                LoadData();
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            int row = dgvService.CurrentCell.RowIndex;
            int ServiceId;
            Int32.TryParse(dgvService.Rows[row].Cells[0].Value.ToString().Trim(), out ServiceId);
            try
            {
                if (MessageBox.Show("Bạn có thật sự muốn xoá dịch vụ này!", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                {
                    ServiceDAO.Instance.Delete(ServiceId);
                    MessageBox.Show("Xóa thành công!");
                    LoadData();
                }

            }
            catch (Exception err)
            {
                MessageBox.Show("Có lỗi xảy ra" + err.ToString());
                LoadData();
            }
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            LoadListService();
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            string search = txtTimKiem.Text.Trim();
            if (search.Equals(""))
            {
                MessageBox.Show("Mời bạn nhập thông tin tìm kiếm!");
                return;
            }
            else
            {
                ServiceList.DataSource = ServiceDAO.Instance.Search(search);
            }
        }
    }
}

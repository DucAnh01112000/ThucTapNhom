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
    public partial class fCustomer : Form
    {
        BindingSource CustomerList = new BindingSource();
        public fCustomer()
        {
            InitializeComponent();
            LoadData();
            BindingDataToForm();
        }

        private void BindingDataToForm()
        {
            txtHoTen.DataBindings.Add(new Binding("Text", dgvCustomer.DataSource, "NameCustomer", true, DataSourceUpdateMode.Never));
            dtNgayDat.DataBindings.Add(new Binding("Text", dgvCustomer.DataSource, "DateTimeCustomer", true, DataSourceUpdateMode.Never));
            cbGioiTinh.DataBindings.Add(new Binding("Text", dgvCustomer.DataSource, "GenderCustomer", true, DataSourceUpdateMode.Never));
            txtDiaChi.DataBindings.Add(new Binding("Text", dgvCustomer.DataSource, "AddressCustomer", true, DataSourceUpdateMode.Never));
            txtCCCD.DataBindings.Add(new Binding("Text", dgvCustomer.DataSource, "IdCardCustomer", true, DataSourceUpdateMode.Never));
            txtSDT.DataBindings.Add(new Binding("Text", dgvCustomer.DataSource, "PhoneNumber", true, DataSourceUpdateMode.Never));
        }

        private void LoadData()
        {
            dgvCustomer.DataSource = CustomerList;
            LoadListCustomer();
            EditDataGridViewHeader();
        }

        private void EditDataGridViewHeader()
        {
            dgvCustomer.Columns["CustomerId"].HeaderText = "Mã Khách Hàng";
            dgvCustomer.Columns["NameCustomer"].HeaderText = "Họ Tên";
            dgvCustomer.Columns["DateTimeCustomer"].HeaderText = "Ngày Đặt";
            dgvCustomer.Columns["GenderCustomer"].HeaderText = "Giới Tính";
            dgvCustomer.Columns["AddressCustomer"].HeaderText = "Địa Chỉ";
            dgvCustomer.Columns["IdCardCustomer"].HeaderText = "CCCD";
            dgvCustomer.Columns["PhoneNumber"].HeaderText = "Số Điện Thoại";
        }

        private void LoadListCustomer()
        {
            CustomerList.DataSource = CustomerDAO.Instance.GetAll();
        }

        private void btnLamTrong_Click(object sender, EventArgs e)
        {
            txtHoTen.Text = "";
            dtNgayDat.Value = DateTime.Now;
            cbGioiTinh.Text = "";
            txtDiaChi.Text = "";
            txtCCCD.Text = "";
            txtSDT.Text = "";
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            LoadListCustomer();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            string NameCustomer = txtHoTen.Text;
            DateTime DateTimeCustomer;
            DateTime.TryParse(dtNgayDat.Text, out DateTimeCustomer);
            string GenderCustomer = cbGioiTinh.Text;
            string AddressCustomer = txtDiaChi.Text;
            string IdCardCustomer = txtCCCD.Text;
            string PhoneNumber = txtSDT.Text;

            try
            {
                if (NameCustomer == "" || DateTimeCustomer == null || GenderCustomer == "" || AddressCustomer == "" || IdCardCustomer == "" || PhoneNumber == "")
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin");
                    return;
                }
                else if (MessageBox.Show("Bạn có thật sự muốn thêm khách hàng này!", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                {
                    CustomerDAO.Instance.Insert(NameCustomer, DateTimeCustomer, GenderCustomer, AddressCustomer, IdCardCustomer, PhoneNumber);
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
            int row = dgvCustomer.CurrentCell.RowIndex;
            int CustomerId;
            Int32.TryParse(dgvCustomer.Rows[row].Cells[0].Value.ToString().Trim(), out CustomerId);
            string NameCustomer = txtHoTen.Text;
            DateTime DateTimeCustomer;
            DateTime.TryParse(dtNgayDat.Text, out DateTimeCustomer);
            string GenderCustomer = cbGioiTinh.Text;
            string AddressCustomer = txtDiaChi.Text;
            string IdCardCustomer = txtCCCD.Text;
            string PhoneNumber = txtSDT.Text;

            try
            {
                if (NameCustomer == "" || DateTimeCustomer == null || GenderCustomer == "" || AddressCustomer == "" || IdCardCustomer == "" || PhoneNumber == "")
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin");
                    return;
                }
                else if (MessageBox.Show("Bạn có thật sự muốn sửa khách hàng này!", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                {
                    CustomerDAO.Instance.Update(CustomerId, NameCustomer, DateTimeCustomer, GenderCustomer, AddressCustomer, IdCardCustomer, PhoneNumber);
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
            int row = dgvCustomer.CurrentCell.RowIndex;
            int CustomerId;
            Int32.TryParse(dgvCustomer.Rows[row].Cells[0].Value.ToString().Trim(), out CustomerId);
            try
            {
                if (MessageBox.Show("Bạn có thật sự muốn xoá khách hàng này!", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                {
                    CustomerDAO.Instance.Delete(CustomerId);
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
                CustomerList.DataSource = CustomerDAO.Instance.Search(search);
            }
        }
    }
}

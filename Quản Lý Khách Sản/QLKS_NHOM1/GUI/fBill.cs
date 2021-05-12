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
    public partial class fBill : Form
    {
        BindingSource BillList = new BindingSource();
        public fBill()
        {
            InitializeComponent();
            LoadData();
            BindingDataToForm();
        }

        private void BindingDataToForm()
        {
            comboMaKhachHang.DataBindings.Add(new Binding("Text", dgvBill.DataSource, "CustomerId", true, DataSourceUpdateMode.Never));
            dtNgayNhan.DataBindings.Add(new Binding("Text", dgvBill.DataSource, "DateCheckIn", true, DataSourceUpdateMode.Never));
            dtNgayTra.DataBindings.Add(new Binding("Text", dgvBill.DataSource, "DateCheckOut", true, DataSourceUpdateMode.Never));
            comboMaPhong.DataBindings.Add(new Binding("Text", dgvBill.DataSource, "RoomId", true, DataSourceUpdateMode.Never));
            comboTinhTrang.DataBindings.Add(new Binding("Text", dgvBill.DataSource, "Status", true, DataSourceUpdateMode.Never));
        }

        private void LoadData()
        {
            dgvBill.DataSource = BillList;
            LoadListBill();
            LoadComboboxCustomerId();
            LoadComboboxRoomId();
            EditDataGridViewHeader();
        }
        private void EditDataGridViewHeader()
        {
            dgvBill.Columns["BillId"].HeaderText = "ID Hóa Đơn";
            dgvBill.Columns["CustomerId"].HeaderText = "ID Khách Hàng";
            dgvBill.Columns["DateCheckIn"].HeaderText = "Ngày Nhận";
            dgvBill.Columns["DateCheckOut"].HeaderText = "Ngày trả";
            dgvBill.Columns["RoomId"].HeaderText = "ID Phòng";
            dgvBill.Columns["Status"].HeaderText = "Tình Trạng";
        }
        private void LoadListBill()
        {
            BillList.DataSource = BillDAO.Instance.GetAll();
        }

        private void LoadComboboxCustomerId()
        {
            comboMaKhachHang.DataSource = CustomerDAO.Instance.GetAll();
            comboMaKhachHang.DisplayMember = "CustomerId";
        }

        private void LoadComboboxRoomId()
        {
            comboMaPhong.DataSource = RoomDAO.Instance.GetAll();
            comboMaPhong.DisplayMember = "RoomId";
        }

        private void btnLamTrong_Click(object sender, EventArgs e)
        {
            LoadComboboxCustomerId();
            dtNgayNhan.Value = DateTime.Now;
            dtNgayTra.Value = DateTime.Now;
            LoadComboboxRoomId();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            int CustomerId = -1;
            Int32.TryParse(comboMaKhachHang.Text, out CustomerId);
            DateTime DateCheckIn;
            DateTime.TryParse(dtNgayNhan.Text, out DateCheckIn);
            DateTime DateCheckOut;
            DateTime.TryParse(dtNgayNhan.Text, out DateCheckOut);
            int RoomId = -1;
            Int32.TryParse(comboMaPhong.Text, out RoomId);
            int Status = -1;
            Int32.TryParse(comboTinhTrang.Text, out Status);

            try
            {
                if (CustomerId == -1 || DateCheckIn == null || DateCheckOut == null || RoomId == -1 || Status == -1)
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin");
                    return;
                }
                else if (MessageBox.Show("Bạn có thật sự muốn thêm hóa đơn này!", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                {
                    BillDAO.Instance.Insert(CustomerId, DateCheckIn, DateCheckOut, RoomId, Status);
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
            int row = dgvBill.CurrentCell.RowIndex;
            int BillId;
            Int32.TryParse(dgvBill.Rows[row].Cells[0].Value.ToString().Trim(), out BillId);
            
            int CustomerId = -1;
            Int32.TryParse(comboMaKhachHang.Text, out CustomerId);
            DateTime DateCheckIn;
            DateTime.TryParse(dtNgayNhan.Text, out DateCheckIn);
            DateTime DateCheckOut;
            DateTime.TryParse(dtNgayNhan.Text, out DateCheckOut);
            int RoomId = -1;
            Int32.TryParse(comboMaPhong.Text, out RoomId);
            int Status = -1;
            Int32.TryParse(comboTinhTrang.Text, out Status);

            try
            {
                if (BillId == -1 || CustomerId == -1 || DateCheckIn == null || DateCheckOut == null || RoomId == -1 || Status == -1)
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin");
                    return;
                }
                else if (MessageBox.Show("Bạn có thật sự muốn sửa hóa đơn này!", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                {
                    BillDAO.Instance.Update(BillId, CustomerId, DateCheckIn, DateCheckOut, RoomId, Status);
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
            int row = dgvBill.CurrentCell.RowIndex;
            int BillId;
            Int32.TryParse(dgvBill.Rows[row].Cells[0].Value.ToString().Trim(), out BillId);
            try
            {
                if (MessageBox.Show("Bạn có thật sự muốn xoá hóa đơn này!", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                {
                    BillDAO.Instance.Delete(BillId);
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
            LoadListBill();
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
                BillList.DataSource = BillDAO.Instance.Search(search);
            }
        }
    }
}

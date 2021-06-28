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
    public partial class fRoom : Form
    {
        BindingSource RoomList = new BindingSource();
        public fRoom()
        {
            InitializeComponent();
            LoadData();
            BindingDataToForm();
       
        }
        private void BindingDataToForm()
        {
            textTenPhong.DataBindings.Add(new Binding("Text", dgvRoom.DataSource, "NameRoom", true, DataSourceUpdateMode.Never));
            comboTinhTrang.DataBindings.Add(new Binding("Text", dgvRoom.DataSource, "Status", true, DataSourceUpdateMode.Never));
            comboMaLoaiPhong.DataBindings.Add(new Binding("Text", dgvRoom.DataSource, "RoomTypeId", true, DataSourceUpdateMode.Never));
        }

        private void LoadData()
        {
            dgvRoom.DataSource = RoomList;
            LoadListRoom();
            LoadComboboxRoomType();
            EditDataGridViewHeader();
        }
        private void EditDataGridViewHeader()
        {
            dgvRoom.Columns["RoomId"].HeaderText = "ID Phòng";
            dgvRoom.Columns["NameRoom"].HeaderText = "Tên Phòng";
            dgvRoom.Columns["Status"].HeaderText = "Tình Trạng";
            

        dgvRoom.Columns["RoomTypeId"].HeaderText = "Mã Loại Phòng";
        }
        private void LoadListRoom()
        {
            RoomList.DataSource = RoomDAO.Instance.GetAll();
        }

        private void LoadComboboxRoomType()
        {
            comboMaLoaiPhong.DataSource = RomTypeDAO.Instance.GetAll();

            comboMaLoaiPhong.DisplayMember = "RoomTypeId";
        }

        private void btnLamTrong_Click(object sender, EventArgs e)
        {
            textTenPhong.Text = "";
            comboTinhTrang.Text = "";
            comboMaLoaiPhong.Text = "";
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
                RoomList.DataSource = RoomDAO.Instance.Search(search);
            }
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            LoadListRoom();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            int row = dgvRoom.CurrentCell.RowIndex;
            int RoomId;
            Int32.TryParse(dgvRoom.Rows[row].Cells[0].Value.ToString().Trim(), out RoomId);
            try
            {
                if (MessageBox.Show("Bạn có thật sự muốn xoá phòng này!", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                {
                    RoomDAO.Instance.Delete(RoomId);
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

        private void btnSua_Click(object sender, EventArgs e)
        {
            int row = dgvRoom.CurrentCell.RowIndex;
            int RoomId;
            Int32.TryParse(dgvRoom.Rows[row].Cells[0].Value.ToString().Trim(), out RoomId);
            string NameRoom = textTenPhong.Text;
            int Status = -1;
            Int32.TryParse(comboTinhTrang.Text, out Status);
            int RoomTypeId = -1;
            Int32.TryParse(comboMaLoaiPhong.Text, out RoomTypeId);
            try
            {
                if (RoomId == -1 || NameRoom == "" || Status == -1 || RoomTypeId == -1)
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin");
                    return;
                }
                else if (MessageBox.Show("Bạn có thật sự muốn sửa phòng này!", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                {
                    RoomDAO.Instance.Update(RoomId, NameRoom, Status, RoomTypeId);
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

        private void btnThem_Click(object sender, EventArgs e)
        {
            string NameRoom = textTenPhong.Text;
            int Status = -1;
            Int32.TryParse(comboTinhTrang.Text, out Status);
            int RoomTypeId = -1;
            Int32.TryParse(comboMaLoaiPhong.Text, out RoomTypeId);

            try
            {
                if (NameRoom == "" || Status == -1 || RoomTypeId == -1)
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin");
                    return;
                }
                else if (MessageBox.Show("Bạn có thật sự muốn thêm phòng này!", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                {
                    RoomDAO.Instance.Insert(NameRoom, Status, RoomTypeId);
                    MessageBox.Show("Thêm thành công");
                    LoadData();
                }
            }
            catch (Exception err)
            {
                MessageBox.Show("Có lỗi xảy ra" + err.ToString());
            }
        }
    }
}

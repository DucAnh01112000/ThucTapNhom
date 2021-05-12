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
    public partial class fRoomType : Form
    {
        BindingSource RoomTypeList = new BindingSource();
        public fRoomType()
        {
            InitializeComponent();
            LoadData();
            BindingDataToForm();
        }

        private void BindingDataToForm()
        {
            textNameRoom.DataBindings.Add(new Binding("Text", dgvTypeRoom.DataSource, "NameType", true, DataSourceUpdateMode.Never));
            textPrice.DataBindings.Add(new Binding("Text", dgvTypeRoom.DataSource, "Price", true, DataSourceUpdateMode.Never));
        }

        private void LoadData()
        {
            dgvTypeRoom.DataSource = RoomTypeList;
            LoadListRoomType();
            EditDataGridViewHeader();
        }

        private void EditDataGridViewHeader()
        {
            dgvTypeRoom.Columns["RoomTypeId"].HeaderText = "ID Loại Phòng";
            dgvTypeRoom.Columns["NameType"].HeaderText = "Tên Loại Phòng";
            dgvTypeRoom.Columns["Price"].HeaderText = "Giá Tiền";
        }

        private void LoadListRoomType()
        {
            RoomTypeList.DataSource = RomTypeDAO.Instance.GetAll();
        }
        private void btnLamTrong_Click(object sender, EventArgs e)
        {
            textNameRoom.Text = "";
            textPrice.Text = "";
          
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            LoadListRoomType();
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
                RoomTypeList.DataSource = RomTypeDAO.Instance.Search(search);
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            int row = dgvTypeRoom.CurrentCell.RowIndex;
            int RoomTypeId;
            Int32.TryParse(dgvTypeRoom.Rows[row].Cells[0].Value.ToString().Trim(), out RoomTypeId);
            try
            {
                if (MessageBox.Show("Bạn có thật sự muốn xoá loại phòng này!", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                {
                    RomTypeDAO.Instance.Delete(RoomTypeId);
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
            int row = dgvTypeRoom.CurrentCell.RowIndex;
            int RoomTypeId;
            Int32.TryParse(dgvTypeRoom.Rows[row].Cells[0].Value.ToString().Trim(), out RoomTypeId);
            string NameType = textNameRoom.Text;
            int Price = -1;
            Int32.TryParse(textPrice.Text, out Price);

            try
            {
                if (NameType == "" || Price == -1)
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin");
                    return;
                }
                else if (MessageBox.Show("Bạn có thật sự muốn sửa loại phòng này!", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                {
                    RomTypeDAO.Instance.Update(RoomTypeId, NameType, Price);
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
            string NameType = textNameRoom.Text;
            int Price = -1;
            Int32.TryParse(textPrice.Text, out Price);

            try
            {
                if (NameType == "" || Price == -1)
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin");
                    return;
                }
                else if (MessageBox.Show("Bạn có thật sự muốn thêm loại phòng này!", "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                {
                    RomTypeDAO.Instance.Insert(NameType, Price);
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

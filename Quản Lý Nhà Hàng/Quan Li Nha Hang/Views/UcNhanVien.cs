using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Quan_Li_Nha_Hang.Views
{
    public partial class UcNhanVien : UserControl
    {
        public UcNhanVien()
        {
            InitializeComponent();
        }
        //Khai Bao de phan biet luc sua va xoa
        public static UcNhanVien ucnv = new UcNhanVien();

        //khai bao ham hien thi danh sach nhan vien
        public void HienThiDanhSachNhanVien()
        {
            //tro toi data nhan vien...
            dgvNhanVien.DataSource = Models.NhanVienMod.FillDataSetNhanVien().Tables[0];
            dgvNhanVien.Dock = DockStyle.Fill;
            dgvNhanVien.BorderStyle = BorderStyle.Fixed3D;
        }

      
        private void UcNhanVien_Load(object sender, EventArgs e)
        {
            HienThiDanhSachNhanVien();
            
        }

        //tao ham de tro den du lieu tren datagridview
        void bingding()
        {
            txtMaNV.DataBindings.Clear();
            txtMaNV.DataBindings.Add("Text", dgvNhanVien.DataSource, "MaNV");
            txtTenNV.DataBindings.Clear();
            txtTenNV.DataBindings.Add("Text", dgvNhanVien.DataSource, "TenNV");
            dtpNgaysinh.DataBindings.Clear();
            dtpNgaysinh.DataBindings.Add("Text", dgvNhanVien.DataSource, "NgaySinh");
            txtDiachi.DataBindings.Clear();
            txtDiachi.DataBindings.Add("Text", dgvNhanVien.DataSource, "DiaChi");
            cbbGioiTinh.DataBindings.Clear();
            cbbGioiTinh.DataBindings.Add("Text", dgvNhanVien.DataSource, "GT");
            txtSDTNV.DataBindings.Clear();
            txtSDTNV.DataBindings.Add("Text", dgvNhanVien.DataSource, "SDT");
            txtLuong.DataBindings.Clear();
            txtLuong.DataBindings.Add("Text", dgvNhanVien.DataSource, "Luong");
            txtBoPhan.DataBindings.Clear();
            txtBoPhan.DataBindings.Add("Text", dgvNhanVien.DataSource, "MaBP");

        }
        //ham dis_end cac button khi load
        void dis_end(bool e)
        {
            txtBoPhan.Enabled = e;
            txtDiachi.Enabled = e;
            txtLuong.Enabled = e;
            txtMaNV.Enabled = e;
            txtSDTNV.Enabled = e;
            txtTenNV.Enabled = e;
            cbbGioiTinh.Enabled = e;
            dtpNgaysinh.Enabled = e;
            btnSua.Enabled = !e;
            btnThem.Enabled = !e;
            btnXoa.Enabled = !e;
            btnHuy.Enabled = e;
            btnLuu.Enabled = e;

        }
        //ham load gioi tinh cho Nhan Vien
        void loadControl()
        {
            cbbGioiTinh.Items.Clear();
            cbbGioiTinh.Items.Add("Nam");
            cbbGioiTinh.Items.Add("Nữ");
            cbbGioiTinh.Items.Add("Khác");
        }
        void clearData()
        {
            //txtNhanVien
            txtTenNV.Text = "";
            txtSDTNV.Text = "";
            txtLuong.Text = "";
            txtDiachi.Text = "";
            txtBoPhan.Text = "";
            loadControl();

        }
        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void label10_Click(object sender, EventArgs e)
        {

        }
    }
}

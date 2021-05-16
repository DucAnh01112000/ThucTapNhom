using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Quan_Li_Nha_Hang
{
    public partial class fMain : Form
    {
        public fMain()
        {
            InitializeComponent();
        }

        internal static List<byte> typePages = new List<byte>();
        public void ThemTabPages(UserControl uct, byte typeControl, string tenTab)
        {
            //kiem tra ton tai tap nay hay chua 
            for(int i = 0; i < tabHienThi.TabPages.Count; i++)
            {
                if(tabHienThi.TabPages[i].Contains(uct) == true)
                {
                    tabHienThi.SelectedTab = tabHienThi.TabPages[i];
                    return;
                }
            }
            TabPage tab = new TabPage();
            typePages.Add(typeControl);
            tab.Name = uct.Name;
            tab.Size = tabHienThi.Size;
            tab.Text = tenTab;
            tabHienThi.TabPages.Add(tab);
            tabHienThi.SelectedTab = tab;
            uct.Dock = DockStyle.Fill;
            tab.Controls.Add(uct);
            uct.Focus();
        }
        //dong tap hien tai
        public void DongTabHienTai()
        {
            tabHienThi.TabPages.Remove(tabHienThi.SelectedTab);
        }
        public void DongAllTap()
        {
            while(tabHienThi.TabPages.Count > 0)
            {
                DongTabHienTai();
            }
        }

        private void thoátToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            DialogResult dr = MessageBox.Show("Bạn có muốn thoát không", "Xác nhận", MessageBoxButtons.YesNo);
            if(dr == DialogResult.Yes)
            {
                this.Close();
            }
            else
            {
                return;
            }
        }

      

        private void fMain_Load(object sender, EventArgs e)
        {

        }
   
   

        private void nhânViênToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ThemTabPages(Views.UcNhanVien.ucnv, 4, "Quản lí nhân viên");
        }

        private void đóngTapHiệnTạiToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DongTabHienTai();
        }

        private void đóngTấtCảCácTapToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DongAllTap();
        }
    }
}

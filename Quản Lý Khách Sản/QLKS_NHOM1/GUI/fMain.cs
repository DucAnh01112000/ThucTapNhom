using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLKS_NHOM1.GUI
{
    public partial class fMain : Form
    {
        public fMain()
        {
            InitializeComponent();
        }

        private void fMain_Load(object sender, EventArgs e)
        {

        }

        private void quảnLýKháchHàngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fCustomer frm = new fCustomer();
            this.Hide();
            frm.ShowDialog();
            this.Show();
        }

        private void quảnLýLoạiPhòngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fRoomType frm = new fRoomType();
            this.Hide();
            frm.ShowDialog();
            this.Show();
        }

        private void quảnLýPhòngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fRoom frm = new fRoom();
            this.Hide();
            frm.ShowDialog();
            this.Show();
        }

        private void btndangxuat_Click(object sender, EventArgs e)
        {
            fLogin frm = new fLogin();
            this.Hide();
            frm.ShowDialog();
            this.Show();
        }

        private void quảnLýDịchVụToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fService frm = new fService();
            this.Hide();
            frm.ShowDialog();
            this.Show();
        }

        private void quảnLýHóaĐơnToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fBill frm = new fBill();
            this.Hide();
            frm.ShowDialog();
            this.Show();
        }

        private void hướngDẫnToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fTutorial frm = new fTutorial();
            this.Hide();
            frm.ShowDialog();
            this.Show();
        }
    }
}

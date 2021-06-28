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
    public partial class fTutorial : Form
    {
        public fTutorial()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if(pictureBox1.Visible == true)
            {
                pictureBox2.Visible = true;
                pictureBox3.Visible = false;
                pictureBox4.Visible = false;
                pictureBox5.Visible = false;
                pictureBox6.Visible = false;
                pictureBox7.Visible = false;
                pictureBox8.Visible = false;
                pictureBox1.Visible = false;
            }
            else if (pictureBox2.Visible == true)
            {
                pictureBox3.Visible = true;
                pictureBox1.Visible = false;
                pictureBox4.Visible = false;
                pictureBox5.Visible = false;
                pictureBox6.Visible = false;
                pictureBox7.Visible = false;
                pictureBox8.Visible = false;
                pictureBox2.Visible = false;
            }
            else if (pictureBox3.Visible == true)
            {
                pictureBox4.Visible = true;
                pictureBox1.Visible = false;
                pictureBox2.Visible = false;
                pictureBox5.Visible = false;
                pictureBox6.Visible = false;
                pictureBox7.Visible = false;
                pictureBox8.Visible = false;
                pictureBox3.Visible = false;
            }
            else if (pictureBox4.Visible == true)
            {
                pictureBox5.Visible = true;
                pictureBox1.Visible = false;
                pictureBox2.Visible = false;
                pictureBox3.Visible = false;
                pictureBox6.Visible = false;
                pictureBox7.Visible = false;
                pictureBox8.Visible = false;
                pictureBox4.Visible = false;
            }
            else if (pictureBox5.Visible == true)
            {
                pictureBox6.Visible = true;
                pictureBox1.Visible = false;
                pictureBox2.Visible = false;
                pictureBox3.Visible = false;
                pictureBox4.Visible = false;
                pictureBox7.Visible = false;
                pictureBox8.Visible = false;
                pictureBox5.Visible = false;
            }
            else if (pictureBox6.Visible == true)
            {
                pictureBox7.Visible = true;
                pictureBox1.Visible = false;
                pictureBox2.Visible = false;
                pictureBox3.Visible = false;
                pictureBox4.Visible = false;
                pictureBox5.Visible = false;
                pictureBox8.Visible = false;
                pictureBox6.Visible = false;
            }
            else if (pictureBox7.Visible == true)
            {
                pictureBox8.Visible = true;
                pictureBox1.Visible = false;
                pictureBox2.Visible = false;
                pictureBox3.Visible = false;
                pictureBox4.Visible = false;
                pictureBox5.Visible = false;
                pictureBox6.Visible = false;
                pictureBox7.Visible = false;
            }
            else if (pictureBox8.Visible == true)
            {
                pictureBox1.Visible = true;
                pictureBox7.Visible = false;
                pictureBox2.Visible = false;
                pictureBox3.Visible = false;
                pictureBox4.Visible = false;
                pictureBox5.Visible = false;
                pictureBox6.Visible = false;
                pictureBox8.Visible = false;

            }
        }
    }
}

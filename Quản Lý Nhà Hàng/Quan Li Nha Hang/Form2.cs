using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Quan_Li_Nha_Hang
{
    public partial class Form2 : Form
    {
        SqlConnection conection; 
        SqlCommand command;
        string str = @"Data Source=MAYTINH-57UP0I4\SQLEXPRESS;Initial Catalog=QUANLYNHAHANG;Integrated Security=True";
        SqlDataAdapter adapter = new SqlDataAdapter();
        DataTable table = new DataTable();
        void loadData()
        {
            command = conection.CreateCommand();
            command.CommandText = "spGetKhachHang";
            adapter.SelectCommand = command;
            table.Clear();
            adapter.Fill(table);
            dgv.DataSource = table;
        }
        public Form2()
        {
            InitializeComponent();
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            conection = new SqlConnection(str);
            conection.Open();
            loadData();

        }

        private void label10_Click(object sender, EventArgs e)
        {

        }
    }
}
